
int x = 0;
int speed = 13;
int y= 0;


void setup () {
  size (600,600);
  background(255,255,255);
}


  void draw() {
    if (mousePressed) {
      noStroke();
      fill(0,193,188,15);
      triangle(mouseX,mouseY, 100,0,0,0);
    noStroke();
    fill(18,11,216,5);
    ellipse(x, 500, 50, 50);
  
  x = x + speed;
  
  if ( x == 650) {
    speed = -13;
   }
  if ( x < 0 ) {
    speed = 13;
  }
 

  

    fill(18,11,216,5);
    ellipse(500, y, 50, 50);
  
  y = y + speed;
  
  if ( y == 650) {
    speed = -13;
   }
  if ( y < 0 ) {
    speed = 13;
  }
 } 
 else {
     noStroke();
      fill(3,255,34,5);
      triangle(mouseX,mouseY, 100,0,0,0);
    
    }
    
  }
  
 


