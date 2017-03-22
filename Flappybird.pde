Particle particle;
ArrayList<Obsticle> ObsticleHandler;

color bgColor = color(0);

int speed;

void setup() {
  size(500, 400);

  particle = new Particle(75, height/2, 10);
  ObsticleHandler = new ArrayList<Obsticle>();

  createObsticle();
}

void draw() {

  update();
  render();

  if (keyPressed) {
    if (key == ' ') {
      particle.addForce(new PVector(0, -2));
    }
  }
}


void update() {
  particle.update();

  for (int I = ObsticleHandler.size()-1; I >= 0; I--) {
    Obsticle tempObsticle = ObsticleHandler.get(I);

    tempObsticle.update();
  }
}

void render() {
  background(bgColor);
  particle.render();
  for (int I = ObsticleHandler.size()-1; I >= 0; I--) {
    Obsticle tempObsticle = ObsticleHandler.get(I);

    tempObsticle.render();
  }
}


void createObsticle() {
  ObsticleHandler.add(new Obsticle());
}