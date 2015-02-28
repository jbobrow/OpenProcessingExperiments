
void setup() {
  size(600, 600);
  
  noCursor();
}

void draw() {
  background(32,28,40);

  if (mousePressed == true) {

    //CROWN
    noFill();
    strokeWeight(15);
    stroke(255, 218, 70);
    triangle(mouseX+80, mouseY-70, mouseX+180, mouseY-70, mouseX+110, mouseY-150);

    //TAIL
    noStroke();
    fill(40, 171, 250);
    rect(mouseX-20, mouseY+250, 130, 20, 200);

    //PAWS DOWN
    fill(36, 235, 255);
    rect(mouseX+155, mouseY+220, 15, 80, 200);
    rect(mouseX+100, mouseY+220, 15, 80, 200);

    //BODY
    rect(mouseX+70, mouseY+100, 100, 180, 30);

    //PAWS UP
    rect(mouseX+40, mouseY+200, 40, 15, 180);
    rect(mouseX+160, mouseY+200, 40, 15, 180);

    //EARS
    triangle(mouseX+40, mouseY+10, mouseX+30, mouseY-30, mouseX+80, mouseY);
    triangle(mouseX+160, mouseY+10, mouseX+150, mouseY-30, mouseX+200, mouseY);

    //HEAD
    rect(mouseX, mouseY, 260, 180, 70);

    //EYES
    fill(255, 218, 70);
    ellipse(mouseX+80, mouseY+70, 70, 70);
    ellipse(mouseX+220, mouseY+70, 70, 70);
    ellipse(mouseX+150, mouseY+25, 70, 40);

    //MOUTH
    noFill();
    strokeWeight(4);
    stroke(40, 196, 250);
    line(mouseX+153, mouseY+80, mouseX+135, mouseY+115);
    line(mouseX+153, mouseY+80, mouseX+165, mouseY+115);
    fill(40, 196, 250);
    triangle(mouseX+140, mouseY+65, mouseX+153, mouseY+80, mouseX+162, mouseY+65);

    //EYES LINE
    fill( random(0,255), random(0,255), random(0,255));
 stroke( random(0,255), random(0,255), random(0,255));
    line(mouseX+85, mouseY+45, mouseX+85, mouseY+95);
    line(mouseX+225, mouseY+45, mouseX+225, mouseY+95);
    noStroke();
    ellipse(mouseX+155, mouseY+25, 30, 30);

    //LAZZER DUDEEEE!
    noFill();
    strokeWeight(2);
    stroke( random(0,255), random(0,255), random(0,255));
   // stroke(mouseY, mouseX, mouseY);
    ellipse(mouseX+150, mouseY-120, 70, 70);
    //fill(145, 44, 255);
    noStroke();
    fill( random(0,255), random(0,255), random(0,255));
    strokeWeight(1);
    ellipse(mouseX+150, mouseY-120, 20, 20);
    triangle(mouseX+150, mouseY-120, mouseX+280, mouseY-140, mouseX+250, mouseY-120);
    quad(mouseX+280, mouseY-140, mouseX+250, mouseY-120, mouseX+430, mouseY-20, mouseX+400, mouseY-100);
    quad(mouseX+430, mouseY-20, mouseX+400, mouseY-100, mouseX+600, mouseY-200, mouseX+550, mouseY-80);
    quad(mouseX+600, mouseY-200, mouseX+550, mouseY-80, mouseX+1500, mouseY+150, mouseX+1500, mouseY-120);
    triangle(mouseX+300, mouseY-180, mouseX+170, mouseY-130, mouseX+200, mouseY-155);
    triangle(mouseX+200, mouseY-80, mouseX+180, mouseY-100, mouseX+250, mouseY-70);

} 
  else {
    noStroke();
    //CROWN
    noFill();
    strokeWeight(15);
    stroke(255, 218, 70);
    triangle(mouseX+80, mouseY-70, mouseX+180, mouseY-70, mouseX+110, mouseY-150);

    //TAIL
    noStroke();
    fill(40, 171, 250);
    rect(mouseX+70, mouseY+215, 20, 130, 200);

    //PAWS DOWN
    fill(36, 235, 255);
    rect(mouseX+155, mouseY+220, 15, 80, 200);
    rect(mouseX+100, mouseY+220, 15, 80, 200);

    //BODY
    rect(mouseX+70, mouseY+100, 100, 180, 30);

    //PAWS DOWN
    fill(40, 196, 250);
    rect(mouseX+155, mouseY+200, 15, 30, 180);
    rect(mouseX+100, mouseY+200, 15, 30, 180);

    //EARS
    fill(36, 235, 255);
    triangle(mouseX+40, mouseY+10, mouseX+50, mouseY-40, mouseX+80, mouseY);
    triangle(mouseX+160, mouseY+10, mouseX+170, mouseY-40, mouseX+200, mouseY);

    //HEAD
    rect(mouseX, mouseY, 260, 180, 70);

    //EYES
    fill(255, 218, 70);
    ellipse(mouseX+80, mouseY+100, 70, 70);
    ellipse(mouseX+220, mouseY+100, 70, 70);
    ellipse(mouseX+150, mouseY+40, 70, 40);

    //MOUTH
    noFill();
    strokeWeight(4);
    stroke(40, 196, 250);
    arc(mouseX+160, mouseY+100, 15, 40, 0, PI);
    arc(mouseX+145, mouseY+100, 15, 40, 0, PI);
    fill(40, 196, 250);
    triangle(mouseX+140, mouseY+85, mouseX+153, mouseY+100, mouseX+162, mouseY+85);

    //EYES LINE
    line(mouseX+85, mouseY+75, mouseX+85, mouseY+125);
    line(mouseX+225, mouseY+75, mouseX+225, mouseY+125);
    ellipse(mouseX+155, mouseY+40, 30, 30);
  }
}
