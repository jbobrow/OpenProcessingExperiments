
int posX = 50;
int dirX = 0;
int RED = 50;
int BLUE = 60;
int GREEN = 20;
int ellipseSize = 120;

void setup() {
  size(600, 500);
  background (RED, GREEN, BLUE);
}

void draw() {
  background (RED, GREEN, BLUE);
  println (mouseX + "" + mouseY); //gives mouse control over the associated co-ordinates
  // fill(30, 60, 20);
  noStroke (); //removes any stroke from the shapes

  rect(100, 200, 150, 220);
  animator ();
  ellipse(posX, mouseY, ellipseSize, ellipseSize);

  strokeWeight (5);
  stroke(mouseX, mouseY, mouseY-mouseX); //gives mouse movement control over colour
  line(100, 100, mouseY, mouseX);

  if (mouseX < width/2 && mouseY > height/2) {  //Localised controls
    fill (30, 60, 100);
  }
  else if (mouseX < width/2 && mouseY < height/2) { //bottom left
    fill (230, 20, 20);
  } 
  else if (mouseX > width/2 && mouseY < height/2) {
    fill (20, 100, 40);
  }
  
  else{
     fill (50, 50, 50);
    
  }
}


void animator(){
  if(posX >= width-ellipseSize/2){ 
  dirX = 1;
  }
  if (posX <= ellipseSize/2) {
  dirX = 0;
  }
  if (dirX == 1) {
  posX = posX - 5;
  }
  else {
    posX = posX + 5;
  }
}










