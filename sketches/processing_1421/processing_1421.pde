
//Kütüphaneler
//değişkenler
//setup
//draw
//ekstra fonk


float hiz=1;
float x=50;
float y=50;
float en=34;
float boy=50;

void setup() {
  size(600,600);



}

void draw() { 

  background (61,0,250);
  rect (x,y,en,boy);
hiz=hiz*1.05;  
if (x>600-en) {hiz=-1;}
if (x<0) {hiz=1;}
x=x+hiz;

}








void mousePressed(){
  //x=x+1;
}






