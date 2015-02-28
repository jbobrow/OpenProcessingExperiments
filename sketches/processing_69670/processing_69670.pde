
float x,y, deltay, deltax;

void setup () {
  size(400,400);
  strokeWeight(10);
  deltax = random (2,5);
  deltay = random (2,5);
}

void draw() {

  x = x + deltax;
  y = y + deltay;
  
  background(255);
  if(x > width || x < 0) {
    deltax = -deltax;
  }
  if(y > height || y < 0) {
    deltay = -deltay;
  }
      point(x,y);
  
  
  if(mousePressed) {
     //deltax = 0;
     //deltay = 0; 
    fill(0);
    rect(0,0, width, height);
    stroke(255);
    point(x,y);
    stroke(0);      
  }
  //saveFrame("hw4.jpg");
 }
  
void keyPressed() {
   if(key == CODED) {
     if(keyCode == RIGHT) {
      deltax++;
      deltay++;
     }
     if(keyCode == LEFT) {
       deltax--;
       deltay--;
     }
   }
   }







