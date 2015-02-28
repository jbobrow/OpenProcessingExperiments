
void setup () {
size(500, 500);
smooth();

}

void draw () {
// turret gun sides

int leftM = 0;
int rightM = 0;
// int x = mouseX;
 //int y = mouseY;
 
 float x = 200;
 int y = 200;
 
 int a = mouseX;
 int b = mouseY;

 float targetX = mouseX;
 float easing = 0.1;
 
background(100);
/*fill(240);
arc(x-40+leftM, y+5, 40, 145, radians(90), radians(270));
arc(x+40+rightM, y+5, 40, 145, radians(-90), radians(90));
fill(40);
arc(x-40+leftM, y+5, 16, 145, radians(90), radians(270));
arc(x+40+rightM, y+5, 16, 145, radians(-90), radians(90));
rect(x-40+leftM, y-13, 20, 40);
rect(x+20+rightM, y-13, 20, 40);*/


if (mousePressed == true) {
   x += (targetX - x)*easing;
  fill(240);
  arc(x-40, y+5, 40, 145, radians(90), radians(270));
  arc(x+40, y+5, 40, 145, radians(-90), radians(90));
  fill(40);
  arc(x-40, y+5, 16, 145, radians(90), radians(270));
  arc(x+40, y+5, 16, 145, radians(-90), radians(90));
  rect(x-40, y-13, 20, 40);
  rect(x+20, y-13, 20, 40);
  } else {
       x += (targetX - x)*easing;
      fill(240);
  arc(x-40+35, y+5, 40, 145, radians(90), radians(270));
  arc(x+40-35, y+5, 40, 145, radians(-90), radians(90));
  fill(40);
  arc(x-40+35, y+5, 16, 145, radians(90), radians(270));
  arc(x+40-35, y+5, 16, 145, radians(-90), radians(90));
  rect(x-40+35, y-13, 20, 40);
  rect(x+20-35, y-13, 20, 40);
  }

        /*fill(240);
  arc(x-40+35, y+5, 40, 145, radians(90), radians(270));
  arc(x+40-35, y+5, 40, 145, radians(-90), radians(90));
  fill(40);
  arc(x-40+35, y+5, 16, 145, radians(90), radians(270));
  arc(x+40-35, y+5, 16, 145, radians(-90), radians(90));
  rect(x-40+35, y-13, 20, 40);
  rect(x+20-35, y-13, 20, 40);*/


// turret leg stand connections
strokeWeight(6);
beginShape();
noFill();
vertex(x-10, y+74);
vertex(x-12, y+91);
vertex(x-13, y+102);
vertex(x-22, y+105);
vertex(x-30, y+104);
endShape();

beginShape();
vertex(x+10, y+74);
vertex(x+12, y+91);
vertex(x+17, y+102);
vertex(x+22, y+105);
vertex(x+30, y+104);
endShape();

// back leg
strokeWeight(1);
fill(70);
beginShape();
vertex(x-4, y+58);
vertex(x+4, y+58);
vertex(x+5, y+150);
vertex(x, y+180);
vertex(x-5, y+150);
endShape(CLOSE);


// turret face


fill(240);
ellipse(x, y, 51, 160);

stroke(79);
line(x, y-80, x, y+80);

// turret eye
noStroke();
fill(200);

ellipse(x, y, 24, 24);
fill(251, 62, 15);
strokeWeight(2);
stroke(1);
ellipse(x, y, 15, 15);
fill(10);

if (mousePressed == true) {
  noStroke();
  ellipse(x, y,  8, 8);
} else { 
  noStroke();
ellipse(x, y,  4, 4);
}


//legs
stroke(1);
strokeWeight(1);
fill(70);
beginShape();
vertex(x-52, y+119);;
vertex(x-64, y+200);
vertex(x-49, y+171);
vertex(x-43, y+119);
endShape(CLOSE);

stroke(1);
strokeWeight(1);
fill(240);
beginShape();
vertex(x-25, y+87);
vertex(x-37, y+89);
vertex(x-45, y+94);
vertex(x-51, y+102);
vertex(x-57, y+120);
vertex(x-38, y+119);
vertex(x-34, y+111);
vertex(x-30, y+104);
vertex(x-26, y+99);
vertex(x-22, y+94);
endShape(CLOSE);

// legs again

stroke(1);
strokeWeight(1);
fill(70);
beginShape();
vertex(x+53, y+119);
vertex(x+64, y+200);
vertex(x+49, y+171);
vertex(x+44, y+119);
endShape(CLOSE);

stroke(1);
strokeWeight(1);
fill(240);
beginShape();
vertex(x+25, y+87);
vertex(x+37, y+89);
vertex(x+45, y+94);
vertex(x+51, y+102);
vertex(x+57, y+120);
vertex(x+36, y+119);
vertex(x+32, y+111);
vertex(x+28, y+104);
vertex(x+24, y+99);
vertex(x+20, y+94);
endShape(CLOSE);

stroke(232, 0, 0, 140);
strokeWeight(5);
line(x, y, a, b);
strokeWeight(1);
stroke(255);
line(x, y, a, b);

stroke(1);
strokeWeight(1);
}





