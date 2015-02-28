
int d= 40;
float xPos= 200;
float yPos= 200;
float x= 200;
float y= 200;

int directionX = 1;
int directionY = 1;

float dis;

void setup () {
  size (400, 400);
  
}

void draw () {
  rect (200, 200, 200, 200);
  background (215, 240, 242);

// pallina
  ellipse (xPos, yPos, d, d);

  if (keyCode == RIGHT) {
    xPos= xPos+2;
  }
  if (keyCode == LEFT) {
    xPos= xPos-2;
  }
  if (keyCode == DOWN) {
    yPos= yPos+2;
  }
  if (keyCode == UP) {
    yPos= yPos-2;
  }

  if (xPos> 300) {
    noStroke ();
    fill (18, 130, 139);
    d= 400;
    
    }else if (yPos> 300){
  fill (120, 178, 183);
    d= 200;
    
  }else if (xPos< 150){
  fill (73, 177, 185);
    d= 20;
    
    }else if (yPos< 150){
  fill (4, 205, 222);
    d= 100;
  
     
  }else{
    noStroke ();
    fill (255);
    d=40;
  }
  
 


  
}
