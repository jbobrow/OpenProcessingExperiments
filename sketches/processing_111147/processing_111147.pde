
//annie ranttila, aranttil
//carnegie mellon university, fall 2013
//computing for the arts with processing
//assignment 5

color col1;
float x;
float y;
float wd;
float ht;
int r,g,b;

void setup()
{
  size (500, 500);
  col1 = color(200,200,0);
  smooth();
  frameRate(15);
  rectMode(CENTER);
  x = width*.5;
  y = height*.5;
  wd = width;
  ht = height;
  r = 226;
  g = 191;
  b = 255;
  backgroundSet(r,g,b);
}


void draw()
{
  backgroundSet(r,g,b);
  
   if (mouseX < x && mouseY < y)
     {
      faceHappy(mouseX, mouseY);
     }
   else if (mouseX > x && mouseY < y)
     {
       faceSad(mouseX, mouseY);
     }  
   else if (mouseX < x && mouseY > y)
     {
       faceAngry(mouseX, mouseY);
     }  
   else if (mouseX > x && mouseY > y)
     {
       faceConfused(mouseX, mouseY);
     }  
   else
  {
     yayFace(mouseX, mouseY);
   }
}

void keyPressed()
{
  if (key == CODED) 
    {
    if (keyCode == DOWN) 
      {
        r = 149;
        g = 255;
        b = 224;
      backgroundSet(r,g,b);
      }
    else if (keyCode== UP)
      {
        r = 241;
        g = 255;
        b = 149;
      backgroundSet(r,g,b);
      }
    else if (keyCode== LEFT)
      {
        r = 180;
        g = 180;
        b = 180;
      backgroundSet(r,g,b);
      }
    else if (keyCode== RIGHT)
      {
        r = 255;
        g = 140;
        b = 98;
      backgroundSet(r,g,b);
      }
      }
}
 

void backgroundSet(int red, int green, int blue)
{
  background(red,green,blue,10);
  fill (255,226,191);
  stroke(255,226,191);
  strokeWeight(4);
}

void faceHappy(float x, float y)
{
  fill (255, 191, 215);
  noStroke();
  ellipse(mouseX, mouseY, wd*0.25, ht*0.25);
  stroke(93, 102, 255);
  fill(93, 102, 255);
  point(mouseX-wd*.05, mouseY-wd*.05);
  point(mouseX+wd*.05, mouseY-wd*.05);
  noFill();
  stroke(255,82,149);
  arc(mouseX, mouseY+wd*.05, wd*.1, wd*.05, radians(0), radians (180));
  textSize(15);
  text("happy!", x+wd*.1, y+wd*.13);

  
}
void faceSad(float x, float y)
{
  fill (255, 191, 215);
  noStroke();
  ellipse(mouseX, mouseY, wd*0.25, ht*0.25);
  stroke(93, 102, 255);
  fill(93, 102, 255);
  point(mouseX-wd*.05, mouseY-wd*.05);
  point(mouseX+wd*.05, mouseY-wd*.05);
  noFill();
  stroke(255,82,149);
  arc(mouseX, mouseY+wd*.05, wd*.1, wd*.05, radians(180), radians (360));
  textSize(15);
  text("sad!", x-wd*.2, y+wd*.13);

}

void faceAngry(float x, float y)
{
  fill (255, 191, 215);
  noStroke();
  ellipse(mouseX, mouseY, wd*0.25, ht*0.25);
  stroke(255, 93, 93);
  fill(255, 93, 93);
  point(mouseX-wd*.05, mouseY-wd*.05);
  point(mouseX+wd*.05, mouseY-wd*.05);
  noFill();
  stroke(255,82,149);
  arc(mouseX, mouseY+ht*.05, wd*.1, wd*.01, radians(180), radians (360));
  stroke(0,0,0);
  line(mouseX-wd*.06, mouseY-ht*.08, mouseX-wd*.04, mouseY-ht*.06);
  line(mouseX+wd*.06, mouseY-ht*.08, mouseX+wd*.04, mouseY-ht*.06);
  textSize(15);
  text("angry!", x+wd*.1, y-wd*.13);
}
void faceConfused(float x, float y)
{
  fill (255, 191, 215);
  noStroke();
  ellipse(mouseX, mouseY, wd*0.25, ht*0.25);
  stroke(93, 102, 255);
  fill(93, 102, 255);
  point(mouseX-wd*.05, mouseY-wd*.05);
  point(mouseX+wd*.05, mouseY-wd*.05);
  noFill();
  stroke(255,82,149);
  line(mouseX-wd*.05, mouseY+ht*.03, mouseX+wd*.05, mouseY+ht*.05);
  textSize(15);
  text("confused!", x-wd*.2, y-wd*.13);
}

void yayFace(float x, float y)
{
  background(random(255),random(255), random(255));
  fill (255, 191, 215);
  noStroke();
  ellipse(mouseX, mouseY, wd*0.5, ht*0.5);
  stroke(93, 102, 255);
  fill(93, 102, 255);
  strokeWeight(10);
  point(mouseX-wd*.1, mouseY-wd*.1);
  point(mouseX+wd*.1, mouseY-wd*.1);
  noFill();
  stroke(255,82,149);
  arc(mouseX, mouseY+ht*.05, wd*.3, wd*.15, radians(0), radians (180));
  line(mouseX-wd*.15, mouseY+ht*.05, mouseX+wd*.15, mouseY+ht*.05);
  textSize(30);
  text("yay!", x, y+wd*.3);
  
}


