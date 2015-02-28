
int counter;

void setup() { 
size(400,400); 
} 

void draw() { 
background(255); 
colorMode(HSB,360,100,100);
 
fill(random(360),100,100,100);
ellipse(mouseX,mouseY,50,50); 
ellipse(mouseX,mouseY,100,100); 
ellipse(mouseX,mouseY,150,150); 
 noStroke();
fill(50,100); 

if(mousePressed == true) 
ellipse(mouseX, mouseY, 80, 80);
}
