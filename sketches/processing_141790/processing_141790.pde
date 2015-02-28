
PImage img;// type of image 
PImage img2;// type of image 
int hx= width/2;// head location x
int hy= height/2;//head location y, alignment, top to bottom
int hz= 0;// distance in 


void setup () {
  size(1000, 600, P3D);//3d
  img = loadImage("city.jpg"); // function in quotes
  img2 = loadImage("images.jpg"); // function in quotes
  smooth();
  lights();
  translate(width/2, height/2, 0);
  
}

void draw() {
 
 //image(img,0,0,);
  background(100, 170, 160);
  fill(200);
  pushMatrix();
  translate(width/2, height/2, 0);
  //translate(hx, hy, hz); // head location 
  sphere(20);// head
  popMatrix();




  //Body
  fill(200, 80, 80);
  pushMatrix();
  translate(width/2, height/2+25, 0);
  //translate(hx, hy+25, hz);// location of body
  sphere(10);    // body size
  popMatrix();

  //arms
  fill(200);
  pushMatrix();
  translate(width/2-10, height/2+25, 0);
  //translate(hx-10, hy+25, hz);// left arm 
  sphere(4);    // Arm size
  popMatrix();
  pushMatrix();
  translate(width/2+10, height/2+25, 0);
  //translate(hx+10, hy+25, hz);// right arm 
  sphere(4);    // Arm size
  popMatrix();

  //legs

  fill(200);
  pushMatrix();
  translate(width/2-4, height/2+37, 0);
  // translate(hx-4, hy+37, hz);// left arm 
  box(5);    // leg size
  popMatrix();
  pushMatrix();
  translate(width/2+4, height/2+37, 0);
  // translate(hx+4, hy+37, hz);// right arm 
  box(5);    // leg size
  popMatrix();

  //building 
 
  fill (60);
  noStroke();
  translate (width/2, height/2, -100+hz);
  beginShape();
  vertex(-80, 37, 0+hz);//bottom left
  vertex(-20, 37, 0+hz);//bottom left in
  vertex(-20, -50, 0+hz);//top left door
  vertex(20, -50, 0+hz);//  topright door
  vertex(20, 37, 0+hz);//bottom right door
  vertex(80, 37, 0+hz);//right bottom 
  vertex(80, -200, 0+hz);//right top   
  vertex(-80, -200, 0+hz);//left top
  endShape();
  
  //left wall
 
  beginShape();
  vertex(-80, 37, 0+hz);//bottom left
  vertex(-80, 37, -300+hz);//back bottom left   
    vertex(-80, -200, -300+hz);//left top
    vertex(-80, -200, 0+hz);//left top
  endShape();
  
  
//right wall
  beginShape();

  vertex(80, 37, 0+hz);//right bottom 
  vertex(80, -200, 0+hz);//right top   
  vertex(80, -200, -300+hz);//right back  top  
  vertex(80, 37, -300+hz);//right back bottom 
  endShape();
 //back wall
   beginShape();
   texture(img2);
  vertex(80, -200, -300+hz);//right back  top  
  vertex(80, 37, -300+hz);//right back bottom
  vertex(-80, 37, -300+hz);//back bottom left   
    vertex(-80, -200, -300+hz);//left top 

  endShape();

  if (mousePressed == true||hz>300) {
    hz= hz+5;
  }

  if (keyPressed == true||hz>300) {
    hz= hz-5;
   // eyes
//     fill(255);
  //  pushMatrix();
    //translate(width/2+10, height/2, 0-10);
    //translate(hx+10, hy, hz+10); // left eye location 
    //sphere(10);// eye size
    //popMatrix();
    //pushMatrix();
    //translate(width/2-10, height/2, 0-10);
    //translate(hx+10, hy, hz+10); // right eye location 
    //sphere(2);// right eye size
    //popMatrix();
  }


  //Camera
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);
  noStroke();
  fill(60);
}



