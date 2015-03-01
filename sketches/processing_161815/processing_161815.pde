
int counter;
PImage img;

void setup() {
size(400,300);
background(0);
 img = loadImage("http://media-cache-ec0.pinimg.com/236x/e7/ea/8f/e7ea8f4c6fef2142985892ec97ae4f8f.jpg");
}
 
void draw() {
  
image(img, 0, 0);
 
rect(0,170,400,20);
fill(100,25,255);
 
if ((mouseX>0)&&(mouseY>180)&&(mouseX<400)&&(mouseY<230)){
fill(255,85,0);
    }
    
    rect(0,200,400,20);
fill(100,25,150);
 
if ((mouseX>0)&&(mouseY>180)&&(mouseX<400)&&(mouseY<230)){
fill(255,85,250);
   }
    rect(0,140,400,20);
fill(100,25,100);
 
if ((mouseX>0)&&(mouseY>180)&&(mouseX<400)&&(mouseY<230)){
fill(255,85,100);
   }
    rect(0,110,500,20);
fill(10,25,255);
 
if ((mouseX>0)&&(mouseY>100)&&(mouseX<400)&&(mouseY<430)){
fill(25,255,255);
    }
noStroke();

text("S.E MAGAZINE", 270,250,80,400);
  
}
