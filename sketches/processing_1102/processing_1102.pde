
int y;
int z;
int a;
int b;
int c;
int d;
int e;
int value;


void setup(){
  size(450,400);

  y = 400;
  z = 415;

  a = 125;
  b = 135;
  c = 130;
  d = 140;
  e = 120;

  value=0;

}

void draw(){
  background(112,111,139); 

  //*FIGURAS
  fill(value);
  quad(250,350,200,130,250,80,270,340);
  fill(value);
  quad(280,340,280,60,360,120,310,350);

  fill(127,174,224);
  ellipse(235,135,10,10);
  fill(127,174,224);
  ellipse(300,120,10,10);

  //*CORAZON Y
  fill(127,174,224);  
  ellipse(125,y,10,10);
  noStroke();
  fill(127,174,224);
  ellipse(135,y,10,10);
  noStroke();
  fill(127,174,224);
  triangle(130,z,140,y,120,y);

  //*CORAZON X
  fill(127,174,224);  
  ellipse(a,350,10,10);
  noStroke();
  fill(127,174,224);
  ellipse(b,350,10,10);
  noStroke();
  fill(127,174,224);
  triangle(c,365,d,350,e,350);

  y = y - 1;
  if (y < -20){
    y = 450;
  }
  z = z - 1;
  if (z < -5){
    z = 465;
  }




  a += 1;
  if (a > 450){
    a = -20;
  }
  b += 1;
  if (b > 450){ 
    b = -20;
  }
  
  
  c += 1;
  if (c > 460){
    c = -10;
  }
  d += 1;
  if (d > 470){
    d = 0;
  }
  e += 1;
  if (e > 450){
    e = -20;
  }

}

void mousePressed(){
  if(value==0) {
    value = (150);
  } 
  else{
    value = (0);
  }
}






