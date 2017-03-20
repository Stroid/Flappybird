class Particle {
  private PVector pos;
  private PVector vel;
  private PVector acc;

  private PVector gravity;

  private color c;

  private float angle;
  private float r;
  private float d;


  public Particle(float x, float y, float r) {
    this.pos = new PVector(x, y);
    this.vel = new PVector();
    this.acc = new PVector();

    this.gravity = new PVector(0,2);

    this.r = r;
    this.d = r*2;
    
    c = color(0,255,255);
  }
  public void update() {
    this.pos.add(vel);
    this.vel.add(acc);
    this.acc.mult(0);
    
    addForce(this.gravity);
  }

  public void render() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(angle);
    popMatrix();
  }
  
  public void addForce(PVector force){
    this.acc.add(force);
  }
}