
int ellipseWidth = 20;
int ellipseHeight = 10;
int posX;
int posY = 10;
float r = .1;

void setup(){
  size(600,600);
  background(156,36,170);
}

void draw(){
 smooth();
 background(156,36,170);
 for(int i = width/20; i < width; i += width/20){
  for(int k = height/20; k < height; k += height/20){
   translate(i,k);
   posX = 0;
   posY = 0;
   rotate((i + k) * -.01);
   noStroke();
   fill(255);
   ellipse(posX,posY, ellipseWidth + 5, ellipseHeight + 5);
   fill(0);
   beginShape();
   vertex(posX - ellipseWidth/2 - 3, posY);
   bezierVertex(posX - ellipseWidth/2 - 3, posY + 10, posX + ellipseWidth/2 + 3, posY + 10, posX + ellipseWidth/2 + 3, posY); 
   endShape();
   fill(57,193,82);
   ellipse(posX, posY, ellipseWidth, ellipseHeight);
   resetMatrix();
  }
 }

}


