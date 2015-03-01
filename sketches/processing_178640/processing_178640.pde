
int ry = 0;
circle circle;

void setup() {
  size(1000, 1000, P3D);
  circle = new circle();
  //frameRate(24);
  noCursor();
}

void draw() {
  //
  // //576 //height/2;
  
  //XR = mouseX;
  //YR = mouseY;
  /*if(XR > width) XR = 0;
  if(XR < 0) XR = width ;
  if(YR >height) YR = 0;
  if(YR <0) YR = height; */
  translate(XR, YR -30);
  rotateY(map(mouseX, 0, width, 0, 2*PI));
  if(keyPressed) {
  switch(keyCode) {
   case LEFT :
   XR --;
   break;
   
   case RIGHT :
   XR ++;
   break;
   
   case UP :
   YR -=5;
   circle.circle();
   break; 
   
   case DOWN :
   YR ++;
   break;
   }
  }
 
  //print(XR + ", " + YR + "\n");
  
 
  //rotateY(mouseX);
   //width/2; //
  //rotateX(-radians(115)); YR = -300; XR = width/2;//mouseY;//height/2 + 6;////506;
  //XR = width/2; YR = height/2;
  //
  //rotateY(ry++);
  //translate(XR, YR, 0);
  
  
  //print(mouseX + ", " + mouseY);
  
  smooth();
  lights();
  
  background(0);
  
  //if(rotateX(map(mouseY, 0, height, 0, 4*PI));
  //rotateX(map(mouseY, 0, height, 0, 4*PI));
  
  draw_eve();
  
}
//for interactions
float r = 300;


float XR = 500;
float YR = 500;

int armv1 = 0;
boolean armb1 = true;

int armv2R = 0;
boolean armb2R = true;

int armv2L = 0;
boolean armb2L = true;

int armv3R = 0;
boolean armb3R = true;

int armv3L = 0;
boolean armb3L = true;

int armv4 = 0;
boolean armb4 = true;

int nmvY = 0;
boolean nbY = true;

int nmvZ = 0;
boolean nbZ = true;

int bmvZ = 0;
boolean bbZ = true;

int drawstate = 1;
class circle {
  int r = 500;
  float x, y, z;
  int deg;
  
  
  circle() {}
  
  void get() {
    
  }
  
  void circle() {
    pushMatrix();
    translate(XR, YR+800, 0);
    fill(#AC0DD1);
    for(deg = 0; deg<=360; deg+=10) {
      beginShape(QUAD_STRIP);
      for(z = 0; z<70; z+=10) {
      
        x = r* cos(radians(deg));
        y = r* sin(radians(deg));
        vertex(x, z, y);
 
        x = r* cos(radians(deg+10));
        y = r* sin(radians(deg+10));
        vertex(x, z, y);
      }
      endShape();
    }
    popMatrix();
  }
}
  
  
void draw_eve () {
  //noStroke();
  //fill(255);
  body_eve();
  head_eve();
  
  armR_eve();
  armL_eve();
  
  key1();
  key2();
  key3();
  if(drawstate == 4) {
    key4();
  }

  
}
void armL_eve() {
   pushMatrix();
   noStroke();
   fill(255);
   translate(-40, 0, -30);
   rotateX(radians(90 +armv2L + armv3L + armv4));
   rotateY(radians(-6 +armv1));
   rotateZ(-PI/2);
   
   
   pushMatrix();
   //upper front
   scale(0.5, 0.5, 1);
   for (float pol = 150; pol < 180; pol+=3) {
    float r = 300;
    beginShape(QUAD_STRIP);
    for (float theta = 0; theta <= 180; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape();
  }
   //upper rear
  scale(1, 1, 1.5);
  for (float pol = 150; pol < 180; pol+=3) {
    //stroke(0);
    float r = 300;
    beginShape(QUAD_STRIP);
    for (float theta = 180; theta <= 360; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape();
  }
  popMatrix();
  
  pushMatrix();
  translate(0, -180, 0);
  scale(0.5, 0.2, 1);
  for (float pol = 0; pol < 30; pol+=3) {
    float r = 300;
    beginShape(QUAD_STRIP);
    for (float theta = 0; theta <= 180; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape();
  }
  
  scale(1, 1, 1.5);
  for (float pol = 0; pol < 30; pol+=3) {
    //stroke(0);
    float r = 300;
    beginShape(QUAD_STRIP);
    for (float theta = 180; theta <= 360; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape();
  }
  popMatrix();
  
  popMatrix();
  
}
void armR_eve() {
   pushMatrix();
   noStroke();
   fill(255);
   translate(+40, 0, -30);
   rotateX(radians(90 +armv2R +armv3R));
   rotateY(radians(6-armv1));
   rotateZ(PI/2);
   
   
   pushMatrix();
   //upper front
   scale(0.5, 0.5, 1);
   for (float pol = 150; pol < 180; pol+=3) {
    float r = 300;
    beginShape(QUAD_STRIP);
    for (float theta = 0; theta <= 180; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape();
  }
   //upper rear
  scale(1, 1, 1.5);
  for (float pol = 150; pol < 180; pol+=3) {
    //stroke(0);
    float r = 300;
    beginShape(QUAD_STRIP);
    for (float theta = 180; theta <= 360; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape();
  }
  popMatrix();
  
  pushMatrix();
  translate(0, -180, 0);
  scale(0.5, 0.2, 1);
  for (float pol = 0; pol < 30; pol+=3) {
    float r = 300;
    beginShape(QUAD_STRIP);
    for (float theta = 0; theta <= 180; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape();
  }
  
  scale(1, 1, 1.5);
  for (float pol = 0; pol < 30; pol+=3) {
    //stroke(0);
    float r = 300;
    beginShape(QUAD_STRIP);
    for (float theta = 180; theta <= 360; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape();
  }
  popMatrix();
  
  popMatrix();
  
}
 float[] ax = new float[37];
float[] ay = new float[37];
//float[] az = new float[43];
float r_d = 50;
float r_d_d = 0.5;
float y_t = 800;

void body_eve() {
  noStroke();
  fill(255);
  
  pushMatrix();
  translate(0, +300, -30);  
  rotate(PI);
  rotateZ(radians(bmvZ));
  
  
  //big part 
  r = 20;
  r_d = -50;
  r_d_d = 0.65;
  float rm;
  
  for(float z = 0; z<=450; z+=50) {
    beginShape(QUAD_STRIP);
    for (float deg = 0; deg<=360; deg+=10) {
     rm = random(-1, 1);
     /* if(mousePressed) {
       if(drawstate == 3) {
         if(z>100 && z<350) {
           r = r+rm;
         }
       }
     } */
     
     float rads = radians(deg);
     float x = r*cos(rads);
     float y = r*sin(rads);
     
     if(z>50) {
       vertex(ax[floor(deg/10)], z-50, ay[floor(deg/10)]);     
       vertex(x, z, y);
     }
     
     
     ax[floor(deg/10)] = x;
     ay[floor(deg/10)] = y;
     
    } 
    r -= r_d;
    r_d *= r_d_d;
    endShape();
  } 
  
  //bottom cap
  translate(0, 120, 0);
  for (float pol = 110; pol <= 180; pol+=3) {
    float r = 100;
    
    beginShape(TRIANGLE_STRIP);
    for(float theta = 0; theta <= 360; theta+=10) {
        
        float x = r*sin(radians(pol))*cos(radians(theta));
        float y = r*sin(radians(pol))*sin(radians(theta));
        float z = r*cos(radians(pol));
        
        vertex(x, z, y);
             
        
        x = r*sin(radians(pol+3))*cos(radians(theta));
        y = r*sin(radians(pol+3))*sin(radians(theta));
        z = r*cos(radians(pol+3));        
        
        vertex(x, z, y);
        
    }
   endShape(CLOSE);
  }
  
  //top cap
  
  translate(0, 762, 0);
  for (float pol = 160; pol <= 180; pol+=3) {
    //stroke(0);
    float r = 460;
    beginShape(QUAD_STRIP);
    for(float theta = 0; theta <= 360; theta+=5) {
        float x = r*sin(radians(pol))*cos(radians(theta));
        float y = r*sin(radians(pol))*sin(radians(theta));
        float z = r*cos(radians(pol));
        
        vertex(x, z, y);
             
        
        x = r*sin(radians(pol+3))*cos(radians(theta));
        y = r*sin(radians(pol+3))*sin(radians(theta));
        z = r*cos(radians(pol+3));        
        
        vertex(x, z, y);
    }
    endShape(CLOSE);
  }
  
  
  
  
  
 popMatrix();
}
color eyeson = color(17, 72, 163);

void exL_eve() {
  pushMatrix();
  scale(0.5, 0.5, 0.5);
  translate(-290, 240, 130);
  rotateY(-radians(25));

  if (drawstate == 1)
  {
    beginShape();
    fill(eyeson);
    vertex(87, 253, 10);
    bezierVertex(73, 227, 0, 125, 180, 30, 190, 180, 30);
    bezierVertex(256, 180, 20, 306, 251, 15, 277, 258, 35);
    bezierVertex(240, 231, 40, 176, 218, 60, 87, 253, 10);
    endShape();
  }
  else if (drawstate == 2)
  {
    // mean face
    //left eye
    beginShape();
    fill(eyeson);
    vertex(98, 229, 10);
    bezierVertex(154, 249, 45, 236, 257, 40, 288, 283, 25);
    bezierVertex(303, 290, 45, 261, 328, 45, 206, 324, 50);
    bezierVertex(105, 297, 45, 66, 218, 10, 98, 229, 10);
    endShape();
  }
  else if (drawstate ==3)
  {
    // Initial Eyes
    beginShape();
    fill(eyeson);
    noStroke();
    vertex(120, 199, 10);
    bezierVertex(165, 144, 30, 302, 227, 20, 287, 283, 10);
    bezierVertex(282, 300, 35, 260, 328, 45, 206, 324, 55);
    bezierVertex(155, 315, 65, 82, 256, 30, 120, 199, 10);
    endShape();
  }
  else if (drawstate ==4)
  {
    beginShape();
    fill(eyeson);
    noStroke();
    vertex(120, 199, 10);
    bezierVertex(165, 144, 30, 302, 227, 20, 287, 283, 10);
    bezierVertex(282, 300, 35, 260, 328, 45, 206, 324, 55);
    bezierVertex(155, 315, 65, 82, 256, 30, 120, 199, 10);
    endShape();
  }
  
  popMatrix();
}

void exR_eve() {
  pushMatrix();
  translate(-145, 120, 215);
  scale(0.5, 0.5, 0.5);
  rotateY(radians(30));

  if (drawstate == 1)
  {
    beginShape();
    fill(eyeson);
    vertex(363, 258, 25);
    bezierVertex(334, 251, 30, 383, 180, 30, 451, 180, 35);
    bezierVertex(516, 179, 30, 556, 226, 40, 553, 253, 45);
    bezierVertex(465, 218, 50, 401, 231, 45, 363, 258, 25);
    endShape();
  }
  else if (drawstate == 2)
  {
    // mean face
    //right eye
    beginShape();
    fill(eyeson);
    vertex(353, 283, 25);
    bezierVertex(403, 257, 40, 485, 249, 55, 541, 229, 45);
    bezierVertex(573, 218, 60, 534, 296, 65, 434, 326, 60);
    bezierVertex(379, 328, 45, 336, 290, 35, 353, 282, 25);
    endShape();
  }
  else if (drawstate ==3)
  {
    // Initial Eyes
    beginShape();
    fill(eyeson);
    vertex(353, 282, 10);
    bezierVertex(337, 227, 20, 474, 146, 35, 520, 199, 35);
    bezierVertex(558, 257, 45, 484, 317, 70, 434, 325, 60);
    bezierVertex(379, 328, 50, 357, 300, 40, 353, 282, 10);
    endShape();
  }
  else if (drawstate ==4)
  {
  beginShape();
  fill(19, 84, 178);
  vertex(363, 279, 20);
  bezierVertex(419, 329, 50, 478, 289, 60, 540, 241, 45);
  bezierVertex(571, 229, 45, 490, 324, 70, 433, 326, 60);
  bezierVertex(377, 328, 45, 352, 275, 45, 363, 279, 20);
  endShape();
 
  }
  
  popMatrix();
}
 
void keyPressed() {
  
  if(key == '1') {
    drawstate = 1;
    initt();
  }
  
  if(key == '2') {
    drawstate = 2;
    initt();
  }
  
  if(key == '3') {
    drawstate = 3;
    initt();
  }

  if(key == '4') { 
    drawstate = 4;
    initt();
  }
}
void face_eve() {
  pushMatrix();
  
  translate(0, -30, 55);
  rotate(PI);
  scale(0.8, 0.75, 0.5);
  fill(0);
  
  //bottom part
  for (float pol = 160; pol <= 180; pol+=3) {
    //stroke(0);
    float r = 460;
    beginShape(QUAD_STRIP);
    for (float theta = 0; theta <= 180; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape(CLOSE);
  }


  //middle part
   rotate(PI);
   translate(0, 253, 0);
   
   float r_m = 80;
   float r_d = -13;
   float r_d_d = 0.84;
   
   for(float z = 0; z<=180; z+=10) {
   beginShape(QUAD_STRIP);
   for (float deg = 0; deg<=180; deg+=10) {
   
   
   float rads = radians(deg);
   float x = r_m*cos(rads);
   float y = r_m*sin(rads);
   
   if(z>50) {
   vertex(ax[floor(deg/10)], z-10, ay[floor(deg/10)]);     
   vertex(x, z, y);
   }
   
   
   ax[floor(deg/10)] = x;
   ay[floor(deg/10)] = y;
   
   } 
   r_m -= r_d;
   r_d *= r_d_d;
   endShape();
   } 
   
   
  //top part
  translate(0, 154, 0);
  for (float pol = 129; pol <= 180; pol+=3) {
    //stroke(0);
    float r = 164;
    beginShape(QUAD_STRIP);
    for (float theta = 0; theta <= 180; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape(CLOSE);
  }



  
  popMatrix();
}


//bottom part
void skull_eve() {
  pushMatrix();
  translate(0, -120, -30);
  rotate(PI);

  for (float pol = 160; pol <= 180; pol+=3) {
    //stroke(0);
    float r = 460;
    beginShape(QUAD_STRIP);
    for (float theta = 0; theta <= 360; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape(CLOSE);
  }


  //middle part
   rotate(PI);
   translate(0, 253, 0);
   
   float r_m = 80;
   float r_d = -13;
   float r_d_d = 0.84;
   
   for(float z = 0; z<=180; z+=10) {
   beginShape(QUAD_STRIP);
   for (float deg = 0; deg<=360; deg+=10) {
   
   
   float rads = radians(deg);
   float x = r_m*cos(rads);
   float y = r_m*sin(rads);
   
   if(z>50) {
   vertex(ax[floor(deg/10)], z-10, ay[floor(deg/10)]);     
   vertex(x, z, y);
   }
   
   
   ax[floor(deg/10)] = x;
   ay[floor(deg/10)] = y;
   
   } 
   r_m -= r_d;
   r_d *= r_d_d;
   endShape();
   } 
   
   
  //top part
  translate(0, 154, 0);
  for (float pol = 129; pol <= 180; pol+=3) {
    //stroke(0);
    float r = 164;
    beginShape(QUAD_STRIP);
    for (float theta = 0; theta <= 360; theta+=5) {
      float x = r*sin(radians(pol))*cos(radians(theta));
      float y = r*sin(radians(pol))*sin(radians(theta));
      float z = r*cos(radians(pol));

      vertex(x, z, y);


      x = r*sin(radians(pol+3))*cos(radians(theta));
      y = r*sin(radians(pol+3))*sin(radians(theta));
      z = r*cos(radians(pol+3));        

      vertex(x, z, y);
    }
    endShape(CLOSE);
  }




  popMatrix();
} 
void head_eve() {
  
  pushMatrix();
  
  translate(0, -485, 0); //466,
  rotateY(radians(nmvY));
  rotateZ(radians(nmvZ));
  fill(255);
  skull_eve();
  face_eve();
  ex_eve();
  
  popMatrix();
}

void ex_eve() {
  pushMatrix();
  // translate(0, -1000, 50);
  
  exL_eve();
  exR_eve();
  
  popMatrix();
}
void initt() {
  armv1 = 0;
  armv2R = 0;
  armv2L = 0;
  armv3R = 0;
  armv3L = 0;
  armv4 = 0;
  nmvY = 0;
  nmvZ = 0;
  bmvZ = 0;
}
  
  
  

void key1() {
  if(mousePressed && drawstate == 1) {
   if (armv1 > 6 || armv1 < 0) armb1 = !armb1;
  
   if(armb1 == true) {
     armv1 ++;
   } else if (armb1 == false) {
     armv1 --;
   }
   
   if (nmvZ > 3 || nmvZ < -3) nbZ = !nbZ;
  
   if(nbZ == true) {
     nmvZ --;
   } else if (nbZ == false) {
     nmvZ ++;
   }
    
 } 
}

void key2() {
  if(mousePressed && drawstate == 2) {
   if (armv2L > 25 || armv2L < -25) armb2L = !armb2L;
   
    if(armb2L == true) {
     armv2L +=2;
    } else if (armb2L == false) {
     armv2L -=2;
    }

    if (armv2R > 25 || armv2R < -25) armb2R = !armb2R;
   
     if(armb2R == true) {
      armv2R -=2;
    } else if (armb2R == false) {
      armv2R +=2;
    }
    
     if (nmvY > 30 || nmvY < -30) nbY = !nbY;
   
     if(nbY == true) {
      nmvY -=3;
    } else if (nbY == false) {
      nmvY +=3;
    }
    
  }
}

void key3() {
   
  if(mousePressed && drawstate == 3) {
    
     armv3R = 160;
     armv3L = 160;
    
    if (bmvZ > 2 || bmvZ < -2) bbZ = !bbZ;
   
     if(bbZ == true) {
      bmvZ --;
    } else if (bbZ == false) {
      bmvZ ++;
    } 
    
    if (nmvY > 6 || nmvY < -6) nbY = !nbY;
   
     if(nbY == true) {
      nmvY -=3;
    } else if (nbY == false) {
      nmvY +=3;
    }
    
  }
}

void key4() {
  armv4 = 90;
  if(mousePressed) {
    
    
    if (armv4 > 210 || armv4 < 80) armb4 = !armb4;
   
     if(armb4 == true) {
      armv4 +=10;
    } else if (armb4 == false) {
      armv4 -=10;
    }
    
     /*if (nmvZ > 5 || nmvZ < 0) nbZ = !nbZ;
   
     if(nbZ == true) {
      nmvZ +=5;
    } else if (nbZ == false) {
      nmvZ -=5;
    }*/
    
  }
}
  
  
  


