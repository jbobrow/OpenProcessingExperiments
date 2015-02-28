
PImage img;

void setup(){
 size(600,600);
 img = loadImage("arb.jpg");
 imageMode(CENTER);
 frameRate(300);
 fill(10,170,250);
 noStroke();
 background(img);
}

void draw(){
 ellipse(mouseX, mouseY,10,10);
 ellipse(mouseY, mouseX,10,10);
}

void mouseDragged(){
 fill(250,150,10);
 line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed(){
 fill(70,50,5);
 ellipse(mouseX, mouseY,10,10); 
}

void keyPressed(){
 fill(5,90,130);
 ellipse(mouseX, mouseY, 10, 10);
}

