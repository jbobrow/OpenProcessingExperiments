
PImage img;
void setup(){
  size(400, 530);
  background(120, 255, 0);   
 img = loadImage("woman.jpg");
}

void draw(){
  image(img, 0, 0);

  //ballon
  noStroke(); 
  fill(255, 0, 255, 230);
  stroke(0);
  line(53, 470, mouseX, mouseY);
ellipse(mouseX, mouseY, 70, 90); 
line(53, 470, mouseX -40, mouseY +30);
fill(120, 255, 0, 230);
ellipse(mouseX -40, mouseY+ 30, 50, 60); 
line(53, 470, mouseX , mouseY +90);
fill(255, 255, 0, 230);
ellipse(mouseX, mouseY+ 90, 70, 80);  
}


