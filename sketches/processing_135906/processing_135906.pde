
size (500, 500);
background (72, 186, 174);
stroke(255);
strokeWeight(8);

println (5 < 3);
println (6 > 4);
println (5 >= 3);
println (5 != 5);
println (2 != 6);
println (6 == 5);
println (6 == 6);

int a = 7;
int b = 9;

if (a < 10) {
  line (0, 0, height, width);
}

if (b < 5) {
  line (34, 65, 34, 23);
}

if (b > 8) {
  line (width, 0, 0, height);
}

ellipseMode(CENTER);
rectMode(CENTER);
noFill();

boolean c = (5 < 6);

if (!c == true) {
  strokeWeight(8);
  ellipse((width/2), (height/2), 450, 450);
  ellipse((width/2), (height/2), 400, 400);
  ellipse((width/2), (height/2), 350, 350);
  ellipse((width/2), (height/2), 300, 300);
  ellipse((width/2), (height/2), 250, 250);
  ellipse((width/2), (height/2), 200, 200);
  ellipse((width/2), (height/2), 150, 150);
  ellipse((width/2), (height/2), 100, 100);
  ellipse((width/2), (height/2), 50, 50);
} else {
  strokeWeight(5);
  rect((width/2), (height/2), 450, 450);
  rect((width/2), (height/2), 400, 400);
  rect((width/2), (height/2), 350, 350);
  rect((width/2), (height/2), 300, 300);
  rect((width/2), (height/2), 250, 250);
  rect((width/2), (height/2), 200, 200);
  rect((width/2), (height/2), 150, 150);
  rect((width/2), (height/2), 100, 100);
  rect((width/2), (height/2), 50, 50);
}





