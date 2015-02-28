

int [] easing=new int [1];
int num = 200;
int x[] = new int [num];
int y[] = new int [num];

PImage img;

void setup(){
  size (700,400);
  frameRate (25);
  
  img =loadImage ("green.jpg");
  background(0);
  smooth();
 // strokeWeight(0.3); 
 
 noCursor();
}
void draw(){
  
  image (img,0,0);
 //background (0);
 //noStroke();
//strokeWeight(0.3);
  for (int i = x.length -1; i>0; i--){
    
    x [i] = x[i-1];
    y [i] = y[i-1];
    
  }
  
  x[0] = mouseX;
  y[0] = mouseY;


for (int i = 0; i < x.length; i++) {
  
float r = random(50);
strokeWeight(40);
float offset = 40 ; 
// fill (0,r);
     stroke(0,255,4,70); 
if (mousePressed == true) {
fill(174,221,60); //yellow
} else {
fill(177,255,13,r); // yellow
} 

ellipse(x[i],y[i],10*r/22,10*r/22);
stroke (0,255,4,60);
fill (116, 193,206,60);
    
} 
}


