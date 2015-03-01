
int counter;

void setup() {  
  size(500, 500); //need a bigger canvas
  background(0);  //set background black
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke(); //adds no stroke to shapes drawn

   
  if(mousePressed && (mouseButton == LEFT)) {
    fill(255,0,0);
    ellipse(mouseX, mouseY, 20, 20); //when the left mouse button is pressed, a red circle is drawn at mouseX/mouseY
  }
  
  else{
   if(mousePressed && (mouseButton == RIGHT)) {
    fill(0,0,255);
    rect(mouseX, mouseY, 20, 20); //when the right mouse button is pressed, a blue square is drawn at mouseX/mouseY
  
  }
    
  if(mousePressed && (mouseButton == CENTER)) {
   fill(0,255,0);
   ellipse(mouseX, mouseY, 20, 20); //when the scroll mouse button is pressed, a green circle is drawn at mouseX/mouseY
   }
}
}



