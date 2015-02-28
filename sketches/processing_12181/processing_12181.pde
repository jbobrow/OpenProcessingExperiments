
int x = 0;
int xspeed = 10;
int y = 0;
int yspeed = 10;

void setup() {  
size(640 , 480);  
background(0, 0, 0);   
smooth();  
}  


void draw() {  
  
fill(250, 250, 250);  
display();
xmove();
xbounce();
ymove();
ybounce();
rect(50, 280, 50, 300);
rect(300, 210, 50, 300);
rect(450, 400, 50, 200);
rect(500, 240, 50, 300);
rect(350, 310, 50, 300);
rect(100, 290, 50, 200);
rect(150, 280, 50, 200);
rect(200, 340, 50, 300);
rect(250, 380, 50, 300);
rect(400, 290, 50, 200);
rect(0, 364, 50, 200);
rect(550, 210, 50, 300);
rect(600, 408, 50, 200);
rect(-50, 440, 50, 300);
} 

void xmove () {
  x = x + xspeed; }
  
void xbounce () {
  if ((x > width/5 - x) || (x < 0)) {
    xspeed = xspeed * -1;
  }
}

void ymove () {
  y = y + yspeed; 
}
  
void ybounce () {
  if ((y > height/5) || (y < 0)) {
    yspeed = yspeed * -1;
  }
}


void display () {
  stroke (0);
  fill(173);
  ellipse(mouseX, mouseY, x, y);
}

