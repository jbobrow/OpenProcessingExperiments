

void setup()
{
  size(500,500);
}


void draw()
{
  background(255);
 for( float y=0; y<500; y=y+70)
 {
   for( float x=0; x<500; x=x+70)
   {
     noStroke();
     fill(mouseX,mouseY,150);
     pushMatrix();
     translate(x,y);
     rotate(radians(frameCount+x));
     scale(0.3);
     mydraw();
     popMatrix();
   }
 }
}






void mydraw()
{
strokeWeight(5);
stroke(100);
fill(244,212,219);
beginShape();
vertex(-80,100);
vertex(-80,-40);
vertex(-40,-40);
vertex(-40,10);
vertex(50,10);
vertex(50,-40);
vertex(90,-40);
vertex(90,100);
endShape();
 
 
strokeWeight(1);
stroke(100);
fill(255);
ellipse(-40,40,30,30);
ellipse(50,40,30,30);
 
fill(100);
ellipse(-35,40,20,20);
ellipse(55,40,20,20);
 
 
fill(232,152,168);
stroke(232,152,168);
ellipse(10,70,5,5);
line(10,70,10,100);
 
 
//수염좌우
stroke(150);
line(30,80,70,70);
line(30,85,70,85);
line(30,90,70,100);
 
line(-10,80,-50,70);
line(-10,85,-50,85);
line(-10,90,-50,100);


}

                
