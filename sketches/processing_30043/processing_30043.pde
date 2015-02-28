
//http://processing.org/reference/beginShape_.html
//http://processing.org/reference/curveVertex_.html
//http://processing.org/reference/bezierVertex_.html
float incx=00;
float incy=100;
//bezierVertexi(80, 0, 80, 75, 30, 75);
void bezierVertexi(float a,float b, float c , float d, float e, float f){
  

  for (float x=e-10;x<e+10;x++){
    for (float y=f-10;y<f+10;y++){ //e
      float z = dist(e,f,x,y);
      if(z<5){
        set(int(incx)+int(x)-000,int(incy)+int(y)-100,color(e*f,e,f,111)); 
      }
      if(z>7  && z<10){
        set(int(incx)+int(x)-000,int(incy)+int(y)-100,color(128,11)); 
      }

    }
  }

  bezierVertex(a,b,c,d,e,f);

}
void vertexi(float a,float b){
  //set(a,b,1);
  for (float x=a-10;x<a+10;x++){
    for (float y=b-10;y<b+10;y++){
      float z = dist(a,b,x,y);
      if(z<5){
        set(int(incx)+int(x)-000,int(incy)+int(y)-100,color(b*a,b,a,111)); 
      }
      if(z>7  && z<10){
        set(int(incx)+int(x)-000,int(incy)+int(y)-100,color(128,11)); 
      }

    }
  }
  vertex(a,b);

}

void curveVertexi(float a,float b){
  //set(a,b,1);
  for (float x=a-10;x<a+10;x++){
    for (float y=b-10;y<b+10;y++){
      float z = dist(a,b,x,y);
      if(z<5){
        set(int(incx)+int(x)-000,int(incy)+int(y)-100,color(b*a,b,a,111)); 
      }
      if(z>7  && z<10){
        set(int(incx)+int(x)-000,int(incy)+int(y)-100,color(128,11)); 
      }

    }
  }
  curveVertex(a,b);

}


void beginShapen(){
  beginShape();
  translate(-incx,-incy);

  if(incx>width-100){
    incx=100; 
    incy+=100;
  }
  incx+=100;
  translate(incx,incy);
}

void beginShapebv(){
  beginShape();
  translate(-incx,-incy);

  if(incx>width-100){
    incx=100; 
    incy+=100;
  }
  incx+=100;
  translate(incx,incy);

}

void beginShapec(){
  beginShape();
  translate(-incx,-incy);

  if(incx>width-100){
    incx=100; 
    incy+=100;
  }
  incx+=100;
  translate(incx,incy);
}

void beginShapex(int val){
  translate(-incx,-incy);
  beginShape(val);
  incx+=100;
  if(incx>width-100){
    incx=100; 
    incy+=100;
  }
  translate(incx,incy);
}

void setup(){
  size(512,312,P2D);
  smooth();


  background(-1);
  stroke(1);
  beginShapen();
  vertexi(30, 20);
  vertexi(85, 20);
  vertexi(85, 75);
  vertexi(30, 75);
  endShape(CLOSE);



  beginShapex(POINTS);
  vertexi(30, 20);
  vertexi(85, 20);
  vertexi(85, 75);
  vertexi(30, 75);
  endShape();



  beginShapex(LINES);
  vertexi(30, 20);
  vertexi(85, 20);
  vertexi(85, 75);
  vertexi(30, 75);
  endShape();



  noFill();
  beginShapen();
  vertexi(30, 20);
  vertexi(85, 20);
  vertexi(85, 75);
  vertexi(30, 75);
  endShape();



  noFill();
  beginShapen();
  vertexi(30, 20);
  vertexi(85, 20);
  vertexi(85, 75);
  vertexi(30, 75);
  endShape(CLOSE);



  beginShapex(TRIANGLES);
  vertexi(30, 75);
  vertexi(40, 20);
  vertexi(50, 75);
  vertexi(60, 20);
  vertexi(70, 75);
  vertexi(80, 20);
  endShape();



  beginShapex(TRIANGLE_STRIP);
  vertexi(30, 75);
  vertexi(40, 20);
  vertexi(50, 75);
  vertexi(60, 20);
  vertexi(70, 75);
  vertexi(80, 20);
  vertexi(90, 75);
  endShape();



  beginShapex(TRIANGLE_FAN);
  vertexi(57.5, 50);
  vertexi(57.5, 15); 
  vertexi(92, 50); 
  vertexi(57.5, 85); 
  vertexi(22, 50); 
  vertexi(57.5, 15); 
  endShape();



  beginShapex(QUADS);
  vertexi(30, 20);
  vertexi(30, 75);
  vertexi(50, 75);
  vertexi(50, 20);
  vertexi(65, 20);
  vertexi(65, 75);
  vertexi(85, 75);
  vertexi(85, 20);
  endShape();



  beginShapex(QUAD_STRIP); 
  vertexi(30, 20); 
  vertexi(30, 75); 
  vertexi(50, 20);
  vertexi(50, 75);
  vertexi(65, 20); 
  vertexi(65, 75); 
  vertexi(85, 20);
  vertexi(85, 75); 
  endShape();



  beginShapen();
  vertexi(20, 20);
  vertexi(40, 20);
  vertexi(40, 40);
  vertexi(60, 40);
  vertexi(60, 60);
  vertexi(20, 60);
  endShape(CLOSE);

  noFill();
  beginShapec();
  curveVertexi(84,  91);
  curveVertexi(84,  91);
  curveVertexi(68,  19);
  curveVertexi(21,  17);
  curveVertexi(32, 100);
  curveVertexi(32, 100);
  endShape();


  noFill();
  beginShapebv();
  vertexi(30, 20);
  bezierVertexi(80, 0, 80, 75, 30, 75);
  endShape();



  beginShapebv();
  vertexi(30, 20);
  bezierVertexi(80, 0, 80, 75, 30, 75);
  bezierVertexi(50, 80, 60, 25, 30, 20);
  endShape();
}

