
Panda[] hiPanda=new Panda[50];//set array for panda
void setup(){
  size(600,600);
  background(0,100,0);
  smooth();
  colorMode(HSB,360,100,100); //use HSB color mode
  for(int i=0;i<hiPanda.length;i++){     //give initial value to array of the panda)
     hiPanda[i]=new Panda(color(random(0,120),100,80),random(width),random(height),random(0.1,0.8));
  }
}
 
 void draw(){
fill(0,100,0,90);  // add shadow to the panda 's movement
rect(0,0,300,300);
fill(0,0,100,80);
rect(300,0,300,300);
fill(0,0,100,80);
rect(0,300,300,300);
fill(0,100,0,80);
rect(300,300,300,300);

   for(int p=30;p<width;p+=70){       //use loop to draw odd number line of bear 
  for(int q=30;q<height+80;q+=140){
  drawBear(p,q,40);}}
    for(int p=30;p<width;p+=70){
  for(int q=100;q<height+80;q+=140){   //use loop to draw even number line of bear
  drawBear(p,q,-40);}}
     for (int i=0;i<hiPanda.length;i++){   // make the array of panda move
   hiPanda[i].move();
   hiPanda[i].display();}
   }

void drawBear(int p,int q,float a){    //use function with augment to draw bear
  pushMatrix();
  translate(p,q); //set center as (p,q)
  rotate(a);  
  scale(0.3);
  //rotate(a);//rotate the bear
//ears of bear
fill(26,99,55);
stroke(0);
strokeWeight(4);
ellipse(-70,-50,70,70);
ellipse(70,-50,70,70);
//head of bear
fill(26,99,55);
stroke(0);
strokeWeight(4);
ellipse(0,0,200,180);
//eyes of bear
fill(0,0,100);
ellipse(-50,0,30,30);
ellipse(50,0,30,30);
fill(0,100,0);
ellipse(-60,0,7,7);
ellipse(40,0,7,7);
//mouse of bear
strokeWeight(2);
fill(36,99,89);
stroke(0);
ellipse(0,50,80,70);
stroke(0);
strokeWeight(2);
line(0,20,0,65);
line(0,65,-8,70);
line(0,65,8,70);
//nose of bear
fill(0,99,0);
ellipse(0,20,20,15);
popMatrix();}
 
 class Panda{      //set class of Panda
   color c;
   float x;
   float y;
   float xspeed;
   float d;
   
   Panda(color tempC, float tempX, float tempY,float tempD){ 
     c=tempC;
     x=tempX;
     y=tempY;
     xspeed=5;
     d=tempD;
   }
   
   void display(){
pushMatrix();
translate(x,y);
scale(d);
stroke(c);
//ears of panda
fill(c);
ellipse(-70,-50,70,70);
ellipse(70,-50,70,70);
//head of panda
fill(0,0,100);
strokeWeight(4);
ellipse(0,0,200,180);
//eyes of panda
fill(c);
ellipse(-50,10,60,70);
ellipse(50,10,60,70);
fill(0,0,100);
ellipse(-50,0,12,12);
ellipse(50,0,12,12);
//nose of panda
fill(c);
ellipse(0,50,15,10);
//mouse of panda
noFill();
stroke(c);
strokeWeight(4);
bezier(-5,70,-5,75,5,75,5,70);
popMatrix();
   }
   void move(){     //add functiion of movement
     x=x+xspeed;
     float a=0;
     a=a+0.3;
     rotate(a);
     if(x>width-d|| x<d){
       xspeed= -xspeed;
     }
   }
 }    
