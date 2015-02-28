
int x;
int y;

void setup(){
 size(400,364);
 x=0;
 y=0;
}


void draw(){
  background(#D67754);
  //caja;
  fill(100);
  rect(x,y,100,50);
  //rueda 1;
  fill(0,0,0);
  ellipse(x,y+50,30,30); 
  //rueda2;
  fill(0,0,0);
  ellipse(x+50,y+50,30,30); 
  //rueda3;
  fill(0,0,0);
  ellipse(x+100,y+50,30,30);
  //cuello
  fill(100);
  rect(x+50,y-50,20,50);
  //cabeza
  fill(110);
  rect(x+50,y-50,50,30);
  x=x+1;
  y=y+1;
}

