
//leah dubuc motion homework

//int 
int x;
int y;
int x2;
int y2;
int x3;
int y3;
int x4;
int y4;
int x5;
int y5;
int x6;
int y6;
int x7;
int y7;
int x8;
int y8;
int directionX;
int directionY;
int directionX2;
int directionY2;
int directionX3;
int directionY3;
int directionX4;
int directionY4;
int directionX5;
int directionY5;
int directionX6;
int directionY6;
int directionX7;
int directionY7;
int directionX8;
int directionY8;

void setup() {
  size(600, 600);
  smooth();
  background(0, 0, 0);
  x = 100;
  y = 0;
  x2 = 210;
  y2 = 0;
  x3 = 250;
  y3 = 600;
  x4 = 380;
  y4 = 600;
  x5 = 300;
  y5 = 0;
  x6 = 400;
  y6 = 0;
  x7 = 410;
  y7 = 600;
  x8 = 420;
  y8 = 600;
  directionX = 1;
  directionY = 1;
  directionX2 = 1;
  directionY2 = 1;
  directionX3 = -1;
  directionY3 = -1;
  directionX4 = -1;
  directionY4 = -1;
  directionX5 = 1;
  directionY5 = 1;
  directionX6 = 1;
  directionY6 = 1;
  directionX7 = -1;
  directionY7 = -1;
  directionX8 = -1;
  directionY8 = -1;

}


void draw() {
  stroke(245, 130, 24);
  fill(245, 130, 24);
  smooth();
  beginShape();
    vertex(x, y);
    vertex(x2, y2);
  endShape();
    
stroke(147,67,206);
fill(147,67,206);
  beginShape();
    vertex(x3,y3);
    vertex(x4,y4);
  endShape();
  
stroke(0,134,1);
fill (1,134,1);
  beginShape();
     vertex(x5,y5);
     vertex(x6,y6);
  endShape();  
  
stroke(255,26,0);
fill(255,26,0);
  beginShape();
    vertex(x7,y7);
    vertex(x8,y8);
  endShape();
  
  x+= directionX;
  y+= directionY;
  x2+= directionX2;
  y2+= directionY2;
  x3+= directionX3;
  y3+= directionY3;
  x4+= directionX4;
  y4+= directionY4;
  x5+= directionX5;
  y5+= directionY5;
  x6+= directionX6;
  y6+= directionY6;
  x7+= directionX7;
  y7+= directionY7;
  x8+= directionX8;
  y8+= directionY8;
  
  
  if(x > 150){
  directionX= -1;}
  
  if(x < 50){
  directionX= 1;}
  
  if(x2 > 230){
  directionX2= -1;}
  
  if(x2 < 190){
  directionX2= 1;}
  
  if(x3 < 184){
  directionX3= 1;}
  
  if(x3 > 230){
  directionX3= -1;}
  
  if(x4 < 230){
  directionX4= 1;}
  
  if(x4 > 320){
  directionX4= -1;}
  
  if(x5 > 250){
  directionX5= -1;}
  
  if(x5 < 380){
  directionX5= 1;}
  
  if(x6 > 450){
  directionX6= -1;}
  
  if(x6 < 350){
  directionX6= 1;}
  
  if(x7 > 470){
  directionX7= -1;}
  
  if(x7 < 370){
  directionX7= 1;}

  if(x8 > 450){
  directionX8= -1;}
 
  if(x8 < 530){
  directionX8= 1;} 
    
  println("x:"+mouseX + "y:" +mouseY);
}


