
/* circle-related things*/
int x = 25;
int y = 40;

int xspeed = 3;
int yspeed = 5;


/* colour stuff*/
color c;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
  c=color(255);

}

void draw(){
  x += xspeed;  
  y += yspeed; 
  
  c = color(mouseY-mouseX,mouseY-(mouseX/2),mouseY+(mouseX/4),5);
  fill(c); 
  if (x<25) {
    xspeed = -xspeed;    
    x = 25;
  }
  else if (x>width-25) {
    xspeed = -xspeed;
    x = width-25;
  }
 
  if (y<25) {
    yspeed = -yspeed;
    y = 25;
  }
  else if (y>height-25) {  
    yspeed = -yspeed;
    y = height-25;
  }
 
  ellipse(x, y, 50, 50);
  
  c = color(mouseY-(mouseX/2),mouseY-mouseX,mouseY+(mouseX/2),5);
  fill(c);
  
  ellipse(y, x, 60, 60);

}

void mousePressed() {
  print('a');
   
  smooth();
  fill(0,0,0,250);
  textSize(random(50,135));
  text('a',random(500), random(500)); 
 }



