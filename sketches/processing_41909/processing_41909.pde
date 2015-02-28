
//EJ Posselius :: Processing.1 :: 2011.10.09

int x1, y1, vx1, vy1;
int x2, y2, vx2, vy2;
int bgD; //background diameter

void setup () {
 size(800,800);

// bgD = 20*round(random(1,5));
// print("bgD - ");println(bgD);

 bgD = 800;

 vx1  = round(random(1,20));
 print("vx1 - ");println(vx1);
 vy1  = round(random(1,20));
 print("vy1 - ");println(vy1);
 vx2  = round(random(1,20));
 print("vx2 - ");println(vx2);
 vy2  = round(random(1,20));
 print("vy2 - ");println(vy2);

 smooth();
}

void draw() {

 background(0);

 //draw bgCircles
 for (int i = 1; i<80; i++) {
   for (int j = 1; j<80; j++) {
     fill(round(map(i,1,80,80,255)),round(map(j,1,80,80,255)),round(map(bgD,0,800,80,255)));
     ellipse(i*bgD-(bgD/2), j*bgD-(bgD/2), bgD, bgD);
   }
 }

 x1 += vx1;
 y1 += vy1;
 x2 += vx2;
 y2 += vy2;
 
 fill(255, 100);
 ellipse(x1+50, y1+50, 100, 100);
 ellipse(x2+50, y2+50, 100, 100);

if (bgD > 800){

 if (y1 > width-100 || y1 < 0 || y2 > width-100 || y2 < 0){
   bgD /= 2;
 }
 if (x1 > width-100 || x1 < 0 || x2 > width-100 || x2 < 0){
   bgD /= 2;
 }
}

if (bgD < 100){

 if (y1 > width-100 || y1 < 0 || y2 > width-100 || y2 < 0){
   bgD *= 8;

 }
 if (x1 > width-100 || x1 < 0 || x2 > width-100 || x2 < 0){
   bgD *= 8;
 }
}

 if (x1 > width-100 || x1 < 0) {
  vx1 *= -1;
  bgD /= 2;
 }

 if (y1 > height-100 || y1 < 0) {
  vy1 *= -1;
  bgD /= 2;
 }

 if (x2 > width-100 || x2 < 0) {
  vx2 *= -1;
  bgD /= 2;
 }

 if (y2 > height-100 || y2 < 0) {
  vy2 *= -1;
  bgD /= 2;
 }
}

//DEBUG


 //print(bgD);


/*if (bgD > 800 || bgD < 20){
 bgD *= 2;

 if (x1 > width-100 || x1 < 0 || x2 > width-100 || x2 < 0){
   bgD /= 2;

       print("bgD -");println(bgD);
     }*/
 
/*   for (int k = 1; k<10; k++){
     bgD = k*(bgD/10);
     delay(1);
     print("k - ");println(k);
   }
   println("dun");*/






