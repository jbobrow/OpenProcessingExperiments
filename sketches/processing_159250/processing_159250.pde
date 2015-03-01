
void setup(){
  size (500,500);
background(55);
}
 
void draw(){
 for(float i = 3; i< 15; i += .3) {
  noStroke();
  
  triangle(random(width),random(height),i,i,i,i);
  noSmooth();
   color c2 = color(20,random(160,100),random(200),random(50));
     fill(c2);
beginShape();
 
vertex(width/5, height/4);
bezierVertex(random(width), random(height), random(width), random(height),random(width), random(height));
endShape();
}
 

fill(225,0);
ellipse (50,255,width,height);
 }



