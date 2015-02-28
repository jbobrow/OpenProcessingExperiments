
int bgcolorCounter=0;
float clickTime=0;
int colorCounter=0;
int colorVector=1;
float bgOpacity;
int prevX;
int prevY;

void setup(){
size(800, 800);
smooth();
background(255);
}

void draw(){
  
bgOpacity = sqrt((float)pow(mouseX - prevX, 2) + (float)pow(mouseY - prevY, 2));  
  
noStroke();
fill(100, bgOpacity+15);

rect(0, 0, width, height);
  
  
  bgcolorCounter+=colorVector;
 /* if(bgcolorCounter>360){bgcolorCounter=0;}
  colorMode(HSB);
 background(bgcolorCounter, 100, 100);
 */
 //draw a circle when you click
 
 //
 if(mousePressed)
 {
   if(clickTime< 1600)
   {
   clickTime++;
   clickTime+=clickTime/4;
   }
 }
 else
 {
   if(clickTime>0)
   {
     clickTime-=clickTime/8;
   }
   else
   {
     clickTime=0;
   }
 }
 
  colorCounter = colorCounter+colorVector;//the counter for the circle color
  if(colorCounter>=360 || colorCounter<=0)
  {
    colorVector = colorVector*-1;
  }
  
 colorMode(HSB, 360);
 
 ellipseMode(CENTER);
 noStroke();
 fill(colorCounter, 360, 360);
 ellipse(mouseX, mouseY, clickTime, clickTime);
 
 stroke(colorCounter, 360, 360);
 line(mouseX, mouseY, prevX, prevY);
 
 
 print(clickTime);
 prevX=mouseX;
 prevY=mouseY;
}






