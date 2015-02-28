
void setup(){
  size(400,400);
  smooth();
  background(255);
  noStroke();  
  fill(242,208,176);
  ellipse(100,225,40,65);
  ellipse(300,225,40,65);
  fill(185,150,120);
  ellipse(100,225,20,40);
  ellipse(300,225,20,40);
  fill(242,208,176);
  rectMode(CENTER);
  rect(200,200,200,200);
  quad(100,300,175,370,225,370,300,300);
  fill(85,50,25);
  ellipse(200,100,200,120);
  triangle(100,100,100,200,200,100);
  triangle(300,100,300,200,260,100);
  stroke(85,50,25);
  strokeWeight(10);
  line(220,190,250,187);
  line(180,190,150,187);
  line(250,187,275,190);
  line(150,187,125,190);
  noStroke();
  fill(255,0,0,100);
  bezier(160,300,180,325,220,325,240,300);
  strokeWeight(2);
  strokeCap(ROUND);
  stroke(185,150,120);
  line(175,265,190,280);
  line(190,280,210,280);
  line(210,280,225,265);  
  smooth();
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(153,210,50,20);
  ellipse(247,210,50,20);
  noStroke();
  fill(100,100,30);
  ellipse(153,210,15,15);
  ellipse(247,210,15,15);
  fill(0);
  ellipse(153,210,5,5);
  ellipse(247,210,5,5);
}

/*MOVING EYES
void draw(){
  smooth();
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(153,210,50,20);
  ellipse(247,210,50,20);
  noStroke();
  fill(100,100,30);
  ellipse(153+(map(mouseX-153,0,400,0,20)),210+(map(mouseY-210,0,400,0,6)),15,15);
  ellipse(247+(map(mouseX-247,0,400,0,20)),210+(map(mouseY-210,0,400,0,6)),15,15);
  fill(0);
  ellipse(153+(map(mouseX-153,0,400,0,20)),210+(map(mouseY-210,0,400,0,6)),5,5);
  ellipse(247+(map(mouseX-247,0,400,0,20)),210+(map(mouseY-210,0,400,0,6)),5,5);
}
*/

