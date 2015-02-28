
//the many faces of Dashiell Farewell: use the Q key to draw head and facial
//hair, as much or as little as you want! Odds are any combination you come up 
//with, the ever fickle Dashiell has had at some point in his life! Press Q to 
//start drawing where the mouse moves and press any other key to stop. Also press
//the W key to make the mouth open or press the C key to change regular glasses
//to stylish sunglasses. Finally, press T to make him put on something more stylish!



void setup()

{
  size(500, 500);
  background(255);
  smooth();
  stroke(100);

  ellipse(255, 255, 260, 260); //head

  noFill();
  stroke(0, 0, 300);
  strokeWeight(1);
  ellipse(195, 195, 27, 27); //left eye

  stroke(0,300,0);
  strokeWeight(4);
  point(195, 195);//left pupil

  stroke(50, 50, 0);
  strokeWeight(4);
  line(180, 175, 210, 175);//left eyebrow

  stroke(300, 300, 0);
  strokeWeight(3);
  ellipse(195, 195, 40, 40); //left glasses

  noFill();
  stroke(0, 0, 300);
  strokeWeight(1);
  ellipse(315, 195, 27, 27); //right eye

  stroke(0,300,0);
  strokeWeight(4);
  point(315, 195);//right pupil

  stroke(50, 50, 0);
  strokeWeight(4);
  line(300, 175, 330, 175);//right eyebrow


  stroke(300, 300, 0);
  strokeWeight(3);
  ellipse(315, 195, 40, 40); //right glasses

  stroke(300, 300, 0);
  line(215, 200, 295, 200); //connecting lenses

  line(175, 200, 165, 165); //left ear piece

  line(335, 200, 345, 165);//right ear piece

  stroke(0);
  strokeWeight(1);
  line(255, 255, 210, 285);
  line(210, 285, 245, 285);//nose

  stroke(300, 0, 0);
  strokeWeight(2);
  line(215, 325, 295, 325);//mouth
}

void draw()
{
  if (key=='q')
  {
    stroke(113, 73, 8, 50);
    fill(113, 73, 8, 50);
    ellipse(random(mouseX-5, mouseX+5), random(mouseY-5, mouseY+5), 10, 10);//draw hair
  }

  if (key=='w')

  {   

    noFill();
    stroke(300, 0, 0);
    strokeWeight(2);
    smooth();
    bezier(215, 325, 225, 340, 305, 340, 295, 325);//open mouth
  }

  if (key=='c')
  {
    fill(0);
    stroke(0);
    strokeWeight(3);
    ellipse(195, 195, 40, 40);
    ellipse(315, 195, 40, 40);
    stroke(0);
    line(215, 200, 295, 200); 
    line(175, 200, 165, 165); 
    line(335, 200, 345, 165); //put on sunglasses
  }


  if (key=='t')
  {
    smooth();
    fill(0);
    stroke(0);
    rect(155, 385, 200, 200);
    stroke(300, 0, 0);
    fill(255);
    stroke(255);
    triangle(250, 450, 300, 385, 200, 385);
    fill(300, 0, 0);
    stroke(300, 0, 0);
    ellipse(255, 390, 25, 25);
    triangle(255, 390, 225, 375, 225, 405);
    triangle(255, 390, 285, 375, 285, 405);//put on a suit

  }
}















