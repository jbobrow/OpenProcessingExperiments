
// Monster 2
// Yuan Li
// Feb 17

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255);
  makeMonster();
}
void makeMonster() {
  //Draw the head of the monster
  //set the ellipse as the center;as mouse moves, the monster moves
  ellipseMode(CENTER);
  strokeWeight(2);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY-85, 100, 100);

  //Body
  strokeWeight(2);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 100, 80);
  ellipse(mouseX, mouseY+50, 100, 80);
  ellipse(mouseX, mouseY+100, 100, 80);
  ellipse(mouseX, mouseY+150, 100, 80);

  //Eye
  strokeWeight(3);
  fill(255);
  ellipse(mouseX, mouseY-92, 48, 40);
  fill(mouseX, 0, mouseY);//Eye color changes as the mouse moves
  ellipse(mouseX, mouseY-86, 25, 20);

  //Mouth
  strokeWeight(2);
  line(mouseX-17, mouseY-55, mouseX+17, mouseY-55);
  fill(255);
  triangle(mouseX-27, mouseY-55, mouseX-17, mouseY-55, mouseX-22, mouseY-65);
  triangle(mouseX+27, mouseY-55, mouseX+17, mouseY-55, mouseX+22, mouseY-65);

  //Ears
  strokeWeight(2);
  fill(255, 0, 0);
  triangle(mouseX-37, mouseY-120, mouseX-100, mouseY-125, mouseX-48, mouseY-90);
  triangle(mouseX+37, mouseY-120, mouseX+100, mouseY-125, mouseX+48, mouseY-90);

  //Tail
  triangle(mouseX+48, mouseY+135, mouseX+50, mouseY+161, mouseX+100, mouseY+110);
  triangle(mouseX+90, mouseY+100, mouseX+110, mouseY+120, mouseX+105, mouseY+105);

  //Arm Left 1 mouseX=250 mouseY=185
  //arms waves as the mouse moves
  line(pmouseX-100, pmouseY-25, mouseX-40, mouseY+25);
  fill(255);
  ellipse(pmouseX-110, pmouseX-35, 48, 40);//problem here!!!
  fill(mouseX, 0, mouseY);
  ellipse(pmouseX-111, pmouseY-29, 25, 20);

  //Arm Right 1
  line(pmouseX+100, pmouseY-25, mouseX+40, mouseY+26);
  fill(255);
  ellipse(pmouseX+110, pmouseY-35, 48, 40);
  fill(mouseX, 0, mouseY);
  ellipse(pmouseX+106, pmouseY-29, 25, 20);

  //Arm Left 3
  line(pmouseX-100, pmouseY+75, mouseX-40, mouseY+125);
  fill(255);
  ellipse(pmouseX-110, pmouseY+65, 48, 40);
  fill(mouseX, 50, mouseY);
  ellipse(pmouseX-111, pmouseY+71, 25, 20);

  //Arm Right 3
  line(pmouseX+100, pmouseY+75, mouseX+40, mouseY+125);
  fill(255);
  ellipse(pmouseX+110, pmouseY+65, 48, 40);
  fill(mouseX, 50, mouseY);
  ellipse(pmouseX+106, pmouseY+71, 25, 20);

  //Press m and the other two arms existed
  if (keyPressed) { 
    if (key=='m') {
      //Arm Left 2
      line(mouseX-100, mouseY+25, mouseX-40, mouseY+75);
      fill(255);
      ellipse(mouseX-110, mouseY+15, 48, 40);
      strokeWeight(2);
      line(mouseX-125, mouseY+20, mouseX-95, mouseY+20);
      fill(255);
      triangle(mouseX-125, mouseY+20, mouseX-115, mouseY+20, mouseX-120, mouseY+10);
      triangle(mouseX-95, mouseY+20, mouseX-105, mouseY+20, mouseX-100, mouseY+10);

      //Arm Right 2
      line(mouseX+100, mouseY+25, mouseX+40, mouseY+75);
      fill(255);
      ellipse(mouseX+110, mouseY+15, 48, 40);
      strokeWeight(2);
      line(mouseX+95, mouseY+20, mouseX+125, mouseY+20);
      fill(255);
      triangle(mouseX+95, mouseY+20, mouseX+105, mouseY+20, mouseX+100, mouseY+10);
      triangle(mouseX+125, mouseY+20, mouseX+115, mouseY+20, mouseX+120, mouseY+10);
    }
  }
}
                
                
