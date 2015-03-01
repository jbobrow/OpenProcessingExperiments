
int x = 200;
int speed = 2;

//runs once in the program
void setup() { 
  size(500,500);
  frameRate(120);
}

// loop
void draw() {
  background(#AAAAAA);
  //Legs
  fill (#cb0239);
  ellipse(210, 350, 30, 50);
  ellipse(290, 350, 30, 50);
  //Head
  fill (#f8a2d4);
  ellipse(250, 250, 200, 200); //P3D = 3D rendering
  //Arms
  x = x + speed;
  if ((x > 250) || x < 200) {
    speed = speed * -1;
  }
  
  ellipse(150, x, 40, 40);
  ellipse(350, x, 40, 40);
  //Eyes
  fill (#000000);
  ellipse(225, 220, 25, 50);
  ellipse(275, 220, 25, 50);
  //Eyes pt.2
  fill (#FFFFFF);
  ellipse(225, 210, 15, 25);
  ellipse(275, 210, 15, 25);
  //Cheeks
  noStroke();
  fill (#f5549f);
  ellipse(200, 255, 30, 15);
  ellipse(300, 255, 30, 15);
  //Mouth
  fill (#000000);
  ellipse(250, 280, 20, 20);

  
  //Commented out loop
  /*println(frameCount);
  if (x > 400) {
    x = 50;
    y = 50;
  }
  */
  //rect(mouseX,mouseY,100,100);
}


