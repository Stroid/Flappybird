class ObsticleHandler {
  ArrayList<Obsticle> handler = new ArrayList();

  public void update() {
    for (int I = handler.size()-1; I >= 0; I--) {
      //place the current obsticle in a temperary object for readability.
      Obsticle tempObsticle = this.handler.get(I);

      //Update the obsticle.
      tempObsticle.update();
      
      //Test if the obsticle has passed the particle and if true add one to the score count.
      if (tempObsticle.posA.x + tempObsticle.w <= particle.pos.x && !tempObsticle.passed)
      {
        score++;
        tempObsticle.passed = true;
      }

      //Test if the obsticle has passed the left border and if true remove the obsticle.
      if (tempObsticle.posA.x < -tempObsticle.lengthA) 
      {
        removeObsticle(tempObsticle);
      }

      //Test if the particle has collided with the obsticle and if true reset the game.
      if (collition(tempObsticle.posA, tempObsticle.w, tempObsticle.lengthA, particle.pos) ||
      collition(tempObsticle.posB, tempObsticle.w, tempObsticle.lengthB, particle.pos))
      {
        resetGame();
        break;
      }
    }
  }

  public void render() {
    for (int I = this.handler.size()-1; I >= 0; I--) {
      Obsticle tempObsticle = this.handler.get(I);

      tempObsticle.render();
    }
  }

  public void addObsticle() {
    this.handler.add(new Obsticle());
  }
  public void removeObsticle(Obsticle o) {
    this.handler.remove(o);
  }
  public void clearHandler() {
    this.handler.clear();
  }
}