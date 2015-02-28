
PImage tree;
PImage colaba;
PImage balloon;
int a =0, b=0;

Cell[][] grid;


int cols = 25;
int rows = 40;

void setup() {
  size(600,800);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
  tree= loadImage("tree.JPG");
  colaba = loadImage("colaba.jpg");
  balloon = loadImage("balloon.jpg");
}

void draw() {
  background(0);
   
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
  tint(225,80);
  image(tree, 300,0,300,800); 
  tint(240,127);
  image(colaba, 400,0,200,800);
  tint(#8E701D,90);
  image(balloon,0,550,600,200);
  
  stroke(255);
  fill(#E5AC0E,50);
  triangle(350,420,500, 600, 300,720);
  stroke(255);
  fill(#3A148E,80);
  triangle(650,420,500, 770, 200,720);
  
  a=mouseX;
  b=mouseY;
  if(mousePressed && a>100)
  {
    if(a>200 && a<700)
  {
    fill(109,20,142);
  }
  else
  {
    fill(80,47,20);
  }
  
  }
   else
  {
    fill(20,142,139);
  }
  
  ellipse(a,b, 100, 100);
}


class Cell 
{
  
  float x,y;  
  float w,h;  
  float angle; 
  
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  
  void oscillate() {
    angle += 0.02; 
  }

  void display() 
  { float a= random(0,#1D708E);
  float b= random(0,255);
  float c =random(0,255);
    stroke(a,b,c);
     
    fill(140+127*sin(angle));
    rect(x,y,w,h); 
  }
}



