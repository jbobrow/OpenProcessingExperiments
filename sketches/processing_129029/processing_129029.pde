
void setup () {
  size (500, 500);
  mouseX = 100;
  mouseY = 100;


  
}

void draw () {
  background (255, 200, 255);
  stroke(0, 255, 0);
    fill(0,255,0);
  

  ellipse(mouseX+60, mouseY+115, 25, 25);
  ellipse(mouseX, mouseY+115, 25, 25);
    fill(255,100,150);

  rect(mouseX-20, mouseY-20, 100, 130);
    fill(0,255,0);

  rect(mouseX-10, mouseY, 30, 30);
  rect(mouseX+30, mouseY-10, 40, 40);
    fill(255);
    
  rect(mouseX-10, mouseY, 15, 15);
  rect(mouseX+30, mouseY-10, 20, 20);
    fill(0);
 
  rect(mouseX-7, mouseY+3, 7, 7);
  rect(mouseX+35, mouseY-5, 10, 10);
  line(mouseX-40, mouseY, mouseX-20, mouseY+80);
  line(mouseX+100, mouseY, mouseX+80, mouseY+80);
    fill(255,150,150);

  ellipse(mouseX+30, mouseY+70, 50, 20);
  


  

}

