
// I made an Impossible Triangle because I've found recently about it and it amazed me,
// and the facebook image, because everybody heard about it and I thought it would be interesting to make it.
// To see the shapes you can comment the line that says noStroke();. It is kind of behind the scene and
// I find it very interesting.
// It is allowed to use more then 20 shapes, the staff commented in forum.
// Here is link: https://class.coursera.org/cdt208-001/forum/thread?thread_id=60#post-552

void setup() {
  background(255);
  size(950, 500);
}
void draw() {
  smooth();

  //Impossible Triangle
  stroke(44, 86, 232);
  strokeWeight(2);
  pushMatrix();  //I've used pushMatrix and popMatrix to apply translate affect only to what's between them
  translate(300, 0);   //translate means i channge the origin from (0,0) to (300,0) in my case. I've used this because I've  
// made the shapes in two different processing sketches and then I combined, and I realised they are one on top of another.  
  line(200, 400, 400, 100); //1
  line(400, 100, 425, 100); //2
  line(425, 100, 600, 400); //3
  line(425, 100, 250, 375); //4
  line(250, 375, 510, 375); //5
  line(200, 400, 525, 400); //6
  line(200, 400, 225, 425); //7
  line(225, 425, 575, 425); //8
  line(575, 425, 600, 400); //9
  line(575, 425, 425, 150); //10
  line(425, 150, 275, 375); //11
  line(525, 400, 405, 180); //12
  popMatrix();

  //Facebook image
  noStroke();
  fill(44, 86, 232); 
  rect(20, 20, 460, 460, 80); //13
  fill(110, 136, 227);
  rect(40, 40, 420, 420, 70); //14
  fill(44, 86, 232);
  rect(60, 60, 380, 380, 60); //15
  fill(255, 255, 255);
  rectMode(CENTER);
  rect(310, 330, 70, 180);    //16
  rect(310, 220, 160, 60);    //17
  rect(310, 190, 70, 90);     //18
  rectMode(CORNERS);
  ellipse(315, 110, 80, 80);  //19
  rect(315, 70, 390, 120);    //20
  rect(275, 110, 345, 160);   //21
  fill(44, 86, 232);
  ellipse(360, 135, 30, 30);  //22
}



