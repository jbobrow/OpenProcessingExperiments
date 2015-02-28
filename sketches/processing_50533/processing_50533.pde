
int barcoX;

void setup(){
  size(800,600);
  barcoX=10;
  
}

void draw(){
  //barco
  background(102,162,240);
  fill(0,71,124);
  rect(0,300,800,650);
  noStroke();
  smooth();
  fill(118,51,10);
  quad(barcoX,450,barcoX-50,350,barcoX+200,350,barcoX+150,450);
  fill(255);
  triangle(barcoX-50,340,barcoX+100,150,barcoX+100,340);
  triangle(barcoX+120,340,barcoX+120,180,barcoX+200,340);
  barcoX=barcoX+1;
  
}


