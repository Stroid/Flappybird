class Particle {
  private PVector pos;
  private PVector vel;
  private PVector acc;

  public PVector gravity;

  private int r;
  private int d;
  private float angle;

  private color COLOR = #00ffff;

  public Particle(int x, int y, int r) {
    this.pos = new PVector(x, y);
    this.vel = new PVector(0, -1);
    this.acc = new PVector();

    this.gravity = new PVector(0, 0.2);

    this.r = r;
    this.d = r*2;
    this.angle = 0;
  }

  public void update() {
    this.pos.add(vel);
    this.vel.add(acc);
    this.acc.mult(0);

    addForce(gravity);

    if (this.pos.y > height | this.pos.y < 0) {
      collition();
    }
  }

  public void render() {
    stroke(COLOR);
    fill(COLOR, 100);

    strokeWeight(map(r, 0, 100, 1, 5));
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(angle);

    ellipse(0, 0, this.d, this.d);
    line(0, 0, r, 0);

    popMatrix();
  }

  public float getX() {
    return this.pos.x;
  }
  public float getY() {
    return this.pos.y;
  }

  public void collition() {
    this.pos.y = height/2;
    this.vel.mult(0);
  }

  public void addForce(PVector force) {
    this.acc.add(force);
  }
}