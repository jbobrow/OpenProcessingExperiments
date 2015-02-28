
int xdivs = 12;
int ydivs = 20;
int edge = 500;
int ycell = edge/(ydivs-1);
int y = 100;
int radius = 5;
float body = 200;
float xbody = 10;
 float[][] particles = new float[xdivs][ydivs];

 
void setup() {
 size(500, 500);
 smooth();
 background(255);
 for (int i = 1; i < (xdivs-1); i ++ ) {//loop elements in x direction
   for (int j = 1; j < (ydivs-1); j ++ ) {
        particles[0][j] = 0;
     particles[xdivs - 1][j] = width;
     float xcell = edge/xdivs;
     fill(0);
     noStroke();
     if (i*xcell < xbody * sin(PI/(ydivs-1) * j)) 
     xcell = xbody * sin(PI/(ydivs-1) * j)/i;//make elements go outside the border
     ellipse(i*xcell, j*ycell, radius, radius);
     particles[i][j] = i*xcell;//write x value as element of array
   }
 }
}

void draw(){
 update();
}
 

void update() {
  background(255);
  if (xbody < body)
  xbody = xbody + sqrt(body-xbody)/3;
for (int i = 1; i < (xdivs-1); i ++ ) {
  for (int j = 1; j < (ydivs-1); j ++ ) {
    float xcell = edge/(xdivs-1);
     
     particles[0][j] = 0;
     particles[i][0] = i*xcell;
     particles[xdivs-1][j] = width;
     particles[i][ydivs-1] = i*xcell;
     
     float force1 = particles[i+1][j] - 2*particles[i][j] + particles[i-1][j];
     float force2 = particles[i][j+1] - 2*particles[i][j] + particles[i][j-1];
     float motion1 = 0.3;
     float motion2 = 0.3;
     

     particles[i][j] = particles[i][j] + force1*motion1 + force2 * motion2;
       
     
     float rbody = 80;
     fill(0, 50);
     noStroke();
     ellipse(mouseX, mouseY, rbody*1.8, rbody*1.8);
     float xleft = mouseX - rbody;
     float xright = mouseX + rbody;
     float ydiff = mouseY - j*ycell;
     float xmove = 0;
  if (rbody > abs(ydiff)) {
  xmove = sqrt(sq(rbody) - sq(ydiff));
  } else {
    xmove = 0;}
    
     if(particles[i][j] > xleft && particles[i][j] < mouseX && rbody > abs(ydiff) && particles[i][j] > mouseX - xmove) {
     particles[i][j] = mouseX - xmove;
   } else if (particles[i][j] > mouseX && particles[i][j] < xright && rbody > abs(ydiff) && particles[i][j] < mouseX + xmove) {
     particles[i][j] = mouseX + xmove;}
     
     /*if(particles[i][j] < xbody * sin(PI/(ydivs-1) * j))
     particles[i][j] = xbody * sin(PI/(ydivs-1) * j);*/
     
     
     fill(0);
     noStroke();
     ellipse(particles[i][j], j*ycell, radius, radius);
     
     stroke(0);
     line(particles[i][j-1], (j-1)*ycell, particles[i][j], j*ycell);
     /*line(particles[i][j+1], (j+1)*ycell, particles[i][j], j*ycell);*/
 }
}
}                                               
