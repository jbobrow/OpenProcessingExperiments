
int counter;
int value = 50;

void setup() { //setup function called initially, only once
size(800, 800);
background(255); //set background white
colorMode(HSB); //set colors to no coperino mode
counter = 0;
}
noStroke();

void draw() { //draw function loops 

if (mousePressed && (mouseButton == LEFT)) {
fill(0);
ellipse(mouseX, mouseY, 50, 50);
}
else if (mousePressed && (mouseButton == RIGHT)) {
fill(127);
rect(mouseX, mouseY, 50, 50);
} 
else if (mousePressed && (mouseButton == CENTER)){
fill(random(255),255,255,255);
triangle(mouseX, mouseY, mouseX+20, mouseY+20, mouseX+40, mouseY-40)
}

}
