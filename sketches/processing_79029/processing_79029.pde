
/* circle-related things*/
int x = 25;
int y = 40;

int xspeed = 3;
int yspeed = 6;


/* colour stuff*/
color c;


void setup() {
  size(500, 500);
  smooth();
  background (200);
  noFill();
  c=color(200);

}


    

void draw(){

  x += xspeed;  
  y += yspeed; 
  
  c = color(mouseY-mouseX,mouseY-(mouseX/2),mouseY+(mouseX/2),105);
  stroke(c); 
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
  noFill();
  ellipse(x, y, 50, 50);
  
  c = color(mouseY-(mouseX/2),mouseY-mouseX,mouseY+(mouseX/2),105);
  stroke(c);
  ellipse(y, x, 60, 60);
}

void mousePressed(){
  if (mouseButton == LEFT) {
      stroke(c);
      noFill();
      triangle(mouseX, mouseY, mouseX/3, mouseX/3, mouseY+30, mouseY+30);
  }
}

void keyPressed(){
    if (keyPressed == true){
    fill(200);
    noStroke();
    rect(0,0, width, height);
  } 
}


