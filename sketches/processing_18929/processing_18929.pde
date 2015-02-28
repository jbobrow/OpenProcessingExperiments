
float y = 50.0;	// y position variable 
float speed = 1.5;	// value for speed float 
float radius = 15.0; // value for circle size
void setup(){ 
  size(250,250); 
  smooth(); 
  noStroke(); 
  ellipseMode(RADIUS);
  
  background (0);
  
smooth ();
noStroke ();

for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (255, 140);
    ellipse (x+5, y+5, 40, 40);
  }
}

}
void draw(){  
  fill (255,175,175,80);
 
ellipse (2, y+10, random (1,250), 1);
ellipse(20, y+60, 2, 2);
ellipse (60, y-40, 1, 1);
ellipse (80, y+30, 2, 2);
ellipse (25, y-5, 1, 1);
ellipse (40, y-60, 1, 1);
ellipse (55, y+25, 2,2);
ellipse (67, y-100, 1, 1);
ellipse (74, y+10, 1, 1);
ellipse (80, y-80, 2, 2);
ellipse (90, y+20, 1, 1);
ellipse (98, y+40, 1, 1);
ellipse (110, y-20, 2, 2);
ellipse (122, y-70, 1, 1);
ellipse (120, y+10, 1, 1);
ellipse (125, y+30, 2, 2);
ellipse (138, y-20, 1, 1);
ellipse (146, y-60, 1, 1);
ellipse (150, y-40, 2, 2);
ellipse (157, y+10, 1, 1);
ellipse (166, y+15, 1, 1);
ellipse (177, y-100, 2, 2);
ellipse (190, y-80, 1, 1);
ellipse (205, y+5, 1, 1);
ellipse (215, y+25, 2, 2);
ellipse (226, y-5, 1, 1);
ellipse (210, y-20, 1, 1);
ellipse (225, y+20, 2, 2);
ellipse (230, y+40, 1, 1);
ellipse (240, y-15, 1,1 );
ellipse (245, y+10, 1, 1);
ellipse (250, y-5, 1, 1);

// draw circle based on variables 
y += speed;	// increase value to move circle

if(y > height+radius){
// if y is greater than height of window and half circle size
y = - radius;
// move it to above top of window with a negative position

	

}
}



