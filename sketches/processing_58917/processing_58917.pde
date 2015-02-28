
PImage b;

int x = 0;
int y = 0;
 
void setup() {
  size (1500, 1500);
  frameRate(50000);
  noStroke();
  smooth();
  b =  loadImage ("beezelbub.jpg");
}
 
void draw() {
   image (b, random(0, 70), random(0, 70), 1450, 1300);
      tint (random (255), random(255), random(255), 3);

  
   
  if( x==0 ){
  fill(random(255), random(255), random(255), 11);
  ellipse(random(1500), random (1500), 250, 250);
  fill (155);
  }
   
  
  
  if( y==0 ){
  fill(164,random (218), 242, 11);
  ellipse(random(200,1300), random (200,1300), 100, 100);
  fill (155);
  }
   
   
 
}


 
void mousePressed() {
  if(x == 0) {
    x = 1;
  } else {
    x = 0;
  }
}

