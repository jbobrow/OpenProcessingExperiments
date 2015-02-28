
void setup()
{
  size(500,500);
  background(255);
  //frameRate()
}

void draw()
{
 background(255);
 noFill();
 translate(width/2,height/2);
 
 background(255);
 noFill();
 translate(0,0);
 
 fill(0);
 ellipse(0, 0,50,50);
 
 float bewegung = map(mouseY, mouseX, 550, 0,3*PI);
 
  pushMatrix();
 rectMode(CENTER);
 translate(bewegung,0);
 println(mouseX);
 println(bewegung);
 noFill(); 
 ellipse(150, 0,50,50);
 popMatrix();
 
   pushMatrix();
 rectMode(CENTER);
 translate(-bewegung,0);
 println(mouseX);
 println(bewegung); 
 ellipse(-150, 0,50,50);
 popMatrix();
 
 rotate(90);
  pushMatrix();
 rectMode(CENTER);
 translate(bewegung,0);
 println(mouseX);
 println(bewegung); 
 ellipse(150, 0,50,50);
 popMatrix();
 
   pushMatrix();
 rectMode(CENTER);
 translate(-bewegung,0);
 println(mouseX);
 println(bewegung); 
 ellipse(-150, 0,50,50);
 popMatrix();
 
 rotate(90);
  pushMatrix();
 rectMode(CENTER);
 translate(bewegung,0);
 println(mouseX);
 println(bewegung); 
 ellipse(150, 0,50,50);
 popMatrix();
 
   pushMatrix();
 rectMode(CENTER);
 translate(-bewegung,0);
 println(mouseX);
 println(bewegung);
 fill(0,255,0); 
 ellipse(-150, 0,50,50);
 popMatrix();
 
}
