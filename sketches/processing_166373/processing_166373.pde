
int counter;

void setup() {
size (500,500);
}


void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
   if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 20, 20); 
  }
  
  else {
    rect(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
