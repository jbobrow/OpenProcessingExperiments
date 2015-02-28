
PImage background; //Stock image came from http://fc07.deviantart.net/fs71/f/2013/167/3/5/unrestricted_blue_canvas_by_jm_stock-d69cqaj.jpg
int num = 100;
int [] x2 = new int[num];
int [] y2 = new int[num];
int [] x1 = {50,61,83,69,71,50,29,31,17,39};
int [] y1 = {18,37,43,60,82,73,82,60,43,37};
color bColor;
float brushShape = 0;

void setup() 
{
  //smooth();
  size(900,500);
  colorMode(HSB,360,100,100);
  background = loadImage("blue canvas.jpg");
  if (background.width > 0)
  {
    image(background,0,0,width,height);
  }
}

void draw()
{
   if (mousePressed == true && mouseButton == LEFT) 
    {
      if (overRect(50, 450, 50, 50)) //star 
        {
          brushShape = 1;
        }
        if (overRect(110, 450, 50, 50)) // rect
        {
          brushShape = 2;
        }
        if (overRect(160, 450, 50, 50)) // triangle
        {
          brushShape = 3;
        }
        if (overRect(220, 450, 50, 50)) // circle
        {
          brushShape = 0;
        }
          
    }
  if (mousePressed == true && mouseButton == RIGHT)
    {
    bColor = get(mouseX,mouseY);
    }
    fill(0);
    pushMatrix();
    translate(50,440);
    scale(0.6);
    beginShape();
    for(int j = 0; j <x1.length; j++)
    {
      noStroke();
      vertex(x1[j],y1[j]);
    }
    endShape();
    popMatrix();
    fill(0);
    noStroke();
    rect(110,450,40,40);
    fill(0);
    noStroke();
    triangle(160,490,210,490,185,450);
    fill(0);
    noStroke();
    ellipse(240,470,40,40);
      
  fill(hue(bColor),saturation(bColor),brightness(bColor));
  if (mousePressed == true && mouseButton == LEFT)
  {
    for (int i = num-1; i > 0; i--)
    {
      x2[i] = x2[i-1];
      y2[i] = y2[i-1];
    }
    x2[0] = mouseX;
    y2[0] = mouseY;
    for(int i = 0; i < num; i++)
    {
      noStroke();
      fill(hue(bColor),saturation(bColor),brightness(bColor),50);
      if (brushShape == 0)
      {
     noStroke();
      ellipse(x2[i],y2[i],i,i);
      }
      if (brushShape == 1)
      {
        beginShape();
        translate(mouseX,mouseY);
        for(int j = 0; j <x1.length; j++)
        {
          noStroke();
          vertex(x1[j],y1[j]);
        }
        endShape(CLOSE);
      }
      if (brushShape == 2)
      {
        noStroke();
        rect(x2[i],y2[i],i,i);
      }
      pushMatrix();
      translate(mouseX,mouseY);
      if (brushShape == 3)
      {
        noStroke();
        triangle(0,-20,-20,20,20,20);
        
      }
      popMatrix();
      
    }
   }
  //color pallette
  noStroke();
  color from = color(0,100,100);
  color to = color(299.99,100,100);
  color a = lerpColor(from,to,0.111);
  color b = lerpColor(from,to,0.222);
  color c = lerpColor(from,to,0.333);
  color d = lerpColor(from,to,0.444);
  color e = lerpColor(from,to,0.555);
  color f = lerpColor(from,to,0.665);
  color g = lerpColor(from,to,0.777);
  color i = lerpColor(from,to,0.888);
  fill(from);
  rect(10,10,30,30);
  fill(a);
  rect(10,60,30,30);
  fill(b);
  rect(10,110,30,30);
  fill(c);
  rect(10,160,30,30);
  fill(d);
  rect(10,210,30,30);
  fill(e);
  rect(10,260,30,30);
  fill(f);
  rect(10,310,30,30);
  fill(g);
  rect(10,360,30,30);
  fill(i);
  rect(10,410,30,30);
  fill(to);
  rect(10,460,30,30);
}

void branch(float x3, float y3, float s, float a2) //I use this http://www.openprocessing.org/sketch/1758 as a reference
{
  strokeWeight(s * 0.04);
  a2 += radians(random(-10,10));
  float newX = x3 + cos(a2) * s;
  float newY = y3 + sin(a2) * s;
  line(x3,y3,newX,newY);
  if(s >= 3)
  {
   branch(newX, newY, s * (random(0.55,0.70)), a2 - radians(random(17,12)));
   branch(newX, newY, s * (random(0.25,0.70)), a2 + radians(random(17,12)));
   strokeWeight(random(0, 8));
   point(newX+random(-2, 2), newY+random(-2, 2));
  }
}


void keyReleased()
{
  if (key == 'm')
  {
   smooth();
   stroke(random(112,253),random(0,100),random(0,100),180);
   branch(mouseX, mouseY, height/3, radians(random(180,360)));

  }
}

boolean overRect(int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) 
  {
    return true;
  } 
    else
    {
    return false;
    }
}


