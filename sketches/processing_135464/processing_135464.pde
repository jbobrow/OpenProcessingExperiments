

float y=1;
float e=1;
 
void setup(){frameRate(30);
size(1000,1000);
 
background(240);}
 
void draw() {
 

noStroke();
ellipse(mouseX, mouseY,50,50);
ellipse(mouseY, mouseX,50,50);
ellipse(height-mouseX, mouseY,50,50);
ellipse(height-mouseX, height-mouseY,50,50);

 

e=e+random(20);
 
if(mouseY<500) {fill(0,0,0,random(100));
}
if(mouseY>500) {fill(random(200)+100,1,1,random(100)+100);
 
}}
