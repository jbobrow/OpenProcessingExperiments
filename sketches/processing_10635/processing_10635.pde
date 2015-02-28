
class grid {
  float x;
  float y;
  float px = random(450);
  float py = random(450);
  String letter;
  boolean aan, geselecteerd;
  String code;
  float speed = 0.03;
  int vierkant = 30;
  
  grid(float xpos, float ypos, String let, String blokcode) {
    x = xpos;
    y = ypos;
    letter = let;
    code = blokcode;
  }
  
  void setXY(float xpos, float ypos, float s) {
    x = xpos;
    y = ypos;
    setSpeed(s);
  }
  
  void setSpeed(float s) {
    speed = s;
  }
  
  void tekenen() {
    if (aan == true) {
      stroke(0, 0, 255);
    } else if(geselecteerd == true) {
      stroke(0, 255, 0);
    } else {
      stroke(0);
    }
    strokeWeight(3);
    fill(255);
    px += (x-px)*speed;
    py += (y-py)*speed;
    rect(px, py, vierkant, vierkant);
    
    stroke(0);
    fill(0);
    textAlign(CENTER);
    textSize(15);
    text(letter, px+(vierkant/2), py+(vierkant/1.5));
    
  }
  
  boolean getAan() {
   return aan; 
  }
  
  String getCode() {
   return code; 
  }
  
  void setAan() {
   aan = true; 
  }
  
  void setUit() {
   aan = false; 
  }
  
  void geselecteerd() {
    geselecteerd = true;
  }
  
  boolean selected() {
   return geselecteerd; 
  }
  
  void klik(int mx, int my) {
    if (mx >= x && mx <= x+vierkant && my >= y && my <= y+vierkant) {
     if (aan == true) {
      setUit();
     } else {
      setAan(); 
     }
    }
  }
}

