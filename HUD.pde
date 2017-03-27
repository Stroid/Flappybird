class HUD {
  String message = "";
  
  int size = 16;
  public HUD() {
  }
  public void render() {
    addMessage("Score: " + score);
    addMessage("Hight Score " + highScore);
    
    fill(255);
    textSize(size);
    text(message, 20, size+size*0.33);
    
    message = "";
  }
  public void addMessage(String str) {
    message += str + "\n";
  }
}