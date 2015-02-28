
void setup () {
  size(600, 600);
  background(170);
  smooth();
}


void draw() {
  fill(255, 20);
  noStroke();
  rect(0, 0, width, height);



  noStroke();
  /*fill(25);
   rect(5,5,5,5);*/

  //if(mousePressed){



  stroke(15, 80);
  line(200, 200, mouseX, mouseY);

  line(200, 200, mouseX, mouseY);
  line(200, 250, mouseX, mouseY);


  line(400, 200, mouseX, mouseY);
  line(200, 400, mouseX, mouseY);
  line(400, 400, mouseX, mouseY);
  line(300, 200, mouseX, mouseY);
  line(400, 300, mouseX, mouseY);
  line(200, 300, mouseX, mouseY);
  line(300, 400, mouseX, mouseY);


  /*line(250,200,mouseX,mouseY);
   line(200,250,mouseX,mouseY);
   line(450,200,mouseX,mouseY);
   line(400,250,mouseX,mouseY);
   line(250,400,mouseX,mouseY);
   line(200,450,mouseX,mouseY);
   line(450,400,mouseX,mouseY);
   line(400,450,mouseX,mouseY);
   line(350,200,mouseX,mouseY);
   line(300,250,mouseX,mouseY);
   line(450,300,mouseX,mouseY);
   line(400,350,mouseX,mouseY);
   line(250,300,mouseX,mouseY);
   line(200,350,mouseX,mouseY);
   line(350,400,mouseX,mouseY);
   line(300,450,mouseX,mouseY);
   */


  if (mousePressed && (mouseButton == LEFT)) {
    noStroke();
    fill(255, 20);
    rect(0, 0, width, height);


    fill(255, 50);
    ellipse(mouseX, mouseY, 300, 300);
    stroke(255);
    line(200, 200, mouseX, mouseY);
    line(400, 200, mouseX, mouseY);
    line(200, 400, mouseX, mouseY);
    line(400, 400, mouseX, mouseY);
    line(300, 200, mouseX, mouseY);
    line(400, 300, mouseX, mouseY);
    line(200, 300, mouseX, mouseY);
    line(300, 400, mouseX, mouseY);
  }
}



