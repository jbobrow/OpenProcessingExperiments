
PImage type;
PImage otter;
PImage t;
int w=0;
int x,y;
float q,z,dX,dY;
float easing;
 
 
void setup()
{
  colorMode(HSB,360,100,100);
  size(600,400);
  frameRate (100);
  background (160,30,100);
  smooth();
  otter= loadImage("otter.gif"); 
   
 
   
  //image should be black and white type:
  type = loadImage("Rossa1.gif");
  t= loadImage("thumbsup.gif");
  
   
  background(60,60,100);
  strokeWeight(.5); //create thin, delicate lines
  q=0;
  z=0;
  easing=.05;
   
   
  //goes through 100000 iterations!
  for (int i = 0; i < 100000; i++){
     //get random x and y coordinates
     x = int(random(width));
     y = int(random(height));
 
     //gets the color values of the current pixel
     color cp = type.get(x,y);
 
     //determines their brightness
     float b = brightness(cp);
 
     //b == 0 is black
     //Checks for instances in which the chosen pixel is black
     if (b == 0){
        fill(180, 50 , 80);
        float ellSize = random(8,10); //Random ellipse size between 5 and 30
        ellipse(x,y,ellSize,ellSize);
        
        
     }
  }
}

void draw(){
noFill();



image(t,350,240);

  for(int i=0; i<=20; i++){
    w++;
    
    image(otter,400,25);
    tint(w*20,100,100);
    noStroke();
    if (w==22){
      w=0;
      
      
    }





  
  
  }}


