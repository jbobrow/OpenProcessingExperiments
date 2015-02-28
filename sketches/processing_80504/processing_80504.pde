
float max_distance;

int rad = 60;        
float xpos, ypos;       

float xspeed = 3;  
float yspeed = 2.6;  

int xdirection = 1;  
int ydirection = 1;  



void setup() {
  size(800, 406); 
  
  noStroke();
  frameRate(40);
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2;
 
  noStroke();
  max_distance = dist(0, 0, width, height);
}

void draw() {
  background(0);

 
    for(int i = 0; i <= width; i += 50) {
    for(int j = 0; j <= height; j += 40) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 35;
      noStroke();
      fill(255);
      rect(i, j, size, size);
    }
  }
   noStroke ();
     fill(139,113,17,50);
     rect (26,0,450,200);
   
    noStroke ();
     fill(35,73,152,70);
     rect (0,0,800,406);
     
    fill(35,73,152,90);
    noStroke();
    ellipse (0,266, 150,150);
    
    fill (79,102,167,70);
    noStroke();
    ellipse(690,330,50,50);
    
    fill (206,168,29,90);
    noStroke();
    ellipse(mouseX,mouseY,30,30);
    
    xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
 fill(255,0,0,80);
  ellipse(xpos, ypos, rad, rad);
   
}
