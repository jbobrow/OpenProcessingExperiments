
/**
Assignment number 2
Susan Anderson
swanderson@brynmawr.edu
CS 110 Section 001
9/19/12

This program randomly generates a different colored sky and different shaped
clouds when a key is pressed.  It also draws flying pigs when the mouse is pressed
and erases them when a key is pressed.  Depending on where the mouse is 
pressed, the size of the pig's eyes and the direction the pig is facing
changes.
**/

int spacing = 10;

void setup() {
  size(600, 600);
  smooth();
  background(0, random(0,130), random(160,255));
  
  //two clouds
  for(int x=10;x <= 300; x=x+spacing) {
      noStroke();
      fill(random(252,255));
      ellipse(x,random(0,50),random(50,100),random(20, 100));
      ellipse(x,random(50,100), random(50,100), random(20,100));
      
      while(x>=300&&x<=600) {
        noStroke();
        fill(random(252,255));
        ellipse(x,random(400,450),random(50,100),random(20,100));
        ellipse(x,random(450,500),random(50,100),random(20,100));
        x=x+spacing;
      }
  }
}
void draw() {
}

void mousePressed() {//pig upper third, right side
if (mouseX>=300 && mouseX<600 && mouseY<200) {
  //body, head
  noStroke();
  fill(245,121,183);
  ellipse(mouseX,mouseY,50,40);
  ellipse(mouseX-30, mouseY-10,30,30);
  //tail and ears
  triangle(mouseX+25,mouseY-2, mouseX+25,mouseY+2, mouseX+35,mouseY);
  triangle(mouseX-33,mouseY-20, mouseX-13,mouseY, mouseX-25,mouseY-30);
  triangle(mouseX-28,mouseY-20, mouseX-43,mouseY, mouseX-35,mouseY-30);
  //nose
  stroke(0);
  ellipse(mouseX-30,mouseY-5, 12,10);
  point(mouseX-28,mouseY-6);
  point(mouseX-32,mouseY-6);
  //legs
  noStroke();
  rect(mouseX-20,mouseY, 5,30);
  rect(mouseX-10,mouseY, 5,30);
  rect(mouseX+10,mouseY, 5,30);
  rect(mouseX+20,mouseY, 5,30);
  //hooves
  fill(0);
  rect(mouseX-20,mouseY+25, 5,5);
  rect(mouseX-10,mouseY+25, 5,5);
  rect(mouseX+10,mouseY+25, 5,5);
  rect(mouseX+20,mouseY+25, 5,5);
  //eyes
  fill(255);
  noStroke();
  ellipse(mouseX-25,mouseY-15, 5,5);
  ellipse(mouseX-35,mouseY-15, 5,5);
  fill(0);
  ellipse(mouseX-25,mouseY-15,2,2);
  ellipse(mouseX-35,mouseY-15,2,2);
  //lines behind pig
  stroke(0);
  line(mouseX+40,mouseY, mouseX+90,mouseY);
  line(mouseX+40,mouseY+10, mouseX+70,mouseY+10);
  line(mouseX+40,mouseY-10, mouseX+70,mouseY-10);
  
}else if(mouseX<300 && mouseY<200) {//pig upper third, left side
  //body, head
  noStroke();
  fill(245,121,183);
  ellipse(mouseX,mouseY,50,40);
  ellipse(mouseX+30, mouseY-10,30,30);
  //tail and ears
  triangle(mouseX-25,mouseY-2, mouseX-25,mouseY+2, mouseX-35,mouseY);
  triangle(mouseX+33,mouseY-20, mouseX+13,mouseY, mouseX+25,mouseY-30);
  triangle(mouseX+28,mouseY-20, mouseX+43,mouseY, mouseX+35,mouseY-30);
  //nose
  stroke(0);
  ellipse(mouseX+30,mouseY-5, 12,10);
  point(mouseX+28,mouseY-6);
  point(mouseX+32,mouseY-6);
  //legs
  noStroke();
  rect(mouseX+20,mouseY, 5,30);
  rect(mouseX+10,mouseY, 5,30);
  rect(mouseX-10,mouseY, 5,30);
  rect(mouseX-20,mouseY, 5,30);
  //hooves
  fill(0);
  rect(mouseX+20,mouseY+25, 5,5);
  rect(mouseX+10,mouseY+25, 5,5);
  rect(mouseX-10,mouseY+25, 5,5);
  rect(mouseX-20,mouseY+25, 5,5);
  //facial features
  fill(255);
  noStroke();
  ellipse(mouseX+25,mouseY-15, 5,5);
  ellipse(mouseX+35,mouseY-15, 5,5);
  fill(0);
  ellipse(mouseX+25,mouseY-15,2,2);
  ellipse(mouseX+35,mouseY-15,2,2);
  //lines behind pig
  stroke(0);
  line(mouseX-40,mouseY, mouseX-90,mouseY);
  line(mouseX-40,mouseY+10, mouseX-70,mouseY+10);
  line(mouseX-40,mouseY-10, mouseX-70,mouseY-10);
  
}else if(mouseX>=300 && mouseX<600 && mouseY>200 && mouseY<=400) {//pig, middle third, right side
  //body, head
  noStroke();
  fill(245,121,183);
  ellipse(mouseX,mouseY,50,40);
  ellipse(mouseX+30, mouseY-10,30,30);
  //tail and ears
  triangle(mouseX-25,mouseY-2, mouseX-25,mouseY+2, mouseX-35,mouseY);
  triangle(mouseX+33,mouseY-20, mouseX+13,mouseY, mouseX+25,mouseY-30);
  triangle(mouseX+28,mouseY-20, mouseX+43,mouseY, mouseX+35,mouseY-30);
  //nose
  stroke(0);
  ellipse(mouseX+30,mouseY-5, 12,10);
  point(mouseX+28,mouseY-6);
  point(mouseX+32,mouseY-6);
  //legs
  noStroke();
  rect(mouseX+20,mouseY, 5,30);
  rect(mouseX+10,mouseY, 5,30);
  rect(mouseX-10,mouseY, 5,30);
  rect(mouseX-20,mouseY, 5,30);
  //hooves
  fill(0);
  rect(mouseX+20,mouseY+25, 5,5);
  rect(mouseX+10,mouseY+25, 5,5);
  rect(mouseX-10,mouseY+25, 5,5);
  rect(mouseX-20,mouseY+25, 5,5);
  //facial features
  fill(255);
  noStroke();
  ellipse(mouseX+25,mouseY-15, 10,10);
  ellipse(mouseX+35,mouseY-15, 10,10);
  fill(0);
  ellipse(mouseX+25,mouseY-15,4,4);
  ellipse(mouseX+35,mouseY-15,4,4);
  //lines behind pig
  stroke(0);
  line(mouseX-40,mouseY, mouseX-90,mouseY);
  line(mouseX-40,mouseY+10, mouseX-70,mouseY+10);
  line(mouseX-40,mouseY-10, mouseX-70,mouseY-10);
  
}else if (mouseX<300 && mouseY>200 && mouseY<=400) {//pig, middle third, left side
//body, head
  noStroke();
  fill(245,121,183);
  ellipse(mouseX,mouseY,50,40);
  ellipse(mouseX-30, mouseY-10,30,30);
  //tail and ears
  triangle(mouseX+25,mouseY-2, mouseX+25,mouseY+2, mouseX+35,mouseY);
  triangle(mouseX-33,mouseY-20, mouseX-13,mouseY, mouseX-25,mouseY-30);
  triangle(mouseX-28,mouseY-20, mouseX-43,mouseY, mouseX-35,mouseY-30);
  //nose
  stroke(0);
  ellipse(mouseX-30,mouseY-5, 12,10);
  point(mouseX-28,mouseY-6);
  point(mouseX-32,mouseY-6);
  //legs
  noStroke();
  rect(mouseX-20,mouseY, 5,30);
  rect(mouseX-10,mouseY, 5,30);
  rect(mouseX+10,mouseY, 5,30);
  rect(mouseX+20,mouseY, 5,30);
  //hooves
  fill(0);
  rect(mouseX-20,mouseY+25, 5,5);
  rect(mouseX-10,mouseY+25, 5,5);
  rect(mouseX+10,mouseY+25, 5,5);
  rect(mouseX+20,mouseY+25, 5,5);
  //eyes
  fill(255);
  noStroke();
  ellipse(mouseX-25,mouseY-15, 10,10);
  ellipse(mouseX-35,mouseY-15, 10,10);
  fill(0);
  ellipse(mouseX-25,mouseY-15,4,4);
  ellipse(mouseX-35,mouseY-15,4,4);
  //lines behind pig
  stroke(0);
  line(mouseX+40,mouseY, mouseX+90,mouseY);
  line(mouseX+40,mouseY+10, mouseX+70,mouseY+10);
  line(mouseX+40,mouseY-10, mouseX+70,mouseY-10);
  
}else if(mouseX>=300 && mouseX<600 && mouseY>400 && mouseY<600) {//pig lower third, right side
  noStroke();
  fill(245,121,183);
  ellipse(mouseX,mouseY,50,40);
  ellipse(mouseX-30, mouseY-10,30,30);
  //tail and ears
  triangle(mouseX+25,mouseY-2, mouseX+25,mouseY+2, mouseX+35,mouseY);
  triangle(mouseX-33,mouseY-20, mouseX-13,mouseY, mouseX-25,mouseY-30);
  triangle(mouseX-28,mouseY-20, mouseX-43,mouseY, mouseX-35,mouseY-30);
  //nose
  stroke(0);
  ellipse(mouseX-30,mouseY-5, 12,10);
  point(mouseX-28,mouseY-6);
  point(mouseX-32,mouseY-6);
  //legs
  noStroke();
  rect(mouseX-20,mouseY, 5,30);
  rect(mouseX-10,mouseY, 5,30);
  rect(mouseX+10,mouseY, 5,30);
  rect(mouseX+20,mouseY, 5,30);
  //hooves
  fill(0);
  rect(mouseX-20,mouseY+25, 5,5);
  rect(mouseX-10,mouseY+25, 5,5);
  rect(mouseX+10,mouseY+25, 5,5);
  rect(mouseX+20,mouseY+25, 5,5);
  //eyes
  fill(255);
  noStroke();
  ellipse(mouseX-25,mouseY-15, 15,15);
  ellipse(mouseX-35,mouseY-15, 15,15);
  fill(0);
  ellipse(mouseX-25,mouseY-15,8,8);
  ellipse(mouseX-35,mouseY-15,8,8);
  //lines behind pig
  stroke(0);
  line(mouseX+40,mouseY, mouseX+90,mouseY);
  line(mouseX+40,mouseY+10, mouseX+70,mouseY+10);
  line(mouseX+40,mouseY-10, mouseX+70,mouseY-10);
  
}else if (mouseX<300 && mouseY>400 && mouseY<=600) {//pig lower third left side
  //body, head
  noStroke();
  fill(245,121,183);
  ellipse(mouseX,mouseY,50,40);
  ellipse(mouseX+30, mouseY-10,30,30);
  //tail and ears
  triangle(mouseX-25,mouseY-2, mouseX-25,mouseY+2, mouseX-35,mouseY);
  triangle(mouseX+33,mouseY-20, mouseX+13,mouseY, mouseX+25,mouseY-30);
  triangle(mouseX+28,mouseY-20, mouseX+43,mouseY, mouseX+35,mouseY-30);
  //nose
  stroke(0);
  ellipse(mouseX+30,mouseY-5, 12,10);
  point(mouseX+28,mouseY-6);
  point(mouseX+32,mouseY-6);
  //legs
  noStroke();
  rect(mouseX+20,mouseY, 5,30);
  rect(mouseX+10,mouseY, 5,30);
  rect(mouseX-10,mouseY, 5,30);
  rect(mouseX-20,mouseY, 5,30);
  //hooves
  fill(0);
  rect(mouseX+20,mouseY+25, 5,5);
  rect(mouseX+10,mouseY+25, 5,5);
  rect(mouseX-10,mouseY+25, 5,5);
  rect(mouseX-20,mouseY+25, 5,5);
  //facial features
  fill(255);
  noStroke();
  ellipse(mouseX+25,mouseY-15, 15,15);
  ellipse(mouseX+35,mouseY-15, 15,15);
  fill(0);
  ellipse(mouseX+25,mouseY-15,8,8);
  ellipse(mouseX+35,mouseY-15,8,8);
  //lines behind pig
  stroke(0);
  line(mouseX-40,mouseY, mouseX-90,mouseY);
  line(mouseX-40,mouseY+10, mouseX-70,mouseY+10);
  line(mouseX-40,mouseY-10, mouseX-70,mouseY-10);
}
}

void keyPressed() {
    background(0, random(0,130), random(160,255));
  
  //two clouds
  for(int x=10;x <= 300; x=x+spacing) {
      noStroke();
      fill(random(252,255));
      ellipse(x,random(0,50),random(50,100),random(20, 100));
      ellipse(x,random(50,100), random(50,100), random(20,100));
      
      while(x>=300&&x<=600) {
        noStroke();
        fill(random(252,255));
        ellipse(x,random(400,450),random(50,100),random(20,100));
        ellipse(x,random(450,500),random(50,100),random(20,100));
        x=x+spacing;
      }
  }
}


