
int x = 200;
int y = 250;

void setup() {
  size(400,400);
  smooth();
}

void draw() {  //bending knees
  background(255);
  if (mouseY>266) {
    int y = 275;
    background(255);
fill(102,45,145);
stroke(102,45,145);
ellipse(x,y,130,140);
fill(0);
stroke(0);
strokeWeight(2);
rectMode(CENTER);
rect(x,y+20,50,25);
fill(255);
stroke(255);
strokeWeight(1);
triangle(x-24,y+10,x-8,y+10,x-16,y+20);
triangle(x-8,y+10,x+8,y+10,x,y+20);
triangle(x+8,y+10,x+24,y+10,x+16,y+20);
fill(255);
stroke(255);
ellipse(x-15,y-22,12,15);
ellipse(x+15,y-22,12,15);
fill(0);
stroke(0);
ellipse(x-15,y-20,10,10);
ellipse(x+15,y-20,10,10);
stroke(102,45,145);
strokeWeight(10);
line(x-20,y+65,x-40,y+95);
line(x-40,y+95,x-35,y+115);
line(x+20,y+65,x+40,y+95);
line(x+40,y+95,x+35,y+115);
line(x-60,y,x-75,y+50);
line(x+60,y,x+75,y+50);
}

if (mouseY<133) {  //star jump
  y = 150;
  background(255);
  fill(102,45,145);
  stroke(102,45,145);
  ellipse(x,y,130,140);
  fill(0);
  stroke(0);
  strokeWeight(2);
  rectMode(CENTER);
  rect(x,y+20,50,25);
  fill(255);
  stroke(255);
  strokeWeight(1);
  triangle(x-24,y+10,x-8,y+10,x-16,y+20);
  triangle(x-8,y+10,x+8,y+10,x,y+20);
  triangle(x+8,y+10,x+24,y+10,x+16,y+20);
  fill(255);
  stroke(255);
  ellipse(x-15,y-22,12,15);
  ellipse(x+15,y-22,12,15);
  fill(0);
  stroke(0);
  ellipse(x-15,y-20,10,10);
  ellipse(x+15,y-20,10,10);
  stroke(102,45,145);
  strokeWeight(10);
  line(x-20,y+65,x-75,y+125);
  line(x+20,y+65,x+75,y+125);
  line(x-60,y,x-100,y-20);
  line(x+60,y,x+100,y-20);
}

if (mousePressed) {  //mega star jump
  y = 150;
  background(255);
  fill(102,45,145);
  stroke(102,45,145);
  ellipse(x,y,130,140);
  fill(0);
  stroke(0);
  strokeWeight(2);
  rectMode(CENTER);
  rect(x,y+20,50,25);
  fill(255);
  stroke(255);
  strokeWeight(1);
  triangle(x-24,y+10,x-8,y+10,x-16,y+20);
  triangle(x-8,y+10,x+8,y+10,x,y+20);
  triangle(x+8,y+10,x+24,y+10,x+16,y+20);
  fill(255);
  stroke(255);
  ellipse(x-15,y-22,24,30);
  ellipse(x+15,y-22,24,30);
  fill(0);
  stroke(0);
  ellipse(x-15,y-20,20,20);
  ellipse(x+15,y-20,20,20);
  stroke(102,45,145);
  strokeWeight(10);
  line(x-20,y+65,x-75,y+125);
  line(x+20,y+65,x+75,y+125);
  line(x-60,y,x-100,y-20);
  line(x+60,y,x+100,y-20);
}

  if(mouseY>133)
  if(mouseY<266) {  //standing
    y = 250;
    background(255);
    fill(102,45,145);
stroke(102,45,145);
ellipse(x,y,130,140);
fill(0);
stroke(0);
strokeWeight(2);
rectMode(CENTER);
rect(x,y+20,50,25);
fill(255);
stroke(255);
strokeWeight(1);
triangle(x-24,y+10,x-8,y+10,x-16,y+20);
triangle(x-8,y+10,x+8,y+10,x,y+20);
triangle(x+8,y+10,x+24,y+10,x+16,y+20);
fill(255);
stroke(255);
ellipse(x-15,y-22,12,15);
ellipse(x+15,y-22,12,15);
fill(0);
stroke(0);
ellipse(x-15,y-20,10,10);
ellipse(x+15,y-20,10,10);
stroke(102,45,145);
strokeWeight(10);
line(x-20,y+65,x-25,y+130);
line(x+20,y+65,x+25,y+130);
line(x-60,y,x-75,y+50);
line(x+60,y,x+75,y+50);
  }
}


