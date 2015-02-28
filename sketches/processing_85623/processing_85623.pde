
//Hans Nelson
//Exercise 3

//setup
size(400, 400);
background(100);
smooth();
float y = 1.0; //floats for rings and lines
float r = 1.0;
float g = 400.0;
float p = height;

//rings + lines
for(int a = 255; a >= 0; a-=20) { //alpha value iteration
  stroke(0, 255, 202, a); //alpha drops by 20 every 4 rings
  for(int s = 0; s <= 4; s++) { //ring iteration
    noFill();
    strokeWeight(2);
    ellipse(100, 200, y, y); //draws 2 sets of 4 rings
    ellipse(300, 200, y, y);
    y = y + 8.0; //bumps spacing between rings by 8 every iteration
  }
  stroke(0, 202, 255, a); //sets alpha value to lines
  line(r, r, 400-r, r);
  line(g, g, 400-g, g);
  line(r, 400-r, r, r);
  line(g, 400-g, g, g);
  r = r + 4.0;
  g = g - 4.0;
}

/*for(int d = 255; d >=0; d -= 25) {
  fill(0, 255, 202, d);
  rect(0, p, width, p + height/12);
  p = p - height/12;
}*/



