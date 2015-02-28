

int y = 60;
int r= 12;
float e;
float easing = 0.01;


void setup(){
  size(400,400);
 smooth();
  
    }

 
void draw(){
   //background
   background(207,87,207);            
  noStroke();
  for (int y =0; y <= height; y += 40) {
    for (int x = 0; x<= width; x += 40) {
      fill(0,85);
      ellipse(x,y,40,40);
    }}
  //body
  
  fill(255);
  ellipse(mouseX, mouseY, y*3, y*3);
  ellipse(mouseX/2, mouseY/2, y, y);
  stroke(0);
  strokeWeight(2);
  line(mouseX,mouseY-90,mouseX/2,mouseY/2-30);
   //green eye
   fill(58,87,38);
   ellipse(mouseX,mouseY,80,80);
   fill(0);
   ellipse (mouseX,mouseY,50,50);
 //red eye
 if (mousePressed) {
   fill(207,87,87);
   ellipse (mouseX,mouseY,80,80);
   fill(0);
   ellipse (mouseX,mouseY,50,50);

 }
float targetX = mouseX;
e+= (targetX - e) * easing;
ellipse(e,40, r, r);



}

