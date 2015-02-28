
void setup()
{

size(500,500);
background(0);


}
void draw()

{
  background(0);
translate(width/2,height/2);
fill(#00FFDF);
stroke(#00FFDF);


fill(0);
stroke(#00FFDF);

ellipse(0,0,470,470);

fill(#00FFDF);
stroke(#00FFDF);






float sec = map (second(), 0, 60,0,360);
pushMatrix();
rotate(radians(sec));
stroke(#00FFDF);
strokeWeight(3);
line(0,170,0,0);
popMatrix();

float min = map ( minute(), 0,60,0,360);
pushMatrix();
rotate(radians(min));
stroke(#00FFDF);
strokeWeight(10);
line(0,-110,0,0);
popMatrix();

float ho = map ( hour(), 0,12,0, 360);
pushMatrix();
rotate(radians(ho));
stroke(#00FFDF);
strokeWeight(20);
line(0,0,0,-60);
noStroke();
popMatrix();



for ( int i=0; i<360; i+=90){
  pushMatrix();
  rotate(radians(i));
  translate(0,180);
 rect(-10,0,20,40);
  popMatrix();
  
  for ( int u=0; u<360; u+=30)
  {
    
  pushMatrix();
  rotate(radians(u));
  translate(0,190);
 rect(-5,0,10,20);
  popMatrix();
  }
  
}
}



