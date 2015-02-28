
int x = 0; 
void setup(){
  size(400, 400); 
  noStroke();
 
  //how fast DRAW runs through the code
  frameRate(2);
}

void draw(){
  //random generates a number between 0 to the # you give it
  fill(random(255), random(255), random(255), 20);
  quad(random(300), random (200), random(400), random(400), 75, 75, 45, 45);
  
  frameRate(5); 
  fill(117, 237, 188, 10); 
  rect(width/2, height/2, width/3, height/3, mouseX, mouseY);
}

