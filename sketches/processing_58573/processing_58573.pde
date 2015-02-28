
//set variables
PImage bg; 
//set window, bg color & anti-alias
void setup(){
size(800,600);
background(255);
smooth();
}

//drawing settings
void draw(){
//set static image
noLoop();
//set images
bg = loadImage("bg.png");
//set transparency
tint (255,80);
image(bg,0,0);
  //set text
PFont font;
font = loadFont("Garton-48.vlw"); 
textFont(font, 60); 
fill(60,160,100,255);
text("weaving", width-250, height-100);

//define position values through variables
int x=width/2;
int y=height/2;
 
//define WEAVING
for (int i=0; i<100; i++)
{
//pre rotation
rotate(PI/20);
//color definitions (map mouse position for color)
float c = map (mouseY, 0, height, 255, 0);
//countour
  strokeWeight(random(5));
  stroke(random(c),173,c,random(150,220));
//first cross weaving - blue, 1st thick, 2nd thinner
//first x and y coordinates define position of weaving curve
line(x*-1.5/2,y*-1.5,2*x+i,2*y+i);
line(x*-2.5/2,y*-2.5,x+i,y+i);
}
//second cross weaving - orange
for (int d=0; d<100; d++)
{
  //countour
  strokeWeight(random(5));
  //color definitions
  stroke(random(255),173,random(200),random(180));
 
//rotations define amount of curving and weave's thickness
rotate(PI/40);
rotate(PI/20);
line(1.5*x*-0.5/2,1.5*y*-0.5,2*x+d,2*y+d);
}
 
//point of fabric's connection
strokeWeight(1.5*x*0.5/2);
point(0,0);

saveFrame("line-####.png");



}

