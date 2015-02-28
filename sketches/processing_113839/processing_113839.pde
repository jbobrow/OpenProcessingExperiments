
float a = 0;
float x = 300;
float y = 300;
float x1 = 500;
float y1 = 500;
float x2 = 100;
float y2 = 100;
float xspeed = 3;
float yspeed = 6;
float xspeed1 = 4;
float yspeed1 = 7;
float xspeed2 = 7;
float yspeed2 = 3;
float s = 0.0;

//BACKGROUND BY JOANNA

void setup() {
  size (600,600);
  smooth();

}

void draw(){
  background( random(250), random(250), random(250)); // sets random background colour
    stroke(232,229,58);
    strokeWeight(4);
    line(0, random (0,300), width, a);
    strokeWeight(2);
    line(0, a, width, 300);
     
    stroke(237,0,16);
    strokeWeight(4);
    line(0, random (30, 200), width, a);
    strokeWeight(2);
    line(0, a, width, random (20,200));
     
    stroke(12,153,17);
    strokeWeight(4);
    line(0, 400, width, a);
    strokeWeight(2);
    line(0, a, width, random (20,200));
    a = a + 1;
  
  // SMILEY FACES by ANDREW
  
  noStroke();
  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;
 
  x1 = x1 + xspeed1;
  y1 = y1 + yspeed1;
 
  x2 = x2 + xspeed2;
  y2 = y2 + yspeed2;
 
   scale(s);      // increses the size of the faces - Joshua
   s += 0.002;
  
  
  if (s > 3) {  // resets the scale to 0
    s = 0;
    
  }

  // YELLOW SMILEY FACE
  
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  stroke(0);
  strokeWeight(5);
  fill(#FCE90D);
  ellipse(x,y,80,80);
  fill ( random(255), random(255), random(255), random(255)); // eyes flash random colours
  strokeWeight(2);
  ellipse(x-15,y-10,20,20);
  ellipse(x+15,y-10,20,20);
  fill(0);
  arc(x,y+10,40,40,0, PI);
  ellipse(x-15,y-10,10,10);
  ellipse(x+15,y-10,10,10);
 

 
  //RED SMILEY FACE
  if ((x1 > width) || (x1 < 0)) {
    xspeed1 = xspeed1 * -1;
  }
  if ((y1 > height) || (y1 < 0)) {
    yspeed1 = yspeed1 * -1;
  }
  stroke(0);
  strokeWeight(5);
  fill(#C33333);
  ellipse(x1,y1,80,80);
  fill( random(255), random(255), random(255), random(255));  // eyes flash random colours
  strokeWeight(2);
  ellipse(x1-15,y1-10,20,20);
  ellipse(x1+15,y1-10,20,20);
  fill(0);
  arc(x1,y1+10,40,40, 0, PI);
  ellipse(x1-15,y1-10,10,10);
  ellipse(x1+15,y1-10,10,10);
 
 
 //BLUE SMILEY FACE
  
  
  if ((x2 > width) || (x2 < 0)) {
    xspeed2 = xspeed2 * -1;
  }
  if ((y2 > height) || (y2 < 0)) {
    yspeed2 = yspeed2 * -1;
  }
  stroke(0);
  strokeWeight(5);
  fill(#080B9D);
  ellipse(x2,y2,80,80);
  fill ( random(255), random(255), random(255), random(255));  // eyes flash random colours
  strokeWeight(2);
  ellipse(x2-15,y2-10,20,20);
  ellipse(x2+15,y2-10,20,20);
  fill(0);
  arc(x2,y2+10,40,40,0, PI);
  ellipse(x2-15,y2-10,10,10);
  ellipse(x2+15,y2-10,10,10);
}





