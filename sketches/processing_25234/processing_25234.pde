
float x;
float y = 0;
float z = 1;
float h = 2;
float xspeed=+1;
float yspeed=+1;
float zspeed=+1;
float hspeed=+1;

void setup () {
  size(500,500);
  background(0);
x= random(500);
y= random(500);
z= random(500);
h= random(500);
xspeed= 10;
yspeed=5;
zspeed=10;
hspeed=5;


}
void draw(){
  background(0);

  if ( x>= 500-40){
xspeed=xspeed*-1;
  }
if (x<=0+40){
xspeed=xspeed*-1;
  }
  if(y>=500-40){
    yspeed=yspeed*-1;
  }
  if (y<=0+40){
    yspeed=yspeed*-1;
  }
   if(z>=500-40){
    zspeed=zspeed*-1;
  }
  if (z<=0+40){
    zspeed=zspeed*-1;
  }
 if (h<=0+40) {
   hspeed=hspeed*-1;
 }
 if (h>400) {
   hspeed=hspeed*-1;
 }
 
  
x=x+xspeed;
y=y+yspeed;
z=z+zspeed;
h=h+hspeed;
  fill(8,90,63);
  rect(x,y,50,50);
    fill(125,7,134);
  rect(y,x,60,60);
    fill(13,191,154);
  rect(z,y,20,20);
    fill(11,48,67);
  rect(y,z,80,80);
    fill(13,142,7);
  rect(z,y,30,30);
    fill(14,85,80);
  rect(h,z,20,20);
    fill(11,67,46);
  rect(h+5,z+5,20,20);
    fill(11,70,40);
   rect(h+15,y+15,20,20);
   fill(52,33,11);
   rect(h-20,z-20,20,20);
  rect(h+8,z+8,20,20);
    fill(10,75,45);
  rect(z,h,20,20);
    fill(37,11,67);
  rect(x,h,30,30);
    fill(14,61,85);
  rect(h,x,40,40);
    fill(74,7,142,70);
  rect(y,h,50,50);
    fill(23,144,119);
  rect(h,y,60,60);
    fill(13,191,160);
  rect(z,x,70,70);
    fill(2,222,176,85);
  rect(x+95,z+95,75,75);
    fill(2,220,170,85);
  rect(x+80,z+80,75,75);
    fill(2,222,176,90);
  rect(x+85,y+85,75,75);
    fill(2,222,176,90);
  rect(x,z,80,80);
    fill(3,255,202,95);
  rect(z+100,h+100,100,100);
    fill(79,255,5,95);
  rect(y+100,x+100, 100,100);
    fill(5,255,207,98);
  rect(h+100,y+100,175,175);
    fill(192,255,5);
  rect(z,y,200,200);
    fill(238,5,255);
  rect(h,x,200,200);
    fill(255,143,5);
   rect(y+150,x+150,190,190);
  
}
       
                
