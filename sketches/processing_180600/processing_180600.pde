
// initial position for our circle
float circle_x = 175;
float circle_y = 200;
// how much to move the circle on each frame
float move_x = 2;
float move_y = 1;
float eyex = 300;
float eyey = 50;
float lidh = 10;

void setup() {
  size(400, 400);
  stroke(#D60DFF);
  strokeWeight(15);
}
void draw() 
{
  background(#21EA73);

//arm
fill (#7C9EFA);
triangle (0, 200, 0,300,200,300);

  //beard
  fill (180);
  ellipse (400, 150, 200, 300);
  //face
  fill (#FFE0ED);
  ellipse (400, 150, 200, 130);
  //tach
  fill (180);
  ellipse (400, 220, 60, 60);
  //mouth
  fill (#F5020B);
  ellipse (450, 230,140,30);

  //body
  fill (#021CF5);
  ellipse (400, 500, 400, 250);


  //eye
  stroke (#FA050D);
  strokeWeight (8);
  fill (#FFC9D3);
  ellipse ( 300, 50, 231, 150);

  stroke (0);
  strokeWeight (5);
  point (eyex + 10, eyey + 75);
  point (eyex + 25, eyey + 74);
  point (eyex + 35, eyey + 73);
  point (eyex + 45, eyey + 70);
  point (eyex + 65, eyey + 65);
  point (eyex + 60, eyey + 63);
  point (eyex + 70, eyey + 60);
  point (eyex + 75, eyey + 58);
  point (eyex + 85, eyey + 55);

  point (eyex - 10, eyey + 75);
  point (eyex - 25, eyey + 74);
  point (eyex -35, eyey + 73);
  point (eyex - 45, eyey + 70);
  point (eyex - 65, eyey + 65);
  point (eyex - 60, eyey + 63);
  point (eyex - 70, eyey + 60);
  point (eyex - 75, eyey + 63);
  point (eyex - 85, eyey + 50);

  //iris
  noStroke ();
  fill (#A4BEF2);
  ellipse (300, 50, 145, 145);

  //pupil
  fill (#7C2E25 );
  ellipse (300, 50, 100, 100);

  //lid
  strokeWeight(8);
  stroke (#FA050D);
  fill (#FF724B);
  ellipse ( 300, 15, 210, 55);

  //lensandrim
  stroke (0);
  strokeWeight (15);
  fill (255, 90);
  ellipse (eyex, eyey, 250, 250);
  //handle
  fill (0);
  rect (0, 50, 170, 40);

  //jar
  fill (#FFFFFF, 65);
  strokeWeight (3);
  stroke (#88F0ED);
  rect ( 100, 100, 200, 200);
  //table
  noStroke ();
  fill (#503C0A);
  rect (0, 300, 400, 100);

  //lid
  fill (#FABC1E);
  rect (98, 80, 206, 20);

  //leftlegs
  stroke (0);
  strokeWeight (2);
  line ( circle_x + 1, circle_y, circle_x - 10, circle_y  + 20);
  line ( circle_x  + 1, circle_y , circle_x - 20, circle_y  + 10);
  line ( circle_x + 1, circle_y , circle_x - 10, circle_y  - 20);
  line ( circle_x + 1, circle_y, circle_x - 20, circle_y  - 10);
  //rightlegs
    line ( circle_x + 1, circle_y, circle_x + 10, circle_y  + 20);
  line ( circle_x  + 1, circle_y , circle_x + 20, circle_y  + 10);
  line ( circle_x + 1, circle_y , circle_x + 10, circle_y  - 20);
  line ( circle_x + 1, circle_y, circle_x + 20, circle_y  - 10);
  

  //spider body
  noStroke();
  ellipse(circle_x +1, circle_y, 20, 20);
  
  //spidereyes
  fill (#FA1E3F);
  ellipse (circle_x - 4, circle_y, 5, 5);
  ellipse (circle_x + 4, circle_y, 5, 5);

  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;

  if (circle_x > width - 122) 
  {
    circle_x = width - 122;
    move_x = -move_x;
  }
  
  if (circle_y > height - 122) {
    circle_y = height - 122;
    move_y = -move_y;
  }

  if (circle_x < 122) {
    circle_x = 122;
    move_x = -move_x;
  }

  if (circle_y < 122) 
  {
    circle_y = 122;
    move_y = -move_y;
  }
  
fill (0);
rect (0,305, 400,20);
  fill (200);
  textSize (20);
  text ("When I get OUT OF HERE........", 10,360); 
}

