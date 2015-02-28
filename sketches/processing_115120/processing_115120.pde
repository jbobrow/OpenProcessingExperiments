
float angle;

void setup() {
  //make the unions of the line rounded 
  size (1300, 1300);
background(40);
  stroke(0);
  strokeJoin(ROUND);
  strokeWeight(3);
  
  //variable
  angle=0;
}

void draw() {
  

  noFill();
  
  
 pushMatrix();
  translate(width/2, height/2);
  rotate(angle); 
  
  //make a cube 
  rect(10, 160, 330, 330);
  rect(160, 10, 330, 330);
  line(10, 160, 160, 10);
  line(490, 10, 340, 160);
  line(160, 340, 10, 490);
  line(340, 390, 340, 490);
  line(340, 490, 490, 340);


  //back square

  line(450, 340, 450, 10);
  line(210, 10, 210, 340);
  line(320, 10, 320, 340);


  //bottom square

  line(362, 468, 32, 468);
  line(450, 380, 120, 380);

  stroke(0);
  fill(50, 50, 255);
  quad(150, 490, 300, 340, 340, 340, 190, 490);
  line(60, 490, 210, 340);
  line(300, 490, 450, 340);

  fill(0);
  quad(490, 340, 450, 380, 410, 380, 450, 340);



  //left square

  line(32, 138, 32, 468);
  fill(255, 255, 0);
  quad(10, 490, 160, 340, 160, 240, 10, 390);

  fill(255, 0, 0);
  quad(160, 10, 160, 60, 100, 120, 100, 70);
  fill(50, 50, 355);
  quad(10, 250, 10, 270, 100, 180, 100, 160);
  line(100, 120, 100, 400);



  //top square

  line(+60, 160, 210, 10);
  fill(255, 255, 0);
  quad(+150, 160, 300, 10, 320, 10, 170, 160);
  line(50, 120, 380, 120);
  line(100, 70, 240, 70);
  line(+280, 50, 450, 50);



  //right square

  fill(0);
  quad(340, 160, 340, 220, 490, 60, 490, 10);

  stroke(0);
  line(340, 230, 490, 70);

  fill(255, 0, 0);
  quad(380, 218, 380, 238, 490, 120, 490, 100);

  line(380, 168, 380, 450);
  line(362, 190, 362, 468);

  line(340, 300, 490, 140);
  line(340, 410, 490, 250);

  fill(255, 255, 0);
  quad(340, 410, 340, 490, 362, 468, 361, 388);

  line(450, 380, 450, 163);

  //front square

  stroke(0);
  line(60, 160, 60, 490);
  line(340, 220, 180, 220);
  line(300, 160, 300, 490);

  fill(0);
  rect(10, 160, 50, 140);


  fill(255, 255, 0);
  rect(300, 160, 40, 60);


  fill(255, 0, 0);
  rect(170, 160, 20, 330);

  line(10, 300, 168, 300);
  
    popMatrix();
  
  angle+=.05;
}

void keyPressed() {  

  save("image.jpg");
  println("yey!!!");
}
