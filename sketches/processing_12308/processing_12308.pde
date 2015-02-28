
// Assignment #2
// Name: Meagan Neal
// E-mail: mneal@bmc 
// Date: 9/15/2010


float x, y, w, h, sunx, suny; 

void setup() {
  size(500,500);
  background(255);
  smooth();

x = 200;
y = 200;
w = 100;
h = 100;
sunx=250;
suny=240;

        


}

void draw() {
  //rays
  strokeWeight(5);
  stroke(237,162, 12);
  line(sunx,suny,250,0);
  line(sunx,suny, 170,0);
  line(sunx,suny,90,0);
  line(sunx,suny,0,0);
  line(sunx,suny,0,80);
  line(sunx,suny-10,0,150);
  line(sunx,suny, 335,0);
  line(sunx, suny, 450,0);
  line(sunx,suny, 600,0);
  line(sunx, suny-10, 900, 0);
  //sun
  noStroke();
   fill(255,197,3);
  arc(sunx,suny,w+130,h+100, radians(180), radians(360));
  //horizon
  frameRate(12);
  noStroke();
  fill(random(255),random(255),random(255));
  rect(x,y,w,h);
  fill(random(255), random(255), random(255));
  rect(x-100,y,w,h);
  fill(random(255),random(255),random(255));
  rect(x-200,y,w,h);
  fill(random(255), random(255), random(255));
  rect(x+100,y,w,h); 
  fill(random(255),random(255),random(255));
  rect(x+200,y,w,h);
  fill(random(255), random(255), random(255));
  rect(x+300,y,w,h);
 
  
 
  
}  
void mousePressed() {
  frameRate(0);
  
}



