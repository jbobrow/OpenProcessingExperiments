
float [][][] body;
float [][][] wave;
float rX= 0.7, rY, vX, vY, phi=PI;
float delte =100;
float delta = 3;
float delto = 3;
float r =1; 
float rr=0;
float rotx = 0;
float roty = 0;
float rtx = 0.7;
float rty = 0.7;
float mp = 0;
float m = 35;
float si = 0;
float ac =0.1;
void setup()
{
  size(1600, 900, P3D);  noCursor();
}
void draw()
{  

  background(#1CC9FE);  
  translate(width/2, height/2, 0); 

  rotateY(2*rty);
  rotateX(-2*rtx);

  pushMatrix();

  si++;
  popMatrix();
  pushMatrix();
  rotateZ(radians(225));
  rotateX(radians(20));
  rotateX(1.3); 
  //println(si);
  if (keyPressed) {

    if (key == CODED) {
      if (keyCode == UP) {

        drawMatrix(0, 0, 0);
      
    } else if (keyCode == DOWN) {
      drawskeleton(0, 0, 0);
    }
    else if(keyCode == RIGHT){
    mp-=0.3+ac;
    ac+=0.1; 
 if(ac>=30){ac=30;}
 println(ac);
    drawbody(0, 0, 0);
  }   
  } }else { 
    drawbody(0, 0, 0);
  }
  drawfin(0, 0, 0);
  pushMatrix();
  rotateZ(radians(180));
  rotateY(radians(270));   
  drawhead(0, 0, 0);
  popMatrix();
  popMatrix();
}
void mouseDragged() {
  float rate = 1.6E-4;
  rotx*=0.9;  
  rotx += (pmouseY-mouseY) * rate;
  roty*=0.9;  
  roty +=(mouseX-pmouseX) * rate;
  rtx += rotx;
  rty += roty;
}
void drawMatrix(float a, float y, float z) {
  translate(a, y, z);
  stroke(5);
  float cxp, czp;
  float r=200;
  float theta;
  body = new float[50][130][2]; //[z][x][y]
  for (int j=0; j<31; j+=1) {
    int x=j*12;
    mp-=0.3;
    float cC= sin(radians(x+(mp/10)))*100;
    r-=j/3;
    for (int i=0; i<13; i+=1) {
      theta=i*30;
      cxp = cC+r* 0.5*cos(radians(theta)); 
      czp = cC+r* 0.5*sin(radians(theta));
      body[j][i][0]= cxp;
      body[j][i][1]= czp;
      
  
    }
  }


  stroke(#15456C);
  for (int j=0; j<31; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<13; i+=1) {
      noFill(); 
      vertex( body[j][i][0], j*50, body[j][i][1] );
      vertex( body[j+1][i][0], (j+1)*50, body[j+1][i][1] );
    }
    endShape();
  }

}

void drawskeleton(float a, float y, float z) {
  translate(a, y, z);
  
  stroke(5);
  float cxp, czp;
  float r=200;
  float theta;
  body = new float[50][130][2]; //[z][x][y]
  for (int j=0; j<31; j+=1) {
    int x=j*12;
    mp-=0.3;
    float cC= sin(radians(x+(mp/10)))*100;
    r-=j/3;
    for (int i=0; i<13; i+=1) {
      theta=i*-35;
      cxp = cC+r* 0.5*cos(radians(theta)); 
      czp = cC+r* 0.5*sin(radians(theta));
      body[j][i][0]= cxp;
      body[j][i][1]= czp;
    }
  }
  //stroke(#15456C);
  // for(int na = 31; na>12; na--){
  for (int j=0; j<31; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<13; i+=1) {
      fill(#15456C);
      noStroke(); 
      if (j>31)
        vertex( body[j][i][0], j*50, body[j][i][1] );
      vertex( body[j+1][i][0], (j+1)*50, body[j+1][i][1] );
    }
    endShape();
  }
}

void drawbody(float a, float y, float z) {
  translate(a, y, z);
  stroke(5);
  float cxp, czp;
  float r=200;
  float theta;
  body = new float[50][130][2]; //[z][x][y]
  for (int j=0; j<31; j+=1) {
    int x=j*12;
    mp-=0.3;
    float cC= sin(radians(x+(mp/10)))*100;
    r-=j/3;
    for (int i=0; i<31; i+=1) {
      theta=i*12;
      cxp = cC+r* 0.5*cos(radians(theta)); 
      czp = cC+r* 0.5*sin(radians(theta));
      body[j][i][0]= cxp;
      body[j][i][1]= czp;
    }
  }
  // lights();
  noStroke();
  for (int j=0; j<31; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<31; i+=1) {
      fill(#15456C);
      vertex( body[j][i][0], j*50, body[j][i][1] );
      if (j<31)
        vertex( body[j+1][i][0], (j+1)*50, body[j+1][i][1] );
    }
    endShape();
  }

}

void drawbody2(float a, float y, float z) {
  pushMatrix();
  translate(a, y, z);
  stroke(5);
  float cxp, czp;
  float r=200;
  float theta;
  body = new float[100][130][2]; //[z][x][y]
  for (int j=0; j<13; j+=1) {
    int x=j*30;
    mp-=0.5;
    float cC= sin(radians(x+(mp/10)))*20;
    r+=j;
    for (int i=0; i<13; i+=1) {
      theta=i*30;
      cxp = cC+r* 0.5*cos(sin(radians(theta))); 
      czp = cC+r* 0.5*tan(radians(theta));
      body[j][i][0]= cxp;
      body[j][i][1]= czp;
    }
  }
  // lights();
  stroke(0);
  for (int j=0; j<13; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<13; i+=1) {
      fill(#1CB9FF);
      vertex( body[j][i][0], j*100, body[j][i][1] );
      vertex( body[j+1][i][0], (j+1)*100, body[j+1][i][1] );
    }
    endShape();
  }
  popMatrix();
}

void drawbody3(float a, float y, float z) {
  pushMatrix();
  translate(a, y, z);
  stroke(5);
  float cxp, czp;
  float r=200;
  float theta;
  body = new float[100][130][2]; //[z][x][y]
  for (int j=0; j<20; j+=1) {
    int x=j*50;
    mp-=0.5;
    float cC= sin(radians(x+(mp/10)))*100;
    r+=j;
    for (int i=0; i<13; i+=1) {
      theta=i*30;
      cxp = cC+r* 0.5*cos(radians(theta)); 
      czp = cC+r* 0.5*tan(radians(theta));
      body[j][i][0]= cxp;
      body[j][i][1]= czp;
    }
  }
  // lights();
  for (int j=0; j<20; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<13; i+=1) {
      fill(#1CB9FF);
      noStroke();
      vertex( body[j][i][0], j*100, body[j][i][1] );
      vertex( body[j+10][i][0], (j+1)*100, body[j+1][i][1] );
    }
    endShape();
  }
  popMatrix();
}

void drawfin(float a, float y, float z) {
  pushMatrix();
  translate(a, y, z);
  stroke(5);
  float cxp, czp;
  float r=200;
  float theta;
  body = new float[50][130][2]; //[z][x][y]
  for (int j=0; j<31; j+=1) {
    int x=j*12;
    mp-=0.3;
    float cC= sin(radians(x+(mp/10)))*100;
    r-=j/3;
    for (int i=0; i<31; i+=1) {
      theta=i*12;
      cxp = cC+r* 0.5*sin(radians(theta)); 
      czp = cC-r* 0.5*sin(radians(theta));
      body[j][i][0]= cxp;
      body[j][i][1]= czp;
    }
  }
  // lights();
  noStroke();
  for (int j=0; j<31; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<13; i+=1) {
      fill(#E0E367);
      vertex( body[j][i][0], j*50, body[j][i][1] );
      vertex( body[j+1][i][0], (j+1)*50, body[j+1][i][1] );
    }
    endShape();
  }
  popMatrix();
}

void drawhead(float a, float y, float z) {
  pushMatrix();
  translate(a, y, z);
  stroke(5);
  float cxp, czp;
  float r=200;
  float theta;
  body = new float[50][50][2]; //[z][x][y]
  for (int j=0; j<31; j+=1) {
    int x=j;
    mp-=0.3;
    float cC= sin(radians(x+(mp/10)))*100;
    r-=j;
    for (int i=0; i<31; i+=1) {
      theta=i*12;
      cxp = cC+r* 0.5*cos(radians(theta)); 
      czp = cC+r* 0.5*sin(radians(theta));
      body[j][i][0]= czp;
      body[j][i][1]= cxp;
    }
  }
  // lights();
  noStroke();
  //stroke(#000000);
  for (int j=0; j<20; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<31; i+=1) {
      fill(#15456C);
      //  noFill();
      vertex( body[j][i][0], (j)*10, body[j][i][1] );
      if (j<19)
        vertex( body[j+1][i][0], (j+1)*10, body[j+1][i][1] );
    }
    endShape();
  }
  popMatrix();
}

 void drawheart(float a, float y, float z) {
   translate(a, y, z);
  
 for (int i = 1; i <= m; i++) {
 float mop = map(mouseX, 0, width, -100,100);
  
     int x=i*12;
    mp-=0.3;
  
  
   pushMatrix();
  
    noStroke(); 
    fill(255, 0, 0);
    sphere(i/2);
   popMatrix();
  }  
  if (m >= 50)
  {
    m=35;
  }
  m++; 
  
 }
void wave(float a, float y, float z) {
  pushMatrix();
  translate(a, y, z);
  for (float q = 0; q< 30; q+=1) {
    for (float deg5 = 0; deg5 < 360; deg5 += delto) {
      float d = map(q, 0, 30, 0, 50);
      float thete = radians(deg5);
      float o = d * cos (thete);
      float p = d* sin(thete);
      strokeWeight(5);
      float f = map(q, 0, 30, 100, 255);
      stroke(255);
      strokeWeight(1);
      point (o, p, (-2)*q);
    }
  }
  popMatrix();
}



