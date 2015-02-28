
import processing.pdf.*;
int i=0;
 
void setup(){
background(255);
size(400, 400);

}
 
void vex(int a, int b, int c, int x, int y, int z){
if(a>0){
    stroke(197+random(-30,30),241+random(-30,30),78+random(-30,30),b+20);}
else{stroke(random(255),b-50);}
    strokeWeight(c);
 line(x,y,x,y+z);
 line(x+z-random(5),y+random(5),x,y+z);
 line(x-z+random(5),y+random(5),x,y+z);  
}

void draw(){
if(i<1000){
vex(int(random(-3,3)),int (random(100)), int(random(25)),int(random(-10,width)),int(random(-10,height)),int(random(10,30)));
i++;
}
}




