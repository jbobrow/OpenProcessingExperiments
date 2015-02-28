
void setup()
{

  size(400, 400);
}

// draw loop

void draw()

{
  smooth();
  background(255); //background colour

  plant( width/2, height/2, 70); //draw character
}

//character function

void plant(int x, int y, int eye_size)
{  
  fill(46, 126, 79);
  ellipse(85, 180, 75, 75);
  ellipse(315, 180, 75, 75);
  ellipse(200, 200, 200, 200);

  fill(52, 22, 11);
  ellipse(width/2, height/2, 25, 25);

  fill(52, 22, 11);
  ellipse(80, 220, 10, 20);

  eye( x - 50, y - 50, eye_size * 0.8, eye_size / 3 );
  eye( x + 50, y - 50, eye_size,       eye_size / 10);  

  fill(0); 
  if (mousePressed) {
    ellipse(width/2, height/2 + 50, 30, 30);
  } 
  else {
    ellipse(width/2, height/2 + 50, 40, 0);
  }
}


void eye( int x, int y, float eye_size, float pupil_size )
{
  fill(255);
  if(mousePressed) {
    ellipse(x, y, eye_size * 2, eye_size * 2);
  }
  else {
  ellipse(x, y, eye_size, eye_size);
  }
  fill(0);
  if(mousePressed) {
    ellipse(x, y, pupil_size * 2, pupil_size * 2);
  }
  else { 
  ellipse(x, y, pupil_size, pupil_size);
}

}
