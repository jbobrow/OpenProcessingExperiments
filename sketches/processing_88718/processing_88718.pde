
void setup() {
  size(600, 400);
}

void draw() {
  rectMode(CORNER);
  background(255);//white
  fill(0, 0, 255);//blue
  rect(0, 0, 280, 180);//upperleft
  rect(320, 220, 280, 180);//bottomright
  fill(255, 0, 0);//red
  rect(320, 0, 280, 180);//upperright
  rect(0, 220, 280, 180);//bottomleft





 


    strokeWeight(4);//outline thickness
    stroke(255);//oultine color
    fill(230, 0, 0);//car color
    rectMode(CENTER);
    rect(mouseX, mouseY, 200, 50);//car body
    fill(0);//black
    rect(mouseX-85, mouseY+50, 20, 48);//left wheel
    rect(mouseX+85, mouseY+50, 20, 48);//right wheel
    fill(230, 0, 0);//red
    quad(mouseX-85, mouseY-25, mouseX-65, mouseY-75, mouseX+65, mouseY-75, mouseX+85, mouseY-25);//car top
    noStroke();//no outline
    fill(44, 255, 250);//blue
    quad(mouseX-70, mouseY-35, mouseX-60, mouseY-65, mouseX+60, mouseY-65, mouseX+70, mouseY-35);//car window
    fill(246, 255, 0);//light's color
    ellipse(mouseX-75, mouseY, 35, 35);//left light
    ellipse(mouseX+75, mouseY, 35, 35);//right light
    fill(255, 230, 0);//yellow
    triangle(mouseX-20, mouseY+15, mouseX-10, mouseY, mouseX, mouseY+15);//W
    triangle(mouseX, mouseY+15, mouseX+10, mouseY, mouseX+20, mouseY+15);//C
    triangle(mouseX-10, mouseY, mouseX, mouseY-15, mouseX+10, mouseY);//P
}
  
   void mouseDragged(){
    rectMode(CORNER);
    fill(255,0,0);
    rect(0,0,280,180);
    rect(320,220,280,180);
    fill(0,0,255);
    rect(320,0,280,180);
    rect(0,220,280,180);
   }




