
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  
}

void draw() {  //draw function loops 

  counter++;
  noStroke();
  fill(random(255),random(150),random(50),50);
  rectMode(CENTER);
  
  if(mousePressed == true) { //add some interaction
    rect(mouseX, mouseY, 120*sin(counter), 120*sin(counter));
  }

}

void drawrect(){

}
