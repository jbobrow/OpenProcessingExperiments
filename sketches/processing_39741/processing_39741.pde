
int globalX = 0; 
int globalY = 100; 
int speed = 1;
void setup() { 
  size(400,400);
  smooth();
}
void draw() { 
  background(255);
  changeSpeed();
  changeDir();
  showBall();
  //drawCar(80,80, 60 ,50);

}


void bounce() { 
  if ((globalX > width) || (globalX < 0)) {

speed = speed *-1;
}
}

void drawCar(int x, int y, int thesize, color c) { 
  int offset = thesize / 4; 
  rectMode(CENTER); 
  stroke(200);
fill(c); 
rect(globalX,y,thesize,thesize/2); 
fill(200);


rect(globalX-offset,y-offset,offset,offset/2); 
rect(globalX+offset,y-offset,offset,offset/2); 
rect(globalX-offset,y+offset,offset,offset/2); 
rect(globalX+offset,y+offset,offset,offset/2);
}

void changeSpeed(){
 globalX = globalX+speed;
}


void changeDir(){
if((globalX> width)||(globalX<0)){
   speed =speed * -1;}
   
   print(globalX);
}


void showBall(){
//stroke(0);
//fill(175);
drawCar(80,80, 60 ,50);
}

