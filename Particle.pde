class Particle {
  private PVector pos;
  private PVector vel;
  private PVector acc;

  private PVector gravity;

  private color c;

  private float angle;
  private float r;
  private float d;

  float min;
  float max;


  public Particle(float x, float y, float r) {
    this.pos = new PVector(x, y);
    this.vel = new PVector(0, -4);
    this.acc = new PVector();

    this.gravity = new PVector(0, 0.5);

    this.r = r;
    this.d = r*2;
    this.angle = 0;

    this.c = color(0, 255, 255);
  }
  public void update() {
    this.pos.add(vel);
    this.vel.add(acc);
    this.acc.mult(0);

    this.vel.limit(8);

    addForce(this.gravity);

    angle = map(this.vel.y, -8, 8, -0.785, 0.785);

    if (this.pos.y > height || this.pos.y < 0) {
      resetGame();
    }
  }

  public void collition() {
    this.pos.y = height/2;
    this.vel.mult(0);
    addForce(new PVector(0, -4));
  }

  public void jump() {
    particle.addForce(new PVector(0, -20));
  }

  public void addForce(PVector force) {
    this.acc.add(force);
  }

  public void render() {
    stroke(c);
    fill(c, 75);
    strokeWeight(map(r, 5, 50, 1, 5));
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(angle);
    ellipse(0, 0, d, d );
    line(0, 0, r, 0);
    popMatrix();
  }
}