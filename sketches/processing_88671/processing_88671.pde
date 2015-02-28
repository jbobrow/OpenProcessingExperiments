
void setup() {
  size(600, 600);      //Size 600 by 600 pixels and Black backgroung
}     
void draw() {
  background(0);
  smooth();

  fill(100-mouseX);       //MOON
  ellipse(mouseX, 60, 100, 100);



  fill(150);        //Street
  rect(0, 538, 1200, 125);
  fill(255);
  rect(20, 540, 50, 20);
  rect(150, 540, 80, 20);
  rect(280, 540, 80, 20);
  rect(410, 540, 80, 20);
  rect(540, 540, 80, 20);
  
  

  stroke(0);          //Buildings
  fill(240, 100, 17);
  rectMode(CORNERS);
  rect(0, 180, 150, 476);
  fill(203, 130, 18);
  rect(150, 250, 300, 476);
  fill(240, 100, 17);
  rect(300, 80, 450, 476);
  fill(203, 130, 18);
  rect(450, 150, 600, 476);



  fill(110);             //Body sixpack
  noStroke();
  rectMode(CENTER);
  rect(300, 320, 120, 100); 
  stroke(255); 
  line(300, 300, 300, 370);
  line(240, 330, 360, 330);
  line(240, 350, 360, 350);
  

  noStroke();                      //Robot head and neck
  rectMode(CENTER);
  fill(150);
  rect(300, 65, 130, 50);
  fill(150);
  rect(300, 150, 60, 80);
  fill(255, 0, 0); 
  rect(300, 80, 100, 100);
  fill(0);
  rect(300, 110, 55, 22);
  ellipse(275, 65, 35, 55);
  ellipse(325, 65, 35, 55);
  fill(255);
  ellipse(275, 74, 30, 30);
  ellipse(325, 74, 30, 30);
  fill(0);
  ellipse(275, 73, 10, 10);
  ellipse(325, 73, 10, 10);
  stroke(255);
  line(300, 100, 300, 120);
  line(285, 100, 285, 120);
  line(315, 100, 315, 120);
  line(272, 110, 327, 110);



  fill(255);             //Chest
  rectMode(CENTER);
  rect(300, 226, 250, 150);
  fill(255, 0, 0);
  rect(240, 226, 107, 127);
  rect(360, 226, 107, 127);
  
  

  stroke(255);            //Moving arms and legs
  fill(255);
  fill(255, 0, 0);
  triangle(175, 151, 175, 230, 40, mouseY);
  triangle(425, 151, 425, 230, 560, mouseY);
  fill(255, 0, 0);
  triangle(240, 370, 300, 370, mouseX-200, 580);
  triangle(300, 370, 360, 370, mouseX+200, 580);
}



