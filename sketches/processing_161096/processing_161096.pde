
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;

void setup() {
  size(800, 600);

}

void draw() {
  background(255);

    if (x > width || x < 0) { 
      xspeed = -xspeed; 
    }
    if (y > height || y < 0) { 
      yspeed = -yspeed; 
    }
    ellipse(x, y, 20, 20);
    ellipse(x+40,y,20,20);
    ellipse(x+80,y,20,20);
  
  x+=xspeed; 
  y+=yspeed;
}


