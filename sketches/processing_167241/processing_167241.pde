
//write your own function to draw a parameterized arch
void arch(float curvature){
 float x= 280.0;
 float y= (100.0-curvature) /4.0;

strokeWeight(y);
noFill();
beginShape();
//three points to make an arch
vertex(20,y);
bezierVertex(20, x-curvature,45,45, 70,70);
bezierVertex(40,55,80,x-curvature, 85.0,y);
endShape();

}

void setup ()
{
  size(300,300,P2D);
  background(250,50,169);
smooth();
arch(50);
}



