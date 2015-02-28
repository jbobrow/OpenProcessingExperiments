
class Mary {
  float x, y;

  Mary() {
    x = 0;
    y = 0;
  }

  void display() {
    x = mouseX-10;
    y = mouseY+30;
      
    //face
    fill(#FFCC99);
    ellipse(x,y,20,20);
    
    //neck
    fill(#FFCC99);
    rectMode(CENTER);
    rect(x,y+10,5,10);
    
    //torso
    fill(#CC0033);
    rect(x,y+30,20,30);
    
    //skirt
    fill(#CC0033);
    quad(x-10,y+40, x+10,y+40, x+20,y+60, x-20,y+60);
    
  }
}

