
class Attractor {
  int type;
  float x, y, mass;
  int G, size;
  boolean isOn, isOver, isPressed, isLocked;
  
  Attractor ( int tType, float tx, float ty, float tmass ) {
    type = tType;
    x = tx;
    y = ty;
    isOver = isPressed = isOn = false;
    mass = tmass;
    G = 100;
    size = 5;
  }

  void dragCheck(){
      float distance = sqrt( sq(mouseX-x)+sq(mouseY-y));
      if ( distance < 10 ) {
         isOver = true;
         if ( mousePressed && mouseButton == LEFT ) isPressed = true;
      } else isOver = false;
      if ( isPressed && !isPlaying ) {
        dragMe = this;
        isDragging = true;
      }
  }
  
  void Update() {
    x = mouseX;
    y = mouseY;
  }
  
  void display() {
    if ( type == 1 )
      fill (0,G,0);
    else 
      fill (G,0,0);
      
    if ( isOver ) stroke(100);
      else stroke (150);
    
    ellipse(x,y,size,size);
  }
  
  void toggle() {
    //OFF
    if ( this.isOn  ) {
      this.isOn = false;
      this.G = 0;
      this.mass = 0;
    }
    //ON
    else {
      this.isOn = true;
      this.G = 30;
      this.mass = ATTRACTION;
    }
  }
}

void addAttractor( Attractor[] As, int Type, float posx, float posy, float Amass) {
  for ( int i = 0; i < As.length; i++ ){
    if ( As[i] == null ) {
      As[i] = new Attractor ( Type, posx, posy, Amass );
      break;
    }
  }
}


