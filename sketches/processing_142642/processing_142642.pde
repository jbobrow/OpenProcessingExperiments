
void setup ()
{
  size (500,500);
  background (255);
}


void draw ()
{ 
  //Dreieck
  pushMatrix();
  float rot = map (second(), 0, 100, 20, 200);
  translate(width/2,height/2);
  rotate(rot*radians(90));
  rotate (millis()/10.0);
  noFill ();
  stroke(random(255), random(255), random(255), random(255)); 
  triangle(140, 105, 180, 50, 180, 170);  
  popMatrix(); 
  //Dreieck END
  
  // Ellipse 
  pushMatrix (); 
  float pos = map (second(), 0, 50, 20, 480);
  translate (width/2,height/2);
  rotate (millis()/500.0);
  noFill ();
  stroke (random(255), random(255), random(255), random(255));
  ellipse (50,-50, 70, 50);
  popMatrix ();
  // Ellipse END


  //Random
  int x=int(random(500));
  int y=int(random(500));
  int z=int(random(10));
  strokeWeight(z);
  ellipse(x, y, 10,10);
  //Random END
}
