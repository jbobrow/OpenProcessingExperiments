
/* Konkuk University 
 Department of Dynamic Media 
 SOS iDesign 
 Name: AN Junyeong 
 ID: 201420088 
 */

int x = 0; 
int xspeed = 1; 

void setup() { 
  size(600, 600); 
  background(0); 
  smooth();
} 

void draw() {  
  background(0); 
  x = x + xspeed; 
  if ((x < 0)|| (x > width-300) ) { 
    xspeed = xspeed * -1;
  } 
  noStroke(); 
  fill(#0B2A3E); 
  rect(x, 0, 180, height); 
  fill(x*1, x*1, 0); 
  rect(width-x, 0, 200, height); 
  fill(#7FC150); 
  rect(540-x, 0, 150,height);
  fill(x*-1, 0, 0); 
  rect(420-x*3/2, 0, 120, height); 
  fill(#DE2626); 
  rect(220+x*2, 0, 100,height); 
  fill(#B4406B); 
  rect(100+x*1/2, 0, 130, height); 
  fill(#6B5186); 
  rect(360-x*2, 0, 110, height); 
  fill(#35B2C1); 
  rect(50+x, 0, 100, height); 
}
