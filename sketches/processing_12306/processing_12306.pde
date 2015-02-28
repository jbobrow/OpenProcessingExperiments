
//Assignment #2
//Name:Katie Shumaker
//E-Mail:kshumaker@brynmawr.edu
//Date:9/16/10

float x=100, y=300, w=80, h=60;
float tx=100, ty=300, tx2=140, ty2=250, tx3=180, ty3=300; 

int sharkfin = 235;
int sharkfin2 = 255;
int sharkfin3 = 270;
int speed = 1;


void setup() {
  size (500,500);
  background (23,34,90);
  smooth ();

}

void draw() {
  
  //sky. Inital color of the sky before you click any key.
  fill (164,170,196);
  rect (0,255,500,255);
  
    //mountains
  fill (39,67,10);
  beginShape ();
  curveVertex (0,255);
  curveVertex (0,255);
  curveVertex (110,80);
  curveVertex (240,200);
  curveVertex (330,150);
  curveVertex (350,170);
  curveVertex (380,200);
  curveVertex (450,75);
  curveVertex (499,255);
  curveVertex (0,255);
  endShape (CLOSE);
  
  //body of water
  fill (23,185,232);
  ellipse (255,280,440,40);
  
    //sharkfin. The sharkfin moves around in the water.
fill (107,108,111);
triangle (sharkfin,280,sharkfin2,240,sharkfin3,280);

sharkfin = sharkfin + speed;
sharkfin2 = sharkfin2 + speed;
sharkfin3 = sharkfin3 + speed;

if ((sharkfin>475) || (sharkfin<35)) {
  speed = speed * -1;
}
if ((sharkfin2>475) || (sharkfin2<35)) {
  speed = speed * -1;
}
if ((sharkfin3>475) || (sharkfin3<35)) {
  speed = speed * -1;
}
   //houses
  fill (118,84,86);
  rect (x,y,w,h);
  rect (x+150,y,w+60,h);

//doors
fill (198,10,54);
rect (x+20,y+20,w-40,h-20);
rect (x+185,y+20,w-10,h-20);

//roofs
fill (52,22,22);
triangle (tx,ty,tx2,ty2,tx3,ty3);
triangle (tx+150,ty,tx2+180,ty2-50,tx3+210,ty3);

//door knobs
fill (0);
ellipse (130,348,10,10);
ellipse (295,350,10,10);

//trees
fill (72,35,12);
rect (x-40,y+15,w-70,h+15);
rect (x-60,y+30,w-70,h+15);
rect (x-80,y+15,w-70,h+15);
rect (x+315,y+15,w-70,h+15);
rect (x+335,y+30,w-70,h+15);
rect (x+355,y+15,w-70,h+15);
 

//leaves
fill (8,85,47);
ellipse (25,315,35,35);
ellipse (65,315,35,35);
ellipse (420,320,35,35);
ellipse (460,320,35,35);

//transparent leaves
fill (2,170,87,150);
ellipse (45,320,40,40);
ellipse (440,320,40,40);



}


void keyPressed() {
 
  //background changes from night to day when you press any key.
  background (59,145,255);

}


