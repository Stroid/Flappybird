//UI branch

/*
 Todo list:
 *Make a Todo list
 *Make a paus screen
 *Make a Highscore screen
 *Implement a hightscore system that keeps the score after a restart.
 */

Particle particle;
ObsticleHandler handler;
HUD hud;

color bgColor = color(0);

//Select what display currently is active in the ui.
int display = 0;

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
  switch(display) {
  case 1:
    particle.update();

    handler.update();
    break;
  }
}

void render() {
  background(bgColor);

  switch(display) {
  case 0:
    textAlign(CENTER);
    rectMode(CENTER);
    
    fill(255);
    textSize(32);
    text("FlappyParticle", 250, 100);
    
    stroke(255);
    fill(0);
    textSize(24);
    rect(250, 175,textWidth("New Game")+10,50);
    fill(255);
    text("New Game", 250,  185);
    
    
    textAlign(LEFT);
    rectMode(LEFT);
    break;
  case 1:
    particle.render();

    handler.render();

    hud.render();
    break;
  }
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