
//Juliana Freitas Verlangieri
// Creative Computing - SecB ; Benjamin Bacon

int radius = 400;
float x = -radius;
float speed = 2;
//int posX = 400;

void setup() {
  size(400,400);
  smooth();
  noStroke();
}

void draw() {
  background(226,226,193);
  
      if (mouseX > 59 && mouseY < 46){
      background(242, 110 , 80);}
      else if (mouseX > 353 && mouseY > 46){
          background(242, 110 , 80);} 
          else if (mouseX < 346 && mouseY > 86 && mouseY < 126){
                background(242, 110 , 80);
                } else if (mouseY > 53 && mouseY < 126 && mouseX < 346){
                   background(242, 110 , 80);
                } else if (mouseY > 126 && mouseY < 213 && mouseX < 48){
                   background(242, 110 , 80);
                } else if (mouseY > 135 && mouseY < 206 && mouseX > 55){
                   background(242, 110 , 80);
                } else if (mouseY > 213 && mouseY < 286 && mouseX < 346){
                   background(242, 110 , 80);}
                   else if (mouseY > 344 && mouseX < 180){
                   background(242, 110 , 80);}
                   else if (mouseY > 344 && mouseX > 220){
                   background(242, 110 , 80);}
    
    
  fill(8,107,99);
  rect(75, 0, 325, 29);
  rect(369, 29, 31, 240);
  rect(0, 69, 329, 40);
  rect(0, 109, 31, 120);
  rect(71, 149, 298, 40);
  rect(0, 229, 329, 40);
  rect(0, 360, 163, 40);
  rect(237, 360, 163, 40);

  fill(191, 174, 149);
  ellipse(mouseX,mouseY,33,33); 
  
  fill(8,107,99);
  rect(x, 269, 61, 91);
  x -= speed;
  if (x < 0) {
    x = radius;}
    
  rect(x-200, 269, 61, 91);
  x -= speed;
  if (x < 0) {
    x = radius;}
    
   rect(x+200, 269, 61, 91);
  x -= speed;
  if (x < 0) {
    x = radius;}
   
}


