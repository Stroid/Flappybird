class Obsticle {
  float space;
  float lengthA;
  float lengthB;
  float w;

  PVector posA;
  PVector posB;

  color c;

  public Obsticle() {
    this.space = 100;
    this.lengthA = random(100, height-100);
    this.lengthB = height - this.lengthA - this.space;
    this.w = 50;

    this.posA = new PVector(width, 0);
    this.posB = new PVector(width, this.lengthA+this.space);
    
    c = color(0,255,0);
  }

  void update() {
    this.posA.x -= speed;
    this.posB.x -= speed;
  }
  void render() {
    stroke(c);
    fill(c, 50);
    rect(this.posA.x, this.posA.y, this.w, this.lengthA);
    rect(this.posB.x, this.posB.y, this.w, this.lengthB-1);
  }
}