
void setup()
{
  size(400,600);
  smooth();
  background(33,243,255,80);
  frameRate(5);
}
  
void draw (){
  fill(random(200,150),random(200),random(200),100);
  
  noStroke();
   
  ellipse(random(0,width),random(0,height));
}
  
 void ellipse(float x, float y)
  {
    
 
pushMatrix();
translate(x,y);
rotate(radians(random(0,360)));
scale(0.5,1.5);
smooth();
beginShape();
vertex(90, 39);
bezierVertex(230,30,60,240,70,250);
bezierVertex(60,155,230,165,20,45);
endShape();
popMatrix();
 }
