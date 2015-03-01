

int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;

void setup() {
  size(500, 500);

}


void draw() {
  background(177,254,255);


    
    //noStroke();
    for(int i = 0; i <120; i+=40){
    fill(255,255,255,100);
     ellipse(x+i, y, 20, 20);
    fill(255);
    ellipse((x-3)+i, y-3, 5, 5);
    fill(255);
    ellipse((x-4)+i, y+3.5, 3, 3);
     if (x +i > width || x  < 0) { // left and right walls
      xspeed = -xspeed; // go the other way
    }
    if (y > height || y < 0) { // top and bottom walls
      yspeed = -yspeed; // go the other way 
    }
    };
       
   // ellipse(x +40, y, 20, 20);
   // ellipse(x -40, y, 20, 20);

  
  x+=xspeed; // this effectively moves them
  y+=yspeed;
}



