
//Animação Rafael
int counter;

void setup() { 
  size(200, 200);
  background(0);  
  colorMode(RGB);   
  counter = 0;
}

void draw() {  
  counter++;
  noStroke();
  fill(random(255),50,255,100);
  
  if(mousePressed == true) { 
    rect(mouseX, mouseY, 15, 15);
  }
  else {
    rect(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
