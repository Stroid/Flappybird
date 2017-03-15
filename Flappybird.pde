Particle bird;

ArrayList<Obsticle> obsticles;

color BG_COLOR = color(50);

final int SPEED = 2;

int time = 1500;
int currTime;
int lastTime;

void setup() {
  size(500, 400);
  bird = new Particle(50, 200, 10);

  obsticles = new ArrayList<Obsticle>();
  lastTime = millis();

}

void draw() {
  background(BG_COLOR);
  bird.update();
  bird.render();
  
  currTime = millis();
  println(currTime, lastTime+time);
  if(currTime > lastTime + time){
    generateObsticles();
    lastTime = currTime;
  }
  
  for (int I = obsticles.size()-1; I > -1; I--) {
    Obsticle obst = obsticles.get(I);

    obst.update();
    obst.render();

    if (obst.pos.x < -obst.Height) {
      obsticles.remove(obst);
    }
  }

  if (keyPressed) {
    if (key == ' ') {
      bird.addForce(new PVector(0, -0.8));
    }
  }
}

void generateObsticles() {
  float H = random(100, height-100);
  int s = 100;
  obsticles.add(new Obsticle(0, H));
  obsticles.add(new Obsticle(H+s, width-H+s));
}