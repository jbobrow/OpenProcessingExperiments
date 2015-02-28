

void testFace() {
  
  
  background(4*v);
  
  translate (10, - 40);
 
   
  //HAIR
  int radiusA = 200;
  int radiusB = 100;

  int startAngle = 0; 
  int endAngle = 180;
  int angleGrow = 10;


  pushMatrix();
  translate(230, 250);
  rotate(PI+QUARTER_PI);
  noStroke();
  
  beginShape();
  int count = 0;
  
  for (int i = startAngle; i <= endAngle; i += angleGrow) {
  
    float thisRadius = radiusA;
  
    if (count % 2 == 0) {
      thisRadius = radiusB;
    }
      
  
    float x = cos(radians(i*v/6)) * thisRadius;
    float y = sin(radians(i*v/8)) * thisRadius;
    fill(100, i*v/2, i*v/8); //i*v/4 for R value
    
    vertex(x, y);
    count++;
    
  } 

  endShape();
  popMatrix();

  
  
  
  //FACE

  
  PShape img;
  PShape img2;
  PShape img3;
  PShape img4;
  PShape img5;
  PShape img6;
  PShape img7;
  PShape img8;
  
  
  
  
  //face images fixed
  img = loadShape("head.svg");
  
  ///face images react

  
  img2 = loadShape("eye.svg");
  img3 = loadShape("pupil.svg");
  img4 = loadShape("eyebrow.svg");
  img5 = loadShape("nostril.svg");
  img6 = loadShape("chin2.svg");
  img7 = loadShape("ear.svg");
  img8 = loadShape("earring.svg");
  
  
  


   //chin
  pushMatrix();
  translate(320, 410);
  rotate(-radians(2.5*v));
  shape(img6, -290,-410);
  popMatrix();
  
  //face
  shape(img, 0, 0);
  

  /**
  //eye
  pushMatrix();
  translate(160, 270);
  scale(v/20,v/20);
  translate(0, v/7);
  shape(img2, -160, -270);
  popMatrix();
  */
  
  //pupil
  pushMatrix(); 
  translate(160, 270);
  scale(v/8,v/8);
  translate(0, v/3 );
  shape(img3, -160, -270);
  popMatrix();
  
  //eyebrow
  pushMatrix();
  translate(138, 270);
  rotate(-radians(v));
  scale(v/10, v/8);
  
  translate(-v/2, v*0.7);
  shape(img4, -138, -270);
  popMatrix();
  
  
  //nostril
  pushMatrix();
  translate(114, 337);
  scale(v/15, v/15);
  shape(img5, -114, -337);
  popMatrix();
  
 
 
  //ear
  pushMatrix();
  translate(288, 380);
  rotate(radians(v));
  shape(img7, -288, -380);
  popMatrix();
  
  /**
  //earign
  pushMatrix();
  translate(288, 380);
  rotate(radians(v/8));
  
  shape(img8, -288, -380);
  popMatrix();
  */
  
 

  
}


