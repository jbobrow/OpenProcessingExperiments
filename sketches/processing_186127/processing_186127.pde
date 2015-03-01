
void setup() {
  size(960, 580);
  stroke(255, 126, 210);
}


void draw() {
  background(120, 252, 0);
 
 
  
  //if the mouse is on the bottom right side of the screen
  if (mouseX > width/2)
    if(mouseY > height/2){ 
      
fill(254, 255, 54);
    ellipse(0, 450, mouseX+250, mouseY+350);
    fill(48, 252, 240);
    ellipse(250, 0, mouseX+150, mouseY+150);
    fill(250, 134, 198);
    ellipse(500, 500, mouseX-200, mouseY-200);

fill(255, 255, 255);
 textSize(400);
text("KIKI", 120, 439);

    }
  
  {
  //if the mouse is on the top left side of the screen
  if(mouseX < width/2)
    if(mouseY < height/2){
    
  fill(255,255,255);
    ellipse(0, 250, mouseX, mouseY+450); //right
    fill(252, 21, 13);
    ellipse(250, 0, mouseX, mouseY+450);
    fill(254, 255, 26 );
    ellipse(300, 200, mouseX-200, mouseY-200);

fill(255, 255, 255);
 textSize(200);
text("HI", 200, 290);

   
  } 
 // top right side of the screen
   if (mouseX > width/2)
    if (mouseY < height/2){
  
      fill(240, 137, 41);
    ellipse(410, 450, mouseX-350, mouseY); //left
    fill(94, 240, 219);
    ellipse(450, 100, mouseX+350, mouseY);
    fill(77, 5, 250);
    ellipse(530, 250, mouseX+200, mouseY+200);

    fill(255, 255, 255);
 textSize(200);
text("I", 700, 290); 
      
      
      
  }     
  
  //bottom left side of the screen
  if (mouseX < width/2)
    if (mouseY > height/2){
  
  
      fill(75, 147, 44);
    ellipse(400, 450, mouseX-100, mouseY-100); //right
    fill(255, 44, 220);
    ellipse(450, 700, mouseX-100, mouseY-100);
    fill(134, 246, 255);
    ellipse(200, 600, mouseX-200, mouseY-200);

   fill(255, 255, 255);
 textSize(200);
text("AM", 190, 580);   
      
    }
  }
  //page seperator 
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
}

