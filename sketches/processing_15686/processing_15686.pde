


void setup() {
  size(250,370);
  background(200);
}

void draw() {
   background(0);
  
  //this is the loop that changes the ypos
  for (int ypos = 0; ypos < 400; ypos = ypos + 20){
 
  //this is the loop that changes the xpos
  for(int xpos = 0; xpos < 400; xpos = xpos + 20) {
    
    ellipse(xpos,ypos,50,50);
    fill(200,65,40);
    ellipse(xpos+30,ypos+10,40,40);
    fill(mouseX,20,20,20);
    ellipse(xpos,ypos+400,30,30);
    fill(mouseX,100,50);
    ellipse(mouseX + 10,mouseY - 10,20,20);
    ellipse(120,mouseX,mouseY,50);
     
  }
}
}



