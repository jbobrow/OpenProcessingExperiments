
int x=0, y=0, i, j, m, a=221, b=20, c=26;
 float rx=0, ry=0, ri, rj,sx= 120, sy=0,si,sj;


 void setup()
 {
 size(600, 600);
 background(0);
 frameRate(100);
 noStroke();
 smooth();
 colorMode(RGB, width);
 }

 void ellip()
 {
 fill(0);

 rect(0, 0, width, height);



 fill(random(255), random(255), random(255));

 ellipse(x, y, 50, 50);



 if (x<=0 || y<=0) {
 j=int(random(5,10));
 i=int(random(5,10));
 }
 else if (x>=width-10 || y>=height-10) {
 j=(int(random(5,10)))*-1;
 i=(int(random(5,10)))*-1;
 }


 if(x>width){
 x=0;
 }

 x+=i;
 y+=j;
 }

 void rectangle()
 {

 fill(random(255), random(255), random(255));


 rect(rx, ry, 70, 70);
 if (rx<=0 || ry<=0) {
 rj=cos(radians(60));
 ri=sin(radians(60));
 }
 else if (rx>=width-70 || ry>=height-70) {
 rj=cos(random(400))*-1;
 ri=sin(random(400))*-1;
 }

 rx+=ri;
 ry+=rj;


 }
 
 void rectangle2()
 {

 fill(random(255), random(255), random(255));


 rect(sx, sy, 80, 80);
 if (sx<=0 || sy<=0) {
 sj=cos(radians(30));
 si=sin(radians(50));
 }
 else if (sx>=width-80 || sy>=height-80) {
 sj=cos(random(400))*-1;
 si=sin(random(400))*-1;
 }

 sx+=si;
 sy+=sj;


 }




 void draw()
 {

 ellip();
 rectangle();
 rectangle2();
 }

