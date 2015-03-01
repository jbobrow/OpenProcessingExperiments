
//Statement: This work is concentrated on the subject of beginnings.
//It reflect my personal feeling towards processing - the chaos and the uncontrolle over it.
//"May I advanced" would be probably the next stage in this series of works.
//Wich can begin if one would Press the left mouse key.
//In other word I just wanted to see what I can do to survive the assignment and the statement seem the hardest part.

PImage fractal;
PImage birth;

//global
color[] palette = {#29E727,#EBF01A,#7F521D,#960B30,#33D6BA};
float x;

//setup block
void setup() {
 size(800,600);
 fractal = loadImage("2014-01-13 10.36.08.jpg");
 birth = loadImage("birth1.jpg");

  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  noFill();
  background(random(360));
}


void draw() { 
image(fractal,0,0,1200,900); 

 x+=200;
  float r = random(5);
fill(palette[int(r)]);
textSize(60) ;
textAlign(LEFT);
text("At the begining", random( x) ,random(height)) ; 
x = constrain (x, 0, 200);

  if(mousePressed){
   image(birth,0,0,1000,800);
   
  }
}

  

