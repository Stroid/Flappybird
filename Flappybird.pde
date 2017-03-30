/*
  Reminder: merge Conflict!!!

<<<<<<< HEAD
  Todo list:
  *Add a ObsticleHandler
  *Move all the obsticle stuff to the handler
=======
ToDo:

Implement a hightscore system that keeps the score after a restart.
>>>>>>> 165f92f363a74e996e45d8a71948747f3145d2ab
*/

Particle particle;
ArrayList<Obsticle> ObsticleHandler;

HUD hud;

color bgColor = color(0);

int speed;
int score = 0;
int highScore = 0;

float time, lastTime;



void setup() {
  size(500, 400);

  particle = new Particle(75, height/2, 10);
  ObsticleHandler = new ArrayList<Obsticle>();
  hud = new HUD();

  speed = 3;

  time = 1000;
  lastTime = millis();
}

void draw() {

  if (millis() - lastTime > time) {
    createObsticle();
    lastTime = millis();
  }

  update();
  render();
}

void keyPressed() {
  if (key == ' ') {
    particle.jump();
  }
}


void update() {
  particle.update();



  updateObsticles();
}

void render() {
  background(bgColor);
  particle.render();

  //render the obsticle.
  renderObsticles();

  hud.render();
}

void resetGame() {
  particle.collition();

  if (score > highScore) {
    highScore = score;
  }
  score = 0;
}

void updateObsticles() {
  for (int I = ObsticleHandler.size()-1; I >= 0; I--) {
    Obsticle tempObsticle = ObsticleHandler.get(I);

    tempObsticle.update();

    if (tempObsticle.posA.x + tempObsticle.w <= particle.pos.x && !tempObsticle.passed) {
      score++;
      tempObsticle.passed = true;
    }

    if (tempObsticle.posA.x < -tempObsticle.lengthA) {
      ObsticleHandler.remove(tempObsticle);
    }

    //Test if the particle has collided whit obsticle 'A'.
    if (collition(tempObsticle.posA, tempObsticle.w, tempObsticle.lengthA, particle.pos)) {
      resetGame();
    }

    //Test if the particle has collided whit obsticle 'B'.
    if (collition(tempObsticle.posB, tempObsticle.w, tempObsticle.lengthB, particle.pos)) {
      resetGame();
    }
  }
}

void renderObsticles() {
  for (int I = ObsticleHandler.size()-1; I >= 0; I--) {
    Obsticle tempObsticle = ObsticleHandler.get(I);

    tempObsticle.render();
  }
}


boolean collition(PVector a, float w, float h, PVector b) {

  if (a.x < b.x)
    if (a.y < b.y)
      if (a.x + w > b.x)
        if (a.y + h > b.y)
          return true;

  return false;
}

void createObsticle() {
  ObsticleHandler.add(new Obsticle());
<<<<<<< HEAD
}
=======
  
}
>>>>>>> 165f92f363a74e996e45d8a71948747f3145d2ab