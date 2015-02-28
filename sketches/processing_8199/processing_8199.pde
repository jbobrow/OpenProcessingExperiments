
void setup(){
 //body
  size(200, 200);
  mouseX= 100;
  mouseY= 100;
  smooth();
}

void draw() {
  background(189);

 //wall
  noStroke();
  fill(#987A42);
  rectMode(CORNER);
  rect(0, 0, 200, 125);
 
  fill(100);
  rectMode(CENTER);
  rect(197, 95, 4, 23);
  rectMode(CENTER);
  rect(0, 30, 50, 60);

  fill(50);
  rectMode(CENTER);
  rect(0, 25, 40, 50);

  stroke(0);
  line(0, 125, 200, 125);

 //lightsaber
  //playing around with color for lightsaber
  fill(255, 200-(mouseX+mouseY) / 2, 240-(mouseX+mouseY) / 2);
  ellipseMode(CENTER);
  ellipse(170, 135, 10, 80);
 
  fill(#CBB488);
  rectMode(CENTER);
  rect(170, 157, 10, 25);

  fill(100);
  ellipseMode(CENTER);
  ellipse(170, 171, 20, 9);

  fill(#B49B6B);
  rectMode(CENTER);
  rect(170, 154, 12, 5);
  rectMode(CENTER);
  rect(170, 142, 12, 5);
  rectMode(CENTER);
  rect(170, 169, 12, 5);

  fill(#866A35);
  rectMode(CENTER);
  rect(170, 154, 5, 7);
 
 //cape
  fill(255, 0, 0);
  quad(mouseX+20, mouseY+5, mouseX-20, mouseY+5, 
       mouseX-50, mouseY+40, mouseX+50, mouseY+40); 

 //shadow
  /*
  The color change show the shadow effect higher it go 
  the lighter the shadow. The shape get small 
  if it go up and biger if it go down.
  */ 
  fill(200-(mouseX+mouseY) / 2);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY+55, 70, mouseY/2);
  //normal(mouseX, mouseY+55, 70, 25);
 

 //body
  fill(255); 
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY+20, 50, 67);

 //head
  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY-30, 60, 80);

  fill(210); 
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY-20, 70, 70);

  fill(#4C598B);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY-20, 50, 50);

 //eyes
  fill(255, 0, 0);
  triangle(mouseX-15, mouseY-28, mouseX-5, mouseY-28, mouseX-10, mouseY-18);

  fill(255, 0, 0);
  triangle(mouseX+5, mouseY-28, mouseX+15, mouseY-28, mouseX+10, mouseY-18);

 //mouth
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(mouseX, mouseY-7, 15, 5);

  fill(0);
  line(mouseX-5, mouseY-10, mouseX-5, mouseY-5);
  line(mouseX-2, mouseY-10, mouseX-2, mouseY-5);
  line(mouseX+1, mouseY-10, mouseX+1, mouseY-5);
  line(mouseX+4, mouseY-10, mouseX+4, mouseY-5);

 //hoodies
  fill(100);
  ellipseMode(CENTER);
  ellipse(mouseX-10, mouseY+8, 5, 5);
  ellipseMode(CENTER);
  ellipse(mouseX+10, mouseY+8, 5, 5);

  fill(0);
  line(mouseX-10, mouseY+8, mouseX-10, mouseY+27);
  line(mouseX+10, mouseY+8, mouseX+10, mouseY+25);

 //pants
  fill(#829891);
  rectMode(CENTER);
  rect(mouseX, mouseY+46, 45, 17);

  fill(0);
  line(mouseX, mouseY+35, mouseX, mouseY+54);

 //belt
  fill(0);
  rectMode(CENTER);
  rect(mouseX, mouseY+34, 50, 4);

 //hand
  fill(#816738);
  rectMode(CENTER);
  rect(mouseX, mouseY+34, 10, 6);

  fill(#4C598B);
  ellipseMode(CENTER);
  ellipse(mouseX-25, mouseY+32, 10, 20);

  fill(210);
  ellipseMode(CENTER);
  ellipse(mouseX-25, mouseY+28, 10, 20);

  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX-25, mouseY+23, 10, 20);

  fill(#4C598B);
  ellipseMode(CENTER);
  ellipse(mouseX+25, mouseY+32, 10, 20);

  fill(210);
  ellipseMode(CENTER);
  ellipse(mouseX+25, mouseY+28, 10, 20);

  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX+25, mouseY+23, 10, 20);

 //shoe
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX-11, mouseY+55, 15, 9);
  ellipseMode(CENTER);
  ellipse(mouseX+11, mouseY+55, 15, 9);
}
  

