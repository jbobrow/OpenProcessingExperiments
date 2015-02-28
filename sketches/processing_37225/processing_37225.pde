
//I declare a variable type boolean, I call it mouseIsDown
//and I assign a value false. All in one instruction.
boolean mouseIsDown = false;
float r = random(0, 255);
float g = random(0, 255);
float b = random(0, 255);
float shft = 20;
int posX, posY;
int stweight = 1;
 
void setup() {
  size(700, 700);
  background(0, 0, 0);
}
 
void draw() {
 
//variable stroke according to speed
//float strokeW = abs(mouseX - pmouseX);
//strokeWeight(strokeW);
 
  //draw line only if mouse is down
  if (mouseIsDown == true) //same as if(mouseIsDown)
  {
    r += random(-shft, shft);
    g += random(-shft, shft);
    b += random(-shft, shft);
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain (b, 0, 255);
    
    stweight += random(-1.5, 1.5);
    stweight = constrain (stweight, 1,5);
    
    stroke(r,g,b,50);
    strokeWeight(stweight);
    strokeCap(SQUARE);
    float dx = mouseX - posX;
    float dy = mouseY - posY;
    
    posX += dx/70;
    posY += dy/70;
    line(posX, posY, pmouseX, pmouseY);
  }
 
}
 
 
//this function is called every time you press a mouse button
void mousePressed() {
  mouseIsDown = true;
}
 
//this function is called every time you release a mouse button
void mouseReleased() {
  mouseIsDown = false;
}
