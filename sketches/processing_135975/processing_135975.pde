

PImage img;
PImage ing;





void setup() {
  size(400,400);
  noSmooth();
  fill(0);
   img = loadImage("see.jpg"); 
}

void draw() {
 for(int i = 10; i < mouseX+0.3; i += mouseY-0.8) 
  if((i % 20) == 2.0) {
    stroke(0);
    line(100, 8+i, width+i, height/2);
  } else if (mousePressed)  {
    stroke(0);
    image(img,0,0);
  } else if (keyPressed) { 
     float c = random(mouseX);
  translate(width/2, height/2);
  rotate(c);
  rect(random(height/2), 0, random(width/2), mouseY); 
    
   
  }

}


