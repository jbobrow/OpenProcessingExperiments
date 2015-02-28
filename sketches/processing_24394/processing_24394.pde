


float x1 = 0;
float y1 = -20;
float y2 = 0;
float x3 = 100;
float y3 = 0;
float x4 = 0;
float rand = 0;
int triangleTransparency = 80;
float linetransparency =2;
int counter = 0;

//greenSunshine
int x = 0;
int y = 0;
float q = 140;
float z = 242;
float r = 59;
int b = 25;

void setup() {
  size(300, 600);
  background(34,116,22);
}


void draw() {
  while(x1 < width*2) {
    counter = counter+1;
    println(counter);
    smooth();
    noStroke();
    y=0;
    x=-width;
    q=q+0.71875;
//    z=z+0.675;
//    r=r+0.34375;
    fill(57,165,42,triangleTransparency);
    y2 = y1+100;
    y3 = y1+50;
    x4 = x3+(random(-20,20));
    triangle(x1,y1,x1,y2,x4,y3);
    y1 = y1+(50+(random(-30,30)));
    if(y1>height) {
      y1=-20;
      rand = 50+random(-10,10);
      x1 = x1+rand;
      x3 = x3+rand;
      //lines
      while(y<height + 10) {
        stroke(q,z,r,linetransparency);
        strokeWeight(3);
        line(-width,0,x,y);
        x = x+b;
        if(x>width) {
          x=-width;
          y=y+b;
        }
      }
    }
  }
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}


