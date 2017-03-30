/*
 Todo list:
   *Make a paus screen
   *Make a Highscore screen
   *Implement a hightscore system that keeps the score after a restart.
*/

Particle particle;
ObsticleHandler handler;
HUD hud;

color bgColor = color(0);

//Mode = what screen is currently displayed
int mode = 1;

int speed;
int score = 0;
int highScore = 0;

float time, lastTime;



void setup() {
  size(500, 400);

  particle = new Particle(75, height/2, 10);
  handler = new ObsticleHandler();
  hud = new HUD();

  speed = 3;

  time = 1000;
  lastTime = millis();
}

void draw() {

  if (millis() - lastTime > time) {
    handler.addObsticle();
    lastTime = millis();
  }

  update();
  render();
}

void keyPressed() {
  if (key == ' ') {
    particle.jump();
  }
}


void update() {
  particle.update();

  handler.update();
}

void render() {
  background(bgColor);
  particle.render();

  handler.render();

  hud.render();
}

void resetGame() {
  particle.collition();
  handler.clearHandler();


  if (score > highScore) {
    highScore = score;
  }
  score = 0;
}

boolean collition(PVector a, float w, float h, PVector b) {

  if (a.x < b.x)
    if (a.y < b.y)
      if (a.x + w > b.x)
        if (a.y + h > b.y)
          return true;

  return false;
}