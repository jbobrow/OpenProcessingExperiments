

int x=400;
int y=100;

int bodyHeight = 200;
int neckHeight = 300;
int diameter = 90;



void setup(){
  size(800, 800);
  smooth();
  ellipseMode (DIAMETER);
}

void draw(){
  background (225);

  if (mousePressed){
    neckHeight = 150;
    bodyHeight = 150;
  }else{
    neckHeight = 300;
    bodyHeight = 200;
  }
  
  //triangle
  strokeWeight(4);
  fill(43, 222, 76);
  triangle (x, y, x+100, y-80, x+130, y+50);
  //big eye
  strokeWeight(10);
  fill(255);
  ellipse(x, y, diameter, diameter);
  //pupil
  strokeWeight(4);
  fill(43, 82, 222);
  ellipse(x, y, 20, 20);
  //neck
  line(x, y+diameter/2, x, y+neckHeight);
  //cross section
  strokeWeight(4);
  line(x-200, y+100, x+200, y+100);
  //left
  fill(111);
  ellipse(x-200, y+100, 60, 60);
  fill(43, 82, 222);
  ellipse(x+200, y+100, 15, 15);
  //right
  fill(255);
  ellipse(x+200, y+100, 60, 60);
  fill(43,82, 222);
  ellipse(x+200, y+100, 15, 15);
  //body
  strokeWeight(11);
  strokeJoin(BEVEL);
  fill(247, 167, 17);
  rect(x-100, y+neckHeight, 200, bodyHeight);
  for(int i = 100; i < bodyHeight; i+= 20){
    stroke(124, 77, 30);
    line(x-100, i+diameter+neckHeight, x+100, i+neckHeight);
  }
  //legs
  strokeWeight(4);
  stroke (0);
  fill(127, 23, 185);
  if (mousePressed == true){
    fill(0);
    }
    triangle(x-100, y+neckHeight+bodyHeight+150, x-100, y+neckHeight+bodyHeight, x, y+neckHeight+bodyHeight);
    
    strokeWeight(30);
    strokeCap(SQUARE);
    line (x+85, y+neckHeight+bodyHeight, x+85, y+neckHeight+bodyHeight+150);
    strokeWeight(4);
    fill(48, 240, 180);
    rect(x+70, y+neckHeight+bodyHeight+150, 80, 20);
 
}


