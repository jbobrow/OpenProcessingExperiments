
int counter;

void setup() {  
  size(192,157);
  background(0);  
  colorMode(HSB);  
  counter = 0;
}

void draw() {  
  counter++;
  noStroke();
  fill(random(255),97,179,65);
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 30, 30);
  }
  else {
    rect(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

                
                                
