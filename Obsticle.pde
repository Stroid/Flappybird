class Obsticle {
  PVector posA;
  PVector posB;

  float space;
  float lengthA;
  float lengthB;
  float w;

  public Obsticle() {
    this.posA = new PVector(0, 200);
    this.posB = new PVector(200, 200);

    this.space = 100;
    this.lengthA = 200;
    this.lengthB = 200;
    this.w = 50;
  }

  void update() {
  }
  void render() {
    rect(this.posA.x, this.posA.y, this.w, this.lengthA);
    rect(this.posB.x, this.posB.y, this.w, this.lengthB);
  }
}