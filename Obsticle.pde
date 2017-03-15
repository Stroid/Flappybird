class Obsticle {
  private PVector pos;

  private float Width, Height;

  private color c;

  public Obsticle(float Y, float H) {
    this.pos = new PVector(width, Y);
    this.Width = 50;
    this.Height = H;

    this.c = #00ff00;
  }

  public void update() {
    this.pos.x -= SPEED;

    collition(bird.getX(), bird.getY());
  }

  public void render() {
    stroke(c);
    fill(c, 100);
    rect(this.pos.x, this.pos.y, this.Width, this.Height);
  }

  public void collition(float x, float y) {
    if (x > this.pos.x) {
      if (x < this.pos.x + this.Width) {
        if (y > this.pos.y) {
          if (y < this.pos.y + this.Height) {
            c = #ff0000;
            bird.collition();
            return;
          }
        }
      }
    }
    c = #00ff00;
  }
}