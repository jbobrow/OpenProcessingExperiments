
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
   drawrect(mouseX,mouseY);
   fill(random(255));
   drawrect(mouseX + random(-120,120), mouseY + random(-120,120));
   fill(random(255),random(150),random(50),50);
   drawrect(mouseX + random(-120,120), mouseY + random(-120,120));
  }

}

void drawrect(float c1, float c2){
 rect(c1, c2, 120*sin(counter), 120*sin(counter));
}
