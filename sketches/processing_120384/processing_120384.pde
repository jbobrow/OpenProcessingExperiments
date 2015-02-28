
void setup()
{
size(500,500);

}
void draw()
{
    pushMatrix();
  stroke(255);
  fill (255);
rect(210,30,80,320);
translate(width/2,height/2);
ellipse(0,140,130,130);
fill(0);


rect(-40,-200,20,5);
rect(-40,-175,20,5);
rect(-40,-150,20,5);
rect(-40,-125,20,5);
rect(-40,-100,20,5);
rect(-40,-75,20,5);
rect(-40,-50,20,5);
rect(-40,-25,20,5);
rect(-40,0,20,5);
rect(-40,25,20,5);
rect(-40,50,20,5);
rect(-40,75,20,5);
popMatrix();

  pushMatrix();
  int sec= second()*5;
 
  noStroke();
  fill(255,0,0);
 // translate(width/2,height/2);
  rect(280,325,2,-sec);
  popMatrix();
  fill (0);
  translate (280, 330);
  for (int i=0; i<60; i+=1){
   
  translate (0,-5);
  rect(0,0,10,1);
}
  //translate(width/2,height/2);
  int min= minute()*5;
  fill(0);
  noStroke();
  rect(-50,300,2,-min);
   
   
  int h= hour()*11;
  fill(0);
  noStroke();
  rect(-40,300,10,-h);
}
