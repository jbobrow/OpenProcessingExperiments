
float x=200;
float y=200;
int radius=20;
color c=(#F2E70C);

Pacman pacman1;
Pacman1 pacman2;
Pacman2 pacman3;
Pacman3 pacman4;

void setup() {
  size (400,400);
  ellipseMode(RADIUS);
  frameRate(60);
  pacman1=new Pacman(200,200);
  pacman2=new Pacman1(200,200);
  pacman3=new Pacman2(200,200);
  pacman4=new Pacman3(200,200);

}
void draw() {
background(15,80,20);
  fill(c);
  stroke (#080701);
  arc (x, y, radius, radius, .52, 5.76);

//    if (x < width/2 && y < height/2){
//    background(80,15,20);
//  }
//    else if (x > width/2 && y < height/2){
//      background(20,15,80);
//    }
//    else if (x > width/2 && y > height/2){
//      background(30,30,50);
//    }  
if (key== 'd'){    
pacman1.move();}
if (key== 's'){
  pacman2.move();}
if (key== 'a'){
  pacman3.move();}
  if (key=='w'){
    pacman4.move();}

  stroke (0);
  fill (255);
  rect (20,height/1.1,10,10);
  rect (width/1.1,20,10,10);
  rect (width/1.1,height/1.1,10,10);
  rect (450,height/1.5,10,10);
  rect (width/1.5,450,10,10);
  rect (300,20,10,10);}
 void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      c=#14EBFC;    }
    else if (keyCode==DOWN){
      c=#4449C1;}
      else if (keyCode==LEFT){
        c=#FF840F;}
        else if (keyCode==RIGHT){
        c=#F8FC14;}}}  
 


class Pacman{
  int y=200;
  int x=200;
//  color c=#F2E70C;
  Pacman(int manx,int many){
    x=manx;
    y=many;
  }
  void move(){
  if (key== 'd' && (keyPressed==true)){
    x=x+5;
  }
  fill(c);
  stroke (#080701);
  arc (x, y, radius, radius, .52, 5.76);
    if (x>width){
    x=5;}
    if (x<0){
      x=width;}
}
}

class Pacman1{
  int y=200;
  int x=200;
//  color c=#F2E70C;
  Pacman1(int manx,int many){
    x=manx;
    y=many;
  }
  void move(){

  if (key== 's' && (keyPressed==true)){
    y=y+5;}

  fill(c);
  stroke (#080701);
  arc (x, y, radius, radius, 2.2, 7.00);
    if (y>height){
    y=5;}
    if (x<0){
      y=height-5;}
}
}
class Pacman2{
  int y=200;
  int x=200;
//  color c=#F2E70C;
  Pacman2(int manx,int many){
    x=manx;
    y=many;
  }
  void move(){

  if (key== 'a' && (keyPressed==true)){
    x=x-5;}

  fill(c);
  stroke (#080701);
  arc (x, y, radius, radius, 3.62, 8.86);
  if (x>width){
    x=5;}
    if (x<0){
      x=width;}
}
}
class Pacman3{
  int y=200;
  int x=200;
//  color c=#F2E70C;
  Pacman3(int manx,int many){
    x=manx;
    y=many;
  }
  void move(){

  if (key== 'w' && (keyPressed==true)){
    y=y-5;}

  fill(c);
  stroke (#080701);
  arc (x, y, radius, radius, -.7, 4);
      if (y>height){
    y=5;}
    if (y<0){
      y=height;}
}
}


