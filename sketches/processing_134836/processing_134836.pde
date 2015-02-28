
/*projectOne_DM_Feb_14_2-14 Runs at random creating colored
circles and lines to make a figure of what rapid cell grown
may look like in non triditional colors.*/
/*when left mouse key is pressed page is refreshed when right mouse 
key is pressed the page stops*/
float a = random(50, 850);
float b = random(50, 850);
float c = random(900);
float d = random(900); /*if these are changed it changes where circles go*/
float z = 0;

float angle1 = 0.0;
float angle2 = 0.0;

float segLength = 100;
float xspeed =3;
float yspeed =3;
float xspeed2 = 3;
float yspeed2 = -3;
float xspeed3 = 3;
float yspeed3 = -3;

void setup() {
  size(900, 900);
  background(255);
  frameRate(60); /*60*/
}
void draw() {
  /* I learned this online, if you want a partical to move at a 
  growing rate  or a ramdom rate but in a controled space at a 
  controlled size you must take the float, which is set at a random,
  and add it to the speed of the point you want it at, or the xy
  interaction. if you keep the speed numbers close, it will look 
  like the circles are attached and multipling. or so I hope*/
  float string1 = random(3);
  float string2 = random(3);
  
 fill(a/random(3), random(255), b/3);
  strokeWeight(0.3);
  stroke(200);
  
  if (z <= 150) {
    
    xspeed = xspeed + string1*random(2);   /*speed of the code from one point to another */
    yspeed = yspeed + string2*random(2);
    ellipse(a+xspeed,b+yspeed,40,40);
    xspeed2 = xspeed2 + string1*random(2);
    yspeed2 = yspeed2 + string2*random(-2); 
    ellipse(a+xspeed2,b+yspeed2,40,40);
    xspeed3 = xspeed3 + string1*random(-2);
    yspeed3 = yspeed3 + string2*random(-2); 
    ellipse(a+xspeed3,b+yspeed3,40,40);
    
    fill(c/random(4), random(200), d/3);/*changes color*/
   
    xspeed = xspeed2 + string1*random(-6,6); 
    yspeed = yspeed2 + string2*random(-6,6); 
    ellipse(a+xspeed,b+yspeed,20,20);
    xspeed2 = xspeed3 + string1*random(-6,6);
    yspeed2 = yspeed3 + string2*random(-6,6); 
    ellipse(a+xspeed2,b+yspeed2,20,20);
    xspeed3 = xspeed + string1*random(-6,6);
    yspeed3 = yspeed + string2*random(-6,6); 
    ellipse(a+xspeed3,b+yspeed3,20,20);
    
    
    fill(a/random(5)-100, random(255)-80, b/3-80);  /*to change the darkness do (200)-80 under random*/
    
    xspeed = xspeed + string1*random(-8,8); 
    yspeed = yspeed + string2*random(-8,8); 
    ellipse(a+xspeed,b+yspeed,10,10);
    xspeed2 = xspeed2 + string1*random(-8,8);
    yspeed2 = yspeed2 + string2*random(-8,8); 
    ellipse(a+xspeed2,b+yspeed2,10,10);
    xspeed3 = xspeed3 + string1*random(-8,8);
    yspeed3 = yspeed3 + string2*random(-8,8); 
    ellipse(a+xspeed3,b+yspeed3,10,10);
    
  }
    /*change speeds to change where the circles lay, if the speeds are intertwined they 
    change the over all layout. also if you change the randoms of the speeeds the layout changes*/
  
  
  if (z > 150) {
    z=0;
    a = random(50, 850);
    b = random(50, 850);
    xspeed = 0;
    yspeed = 0;
    xspeed2 = 0;
    yspeed2 = 0;
    xspeed3 = 0;
    yspeed3 = 0;
   
  }
 
  float dx = mouseX - a;
  float dy = mouseY - b;
  float dz = mouseX - c;
  float dq = mouseY - d;
  angle1 = atan2(dy, dx);
  angle2 = atan2(dz, dq);
  a = mouseX - (cos(angle1) * segLength);
  b = mouseY - (sin(angle2) * segLength);
  c = mouseX - (sin(angle1) * segLength);
  d = mouseY - (sin(angle2) * segLength);
  
  if (mousePressed && (mouseButton == RIGHT)) { // erase drawing
    background(255);
 
 if (key == ' ') {
save("picture1.tif");  //screen shot but doesnt work

 }
}
 
  
}
