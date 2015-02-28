
void setup() {
  size(400,400);
  frameRate(5);
  
  
   
}
 
boolean isSunrise = false;
int resolution = 256;
float radius = 100;
float circleX = width;
float circleY = 30;
float x = 1;




void draw() {
  
}

void mousePressed() {
 if (isSunrise) {
   drawSunrise(); 
   
 } else { 
   drawWave();
 }
 //means flip variable between false and true
isSunrise = !isSunrise; 

}

void mouseDragged() {
 ;
 if (isSunrise) {
      drawClouds(); 
 }
       
      
}
       


void drawWave() {
   background(100);
   noStroke();
   fill(#4D69FF);
   ellipse(0,470,400,200);
   ellipse(350,470,400,200);
   fill(#1F42FF);
   ellipse(200,470,600,200);
}

void drawSunrise() {
  background(#03CEFF);
    fill(#FF8000);
  ellipse(width/2,480,250,250);
}


void drawClouds() {
  fill(#E8E5E5);
x=x+2;

  ellipse(mouseX,50,100,50);

  x=x+2;

  ellipse(mouseX+10,70,100,50);

}




