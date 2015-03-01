
int counter;

void setup() {  
  size(500, 500);
  background(255);  //set background white
  
  counter = 0;
}

void draw() {  //draw function loops 
  counter+=1;
  stroke(random(255), random(255) , random(255), 50);
  noFill();
  if (counter == 150)
  {
  counter=0;
  }
  
  if(mousePressed == true) { 
  
    ellipse(mouseX, mouseY, counter, counter*sin(counter)));
 
}
