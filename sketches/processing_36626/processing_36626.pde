
size (400, 400);
//background (#D8D2D7);
background (#84869D);
//background (#ACADB2);
smooth();
noStroke ();


//background pattern of rectangle
for (int x= 10; x< 500; x=x+40) {
  for (int y=10; y<500; y=y+40) {  
    //fill(255, 0, 0, 30); 
    float lengy2= random (200, 445);
fill (#E2DCE8, 80);
   // fill (192, 180, 220, 80);
    rect (x, y, 20, 20);
  }
}

//random lines
//set 1
float r= random (195, 256);
float g = random (220, 256);
float b = random (180, 256);
stroke (r, g, b);

float pntx = random (290, 390);
float pnty= random (30, 160);
strokeWeight(3);

line(42, 375, pntx, pnty); 
strokeWeight (2);

line(30, 360, pntx*2, pnty*2); 
line (45, 330, 280, pnty);


//pink triangles
noStroke ();
for (int i=0; i<8; i++) {
  float x2= random (100, 400);
  float y2= random (100, 400);

  fill (255, 200, 200, 100);
  //fill (
  triangle ( 10, 10, x2, y2, 300, 400);
  
  //white curve with pink triangles
  
  fill (255, 255, 255, 220);
  curve (0, 10, x2, y2, 250, 300, 350, 400);
}

//blue triangles
for (int i=2; i< 4; i++) {
  float trix2= random (40, 180);
  float triy2= random (60, 180);
  float trix3= random (90, 230);
  float triy3= random(50, 200);

  fill (#9EB7C1, 200);

  triangle (370, 60, trix2, triy2, trix3, triy3);
  
  // white curves with blue trianlges
  fill (255, 200);
  curve (0, 10, trix3, triy3, trix2, triy2, 350, 400);
}

//ellipses
for (int i=50; i<=400; i=i+20) {
  float x= random (0, 500);
  float y= random (200, 500);
  float siz = random (10, 65);

 fill (0,0,0, 200);

  ellipse (x, y, siz, siz);
}

//random lines 2

//set 2
stroke (r, g, b);
float pnt2x = random (60, 125);
float pnt2y = random (35, 99);
line (18, 54, pnt2x, pnt2y);
strokeWeight (4);
line (15, 64, pnt2x*2, pnt2y*3);



