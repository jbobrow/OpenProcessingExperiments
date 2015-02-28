
//Responsive robot with background

int x=100; //x coordinate
int y=250; //y coordinate
int armHeight= 20; // arm position
int ny = y- armHeight;

Float easing = 0.03;

PImage img;

void setup(){
size (534, 600);
smooth ();
strokeWeight(1);
img = loadImage("marsatmosphere.jpg");
}

void draw(){
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
  if (mousePressed){
    armHeight = 50;
    image(img, 0, 0);
    background (img);
}
  float ny = y- armHeight; 

background (img);
    
//Antennae
line (x+20, y-140, x+35, y-120);
line (x+95, y-135, x+80, y-120);
fill (0);
ellipse (x+20, y-135, 9, 9);
ellipse (x+95, y-135, 9, 9);

//Head
noStroke ();
fill (144);
rect (x+29, y-120, 60, 60);

//Mouth
fill(255,247,100);
quad (x+50, y-75, x+65, y-75, x+64, y-66, x+53, y-66); 

//Eyes
strokeWeight (1);
fill(255,100,25);
ellipse (x+44, y-99, 15, 24);
ellipse (x+71, y-99, 15, 24);
fill (0);
ellipse (x+44, y-99, 6, 6);
ellipse (x+71, y-99, 6, 6);

//Body
noStroke ();
fill (153);
rect (x+5, y-60, 105, 165);
fill (163);
strokeWeight (1);
rect (x+44, y-30, 30, 30);
fill (179);
rect (x+5, y+60, 105, 15);

//Arms
fill(255,247,100);
ellipse (x+116, ny-armHeight, 24, 24);
ellipse (x-1, ny-armHeight, 24, 24);
fill (179);

//Feet
fill(255,247,100);
rect (x+29, y+105, 21, 21);
rect (x+65, y+105, 21, 21);
fill(255,100,25); 
ellipse (x+38, y+138, 21, 21);
ellipse (x+73, y+138, 21, 21);

}


