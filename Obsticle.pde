class Obsticle {
  float space;
  float lengthA;
  float lengthB;
  float w;

  PVector posA;
  PVector posB;

  public Obsticle() {
    this.space = 100;
    this.lengthA = random(50, height-50);
    this.lengthB = height - this.lengthA - this.space;
    this.w = 50;

    this.posA = new PVector(width-this.w, 0);
    this.posB = new PVector(width-this.w, this.lengthA+this.space);
  }

  void update() {
    this.posA.x -= speed;
    this.posB.x -= speed;
  }
  void render() {
    fill(255, 50);
    rect(this.posA.x, this.posA.y, this.w, this.lengthA);
    rect(this.posB.x, this.posB.y, this.w, this.lengthB-1);
  }
}