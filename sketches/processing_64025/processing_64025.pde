
void setup ()
{
 size (600, 600);
 background (255); 
}

void draw ()
{
  
  //shirt
  fill (68, 240, 238);
  ellipse (width/2, 600, 450, 450);
  fill (0);
  rect (290, 450, 15, 250);
  
  //head
  fill (255, 238, 180);
  ellipse (width/2, height/2, 400, 400);
 
  //mouth
  strokeWeight (10);
  arc (width/2, 450, 100, 20, PI, 2 * PI ); 
  
  //eyes
  fill (255);
  ellipse (225, 285, 150, 150);
  ellipse (375, 285, 150, 150);
  fill (0);
  ellipse (260, 285, 15, 15);
  ellipse (335, 285, 15, 15);
  
  // hair
  fill (254, 255, 46);
  beginShape ();
  vertex (width/2, 150);
  vertex (width * 3/4, 200);
  vertex (width * 3/5, 125);
  vertex (width * 4/5, 130);
  vertex (width * 4/7, 100);
  vertex (width * 5/8, 60);
  vertex (width/2, 95);
  vertex (width/3, 60);
  vertex (225, 90);
  vertex (130, 170);
  vertex (190, 150);
  vertex (210, 200);
  vertex (width/2, 150);
  endShape ();
  
  
  
}
