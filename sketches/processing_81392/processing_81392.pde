
//http://www.openprocessing.org/sketch/4140//

float l;int d=300;
PImage img0; 
void setup(){
    img0 = loadImage ("chandelier.jpg");
size(700,500);smooth();fill(0,50);}

void draw(){
  image (img0,0, 0);
translate(150,150);
for(int r=0;r++<360;){stroke(255,300,40,13);
rotate(r);line(0,0,d*noise(r,l+=.1)/2,0);}

translate(20,150);
for(int r=0;r++<360;){stroke(255,200,499,40);
rotate(r);line(0,0,d*noise(r,l+=0)/3.5,0);}

translate(65,170);
for(int r=0;r++<360;){stroke(255,100,100,45);
rotate(r);line(0,0,d*noise(r,l+=.1)/3,0);}

translate(60,170);
for(int r=0;r++<180;){stroke(200,200,100,18);
rotate(r);line(0,0,d*noise(r,l+=.1)/1.5,0);}

translate(80,170);
for(int r=0;r++<180;){stroke(255,9);
rotate(r);line(0,0,d*noise(r,l+=.1)/2,0);}

translate(10,390);
for(int r=0;r++<180;){stroke(200,80,190,30);
rotate(r);line(0,0,d*noise(r,l+=.1)/2.7,0);}

translate(260,-100);
for(int r=0;r++<180;){stroke(255,18);
rotate(r);line(0,0,d*noise(r,l+=.1)/1.5,0);}

}


