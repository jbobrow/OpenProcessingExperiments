
class Sonar {
float x;
float y;
float h;
float w;
float cl;
float strk;
float size;
float originalSize;
  
  
Sonar(float tempX, float tempY, float tempS, float tempC){
x =tempX ;
y= tempY;
h= 10;
w= 10;
strk=255;
cl=tempC;
size = tempS;
originalSize= 1;

  
  
}  
  
  
  
  
void display(){
  fill(cl);
  ellipse(x,y,h,w);
  h++;
  w++;
  
 
 
  if(h>size || w>size){
   h=originalSize;
   w=originalSize;
   stroke(strk);
   strokeWeight(10);
  
    }
  
  fill(255);
}  
  

  
  
  
}
Sonar b1;
Sonar b2;
Sonar b3;
Sonar b4;
Sonar b5;
Sonar b6;

void setup(){
//background(150); 
size(700,700);

//  x-position  y-position   size   color

b1 = new Sonar(width/2,150,200,0);
b2 = new Sonar(100,200,100,50);
b3 = new Sonar(450,470,400,120);
b4 = new Sonar(200,height/2,90,200);
b5 = new Sonar(600,90,130,90);
b6 = new Sonar(130,520,200,230);
//b1 = new Bubble(400,180,);  tamano color-central color-borde



}


void draw(){

b1.display();
b2.display();
b3.display();
b4.display();
b5.display();
b6.display();




}


