

int a;
PFont font;
float x = 44; // X-coordinate of text
float y = 51; // Y-coordinate of text
float f = 255;
float s = 160;
float d = 95;
float q = 50;
float w = 5;
boolean wPressed, aPressed, sPressed, dPressed;

void setup() 
{
  size(1000, 1000);
  frameRate(50);
  s = d = 100;


  strokeWeight(3);
}

void draw() 
{

  rect(25, 25, 50, 50);

  background(0);
  fill(204, 120);
  rect(0, 0, width, height);
  fill(0);
  f = f - 10;
  //s = s + 1;
  // If the cursor is over the text, change the positiona
  if ((mouseX >= x) && (mouseX <= x+55) &&
    (mouseY >= y-24) && (mouseY <= y)) {
    x += random(-5, 5);
    y += random(-5, 5);
    s += random(x, y);    
    d += random(x, y);
    w += random(x, y);

if (w > y)
    {
      w = y- 10;
    }


    if (d > y)
    {
      d = y- 10;
    }

    if (f < 5)     
    {
      f = 255;
    }  
    if (s < Y)
    {
      s = X;
    }
   
}
  background(f,d,s);


  smooth();
  noStroke();
  fill(255,x,f);
  beginShape();
  vertex(50, 15); 
  bezierVertex(50, -5, 90, 5, 50, y); 
  vertex(50, 15); 
  bezierVertex(50, -5, 10, 5, 50, y); 
  endShape();


  //slug
  fill(255, 255, 255);
  ellipse(s, d, s, 40);
  fill(165, 42, 42);
  ellipse(s, d, s, 20);
  fill(0, 0, 0);
  ellipse(s, d, s, 9);

 fill(255, 255, 255);
  ellipse(q, w, q, 40);
  fill(165, 42, 42);
  ellipse(q, w, q, 20);
  fill(0, 0, 0);
  ellipse(q, w, q, 9);

  //sword


  // text("Lol", 80, y);
}



void keyPressed(){
  if (key == 'a')

  {
    s = s - 10;
  }

  if (key == 'd')

  {
    s = s + 10;
  }

  if (key == 'w')
  {
    d = d - 10;
  }

  if (key == 's')
  {
    d = d + 10;
  }
  // second slug

  if (key == 'j')

  {
    q = q - 10;
  }

  if (key == 'l')

  {
    q = q + 10;
  }

  if (key == 'i')
  {
    w = w - 10;
  }

  if (key == 'k')
  {
    w = w + 10;
  }

}





