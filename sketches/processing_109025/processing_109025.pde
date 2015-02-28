
int counter;
 
void setup() {  //setup function called initially, only once
  size(800, 600);
  background(0);  //set background black
  colorMode(RGB);   //set colors to Red, Green, Blue mode
  counter=0;
}
 
void draw() {  //draw function loops
  counter++;
  fill(random(300)+20,80,13,100);
   
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 45*sin(counter), 45*sin(counter));
  }
}
 
void keyPressed() {
  if (key == ' ') {
    background(0);
  }
}



