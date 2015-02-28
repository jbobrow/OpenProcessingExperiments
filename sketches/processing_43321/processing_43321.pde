
void setup()
{
 
  size(400, 400);
}
 
// draw loop
 
void draw()
 
{
  smooth();
  background (203,97,97);
 
  plant( width/2, height/2, 50); //draw character
}
 
//character function
 
void plant(int x, int y, int eye_size)
{ 
  noStroke ();
  fill (106, 4, 144);
  triangle (90, 250, 160, 250, 160, 350);
  triangle (265, 250, 310, 250,250, 335);
  triangle (200, 200, 310, 400, 90, 400);
  fill (0);
  rect (130, 270, 135, 230);
  
  fill(252, 226, 207);
  ellipse(85, 200, 45, 45);
  ellipse(315, 200, 45, 45);
  ellipse(200, 200, 200, 200);
  
  fill (0);
triangle (150, 220,250,220,200,260 );
fill (255);
triangle (160,220,180, 220,175, 235);
triangle (220, 220, 240, 220, 230, 235);
fill (188, 11, 47);
triangle (175, 240,225,  240, 200, 260); 

 
  eye( x - 40, y - 25, eye_size, eye_size / 3 );
  eye( x + 40, y - 25, eye_size, eye_size / 3); 
 
  fill(0);
  if (mousePressed) {
   ellipse (width/2, height/2 + 50, 60 , 0);
  }
  else {
   
    ellipse(width/2, height/2 + 35, 2, 0);
  }
}
 
 
void eye( int x, int y, float eye_size, float pupil_size )
{
  fill(0);
  if(mousePressed) {
    ellipse(x, y, eye_size *2, eye_size * 2);
  }
  else {
  ellipse(x, y, eye_size, eye_size);
  }
  fill(255);
  if(mousePressed) {
    ellipse(x, y, pupil_size * 2, pupil_size * 2);
  }
  else {
  ellipse(x, y, pupil_size, pupil_size);
}
 
}
                
                
