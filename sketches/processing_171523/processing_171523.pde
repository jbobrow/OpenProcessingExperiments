
float fps = 30;
float speed = 60;

float theta, thetaSun, thetaEarth, thetaMoon =0;
float rSun, rEarth, rMoon;
 Object sun;
 Object earth;
 Object moon;
int sunMove = 50;
//colors
int count = 0;
int state = 0;
int[] red = {0,238,244,163, 3,248,34,198,91,5,255,3};
int[] green = {178,84,34,3,163,90,8,32,5,91,71,0};
int[] blue = {238,0,0,93,9,5,164,10,85,14,0,57};
int cIndex = 0;

int sunCount = 0;
int sunR,sunG,sunB;

void setup () {
size (1000,650);
ellipseMode(CENTER);
frameRate(int(fps));
sun = new Object();
earth = new Object();
moon = new Object();
 }
 
 
void draw () {
noStroke();
smooth();
//background(0);

 count ++;
 for (int i=0; i<12; i++){
   if (count > (60*fps) ){
     cIndex+=1;
     state+=1;
     count = 0;
 }
   if (state >11){
     state = 0;
     cIndex = 0;
   }
}

for (int i=0; i<12; i++){
 if (state==11){
   sunCount+=1;
 }
 if(sunCount>5){
   sunR=1;
   sunG=0;
   sunB=23;
} else if (sunCount==0 || sunCount>10){
  sunR=255;
  sunG=255;
  sunB=0;
}
}
//sun
translate(width/2,height/2);
rotate(thetaSun); 
sun.planetDisplay(sunMove, 125, 50, sunR, sunG, sunB);
//println("sun=" + sun.x);

//earth
translate(sun.x,sun.y);
rotate(thetaEarth);
earth.orbitDisplay(0,-140, 60, 0.5);
earth.planetDisplay (0, -140, 40, red[cIndex], green[cIndex], blue[cIndex]);//earth
//println("earth=" +earth.x); 
//println("count=" + count);

//moon
translate(0,-140);
rotate(thetaMoon);
moon.moonDisplay(7.5, -30, 10, 139, 136, 120);

//rotation of objects
theta = speed*2*PI/fps;
thetaSun +=(theta/(60*60));
thetaEarth +=theta/(60)-theta/(60*60);
thetaMoon +=theta-theta/(60);

}


class Object {
 float x,y,radius, orbitX, orbitY;
 float r,g,b;
 
  Object(){
   x=0;
   y=0;
   radius=0;
   r=0;
   g=0;
   b=0;
   
 }
   
 void planetDisplay (float _x, float _y, float _radius, float _r, float _g, float _b){//planet display function
  x=_x;
  y=_y;
  radius=_radius;
  r=_r;
  g=_g;
  b=_b;
noStroke();
fill(r, g, b);
ellipse(x, y, radius, radius);
}
 
void moonDisplay (float _x, float _y, float _radius, float r, float g, float b){//moon display
x=_x;
y=_y;
radius=_radius;
noStroke();
fill(r, g, b);
ellipse(x, y, radius, radius);
}

void orbitDisplay (float _x, float _y, float radius, float bold) {
orbitX=_x;
orbitY=_y;
noFill();
stroke(255);
strokeWeight(bold);
ellipse (x, y, radius, radius);
} 

}


