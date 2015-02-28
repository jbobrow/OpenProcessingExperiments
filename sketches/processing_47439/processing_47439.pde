



// The first sketch in 3D shows 
// basic 3D elements.

void setup () {
  // 3D requires P3D
  // or OPENGL as a parameter to size()
  size (600, 600, P3D);

  // font 
  PFont font;
  font = createFont("FFScala-32.vlw", 22); 
  textFont(font);
}

void draw () {

  background(22);
  // switch on lights  
  lights();

  // colors
  fill (111);
  stroke(111);

  // there's a 2D and a 3D version of line.
  // Drawing lines in 3D requires P3D
  // or OPENGL as a parameter to size()
  strokeWeight (4);
  line(230, 20, 0, 285, 20, 15);

  // there's also a 2D and a 3D version of point
  point(282, 37, 17);  // 3D
  strokeWeight (3);
  point(282, 47, 17);  // 3D
  strokeWeight (2);
  point(282, 57, 17);  // 3D

  // Box: A box with equal dimension on all sides is a cube.
  strokeWeight (1);
  translate(158, 48, -10); 
  rotateY(0.9);
  fill (color(242, 22, 2));  // red
  box(40); // only one parameter: box(size);

  // Box: width, height, depth are different 
  translate(158, 48, 10); 
  rotateY(0.5);
  fill (color(2, 222, 2));  // green
  box(40, 20, 50); // 3 parameters: box(width, height, depth);

  // sphere is 3D
  translate(58, 48, 0);
  stroke (color(2, 2, 222));  // blue
  fill (color(2, 2, 222));    // blue  
  sphere(28);

  // text has also a 2D and 3D form 
  rotateY(-1.4);  
  text("Welcome in 3D", 222, 300, width, height, -22);

  // beginShape also can take 2D or 3D vertices:
  // Drawing vertices in 3D requires P3D
  // or OPENGL as a parameter to size()
  beginShape(); // try LINES or POINTS
  vertex(30, 20, -50);
  vertex(85, 20, -150);
  vertex(85, 75, -150);
  vertex(30, 75, -50);
  endShape(CLOSE);
}


