
int diameter=10;
int x=int(random(0,1000));
int y=int(random(0,1000));

void setup() {
 size (1000,1000); //P3D
 background(0);
 smooth();
 frameRate(10);
}

void draw() {
  strokeWeight(3);
  noFill();
  if(key == CODED) {
    
    if(keyCode == UP) {
     if(keyPressed) {
       for(diameter=10;diameter<500;diameter=diameter+50) {
     stroke(255,0,0);
     ellipse(x, y, diameter, diameter);
     } 
   }
 }
 if(keyCode == RIGHT) {
     if(keyPressed) {
       for(diameter=10;diameter<500;diameter=diameter+50) {
     stroke(0,255,0);
     ellipse(x, y, diameter, diameter);
     }
   } 
 }
 if(keyCode == LEFT) {
     if(keyPressed) {
       for(diameter=10;diameter<500;diameter=diameter+50) {
     stroke(0,0,255);
     ellipse(x, y, diameter, diameter);
     } 
   }
 }
 
   x=int(random(0,width));
   y=int(random(0,height));
   diameter=10;
}
  if(mousePressed) {
  background(0);
  }
}


