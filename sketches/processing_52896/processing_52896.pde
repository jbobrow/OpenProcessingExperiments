
// Declarer deux tableaux pour emmagasiner les touches appuyees.
boolean[] touches;
boolean[] touchesCodees;

float x,y;

void setup() {
  size(400,400);
  smooth();
  
  touches = new boolean[256];
  touchesCodees = new boolean[256];
  
  x = width/2;
  y = height / 2;

}


void draw() {
  background(0);
  
   if ( touches['w'] == true || touchesCodees[UP] == true ) {
     y--;
  }
 
  if ( touches['d'] == true || touchesCodees[RIGHT] == true ) {
    x++;
  }
 
  if ( touches['a'] == true || touchesCodees[LEFT] == true ) {
    x--;
  }
  
  if ( touches['s'] == true || touchesCodees[DOWN] == true ) {
    y++;
  }  
  
  ellipse(x,y,30,30);
  
}




void keyPressed() {
 
  if ( key == CODED ) {
    touchesCodees[keyCode] = true;
  }
  else {
    touches[key] = true;
  }
}
 
 
void keyReleased() {
 
  if ( key == CODED ) {
    touchesCodees[keyCode] = false;
  }
  else {
    touches[key] = false;
  }
}
 

