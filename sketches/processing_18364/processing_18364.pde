
void setup () {
  size (250, 250);
  background (#FFE180);
  smooth ();
  frameRate (18);
};

float rad1 = 100.0;
float rad2 = 100.0;

float rectW = 50.0;
float rectH = 50.0;

void draw () {
  fill (#FFE180, 25);
  noStroke ();
  rect (0, 0, width, height);
  
  //CIRs
  rad1 += 0.5;
  rad2 += 1;
  
  if (rad1 > 105) {
    rad1 = 100;
  };
  
  if (rad2 > 108) {
    rad2 = 100;
  };
  
  stroke (#8CC63F, 150);
  ellipse (width/2, height/2, rad2+3, rad1+3);  
  ellipse (width/2, height/2, rad1, rad2);
  
  //CIRs 2
  rectW += 0.5;
  rectH += 1;
  
  if (rectW > 80) {
    rectW = 50.0;
  };
  
  if (rectH > 150) {
    rectH = 50.0;
  };
  
  ellipse (width/2+75, height/2, rectW, rectW);
  ellipse (width/2+75, height/2, rectW+50, rectW+50);
  ellipse (width/2+75, height/2, rectH+50, rectH+50);
  ellipse (width/2+75, height/2, rectH, rectH);

  ellipse (width/2-75, height/2, rectW, rectW);
  ellipse (width/2-75, height/2, rectW+50, rectW+50);
  ellipse (width/2-75, height/2, rectH+50, rectH+50);
  ellipse (width/2-75, height/2, rectH, rectH);
  
  ellipse (width/2, height/2+75, rectW, rectW);
  ellipse (width/2, height/2+75, rectW+50, rectW+50);
  ellipse (width/2, height/2+75, rectH+50, rectH+50);
  ellipse (width/2, height/2+75, rectH, rectH);  
  
  ellipse (width/2, height/2-75, rectW, rectW);
  ellipse (width/2, height/2-75, rectW+50, rectW+50);
  ellipse (width/2, height/2-75, rectH+50, rectH+50);
  ellipse (width/2, height/2-75, rectH, rectH);    

  ellipse (width/2+50, height/2-50, rectW, rectW);
  ellipse (width/2+50, height/2-50, rectW+50, rectW+50);
  ellipse (width/2+50, height/2-50, rectH-50, rectH-50);
  ellipse (width/2+50, height/2-50, rectH, rectH);
  
  ellipse (width/2-50, height/2-50, rectW, rectW);
  ellipse (width/2-50, height/2-50, rectW+50, rectW+50);
  ellipse (width/2-50, height/2-50, rectH-50, rectH-50);
  ellipse (width/2-50, height/2-50, rectH, rectH);  
  
  ellipse (width/2+50, height/2+50, rectW, rectW);
  ellipse (width/2+50, height/2+50, rectW+50, rectW+50);
  ellipse (width/2+50, height/2+50, rectH-50, rectH-50);
  ellipse (width/2+50, height/2+50, rectH, rectH); 

  ellipse (width/2-50, height/2+50, rectW, rectW);
  ellipse (width/2-50, height/2+50, rectW+50, rectW+50);
  ellipse (width/2-50, height/2+50, rectH-50, rectH-50);
  ellipse (width/2-50, height/2+50, rectH, rectH);
};

