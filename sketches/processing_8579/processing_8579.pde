
// Example 5-10: Zoog and conditionals
float x = 100;
float y = 100;
float w = 60;
float h = 60;
float shipSize = 16;

float shipR;
float shipG;
float shipB;



// dots
float r;
float g;
float b;
float a;

float diam;
float dotsx;
float dotsy;



// Zoog has variables for speed in the horizontal and vertical direction.
float xspeed = 3;
float yspeed = 1;

void setup() {
size(200,200);
smooth();
}







void draw () {

  // Change the location of Zoog by speed
  x = x + xspeed;
  y = y + yspeed;
  
    // An IF statement with a logical OR determines if Zoog has reached either the right or left edge of the screen.  
  // When this is true, we multiply speed by Ð1, reversing ZoogÕs direction!
  // Identical logic is applied to the y direction as well.
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }

  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

background(0);
ellipseMode(CENTER);
rectMode(CENTER); 

 // Feature #2.  eyeR, eyeG, and eyeB are given random values and used in the fill() function.
if(mousePressed == true) {
  shipR = random(255);
  shipG = random(255);
  shipB = random(255);
  fill(shipR,shipG,shipB);
  ellipse(x-w/3+7,y+h/2-10,shipSize,shipSize);
  ellipse(x-w/5,y+h/2,shipSize*3,shipSize);
}


else {
  shipR = random(255);
  shipG = random(255);
  shipB = random(255);
  fill(shipR,shipG,shipB);
  ellipse(x-w/3+7,y+h/2-10,shipSize,shipSize);
  ellipse(x-w/5,y+h/2,shipSize*3,shipSize);
  
  
  
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(40);
  x = random(width);
  y = random(height);
  
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);

}









// Body
stroke(0);
fill(82,252,91);
rect(mouseX,mouseY+30,30,65);


  fill(frameCount / 2);
// Head
stroke(0);
fill(82,252,91);

ellipse(mouseX,mouseY,90,80); 
fill(255);
ellipse(mouseX,mouseY,90,50); 

// Eyes
fill(mouseX,0,mouseY); 
ellipse(mouseX-29,mouseY,13,32); 
ellipse(mouseX+29,mouseY,13,32);


// Legs
// pointa-x,pointa-y,pointb-x,pointb-y)
stroke(255);
fill(255);
line(mouseX-15,mouseY+60,80,160);
line(mouseX+15,mouseY+60,120,160);		

// feet
stroke(0);
fill(82,252,91);
ellipse(80,162,13,6); 
ellipse(120,162,13,6);

}

void keyPressed () {
  println("key pressed");
  fill (255,9,0);
  ellipse(mouseX-29,mouseY,30,45); 
  ellipse(mouseX+29,mouseY,30,45); 
 
}


class Building
{
  int h;
  int w;
  int x;
  int y;


  Building(int x, int y, int h, int w)
  {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
  
  }

  void render()
  {
    stroke(0);
    // sides
    line(x - w / 2, y, x - w / 2, y - h);
    line(x + w / 2, y, x + w / 2, y - h);
    // roof
    line(x - w / 2, y - h, x - w / 4, y - h + 7);
    line(x - w / 4, y - h + 7, x, y - h - 12);
    line(x, y - h - 12, x + w / 8, y - h);
    line(x + w / 8, y - h, x + w / 4, y - h - 20);
    line(x + w / 4, y - h - 20, x + w * 3 / 8, y - h + 5);
    line(x + w * 3 / 8, y - h + 5, x + w / 2, y - h);

    // draw windows
    fill(255);
    for(int i = y - h + 25; i < y - 30; i += 25)
    {
      for(int j = -1; j < 2; j++)
      {
        rect(x - 5 + ((w / 3) * j), i, 8, 12);
      } 
    }

    // door
    fill(255);
    rect(x - w / 16, y - 20, w / 8, 20);

 
  }
}



