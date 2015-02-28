
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  
  counter = 0;
}

void draw() {  //draw function loops automatically 

  background(255);  //set background white
  
  counter++;
  
  stroke(100,255,50);
  line (counter,110, 30, 144);
  if (counter>width) { counter=0;}

}
