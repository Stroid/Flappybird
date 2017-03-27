Particle particle;
ArrayList<Obsticle> ObsticleHandler;

HUD hud;

color bgColor = color(0);

int speed;

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
    particle.addForce(new PVector(0, -20));
  }
}


void update() {
  particle.update();

  //Update the Obsticles
  for (int I = ObsticleHandler.size()-1; I >= 0; I--) {
    Obsticle tempObsticle = ObsticleHandler.get(I);

    tempObsticle.update();

    if (tempObsticle.posA.x < -tempObsticle.lengthA) {
      ObsticleHandler.remove(tempObsticle);
    }
  }
}

void render() {
  background(bgColor);
  particle.render();
  
  //render the obsticle.
  for (int I = ObsticleHandler.size()-1; I >= 0; I--) {
    Obsticle tempObsticle = ObsticleHandler.get(I);

    tempObsticle.render();
  }

  hud.render();
}


void createObsticle() {
  ObsticleHandler.add(new Obsticle());
}