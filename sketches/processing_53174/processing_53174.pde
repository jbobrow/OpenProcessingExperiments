

float x,y,z,angle;




void setup(){
  size (1000,1000,P3D);
  y = 0;
  x = 0;
  angle = 0;
  smooth();
  for(int i = 0; i<100; i++){
    if(i%50 == 0){
    background(0);
    
    }
   }
}


void draw(){
  lights();
  shininess(10.0);
  pushMatrix();
    rotateY(map(mouseX,0,width,0,PI*2));  //mapping courtesy of Nick Lalley
    rotateX(map(mouseY,0,height,0,PI*2));
    drawShape();
    drawBlack();
    //drawEraser();
  popMatrix();

  
    
}

void drawShape(){
  x = cos(radians(angle)) * 660 + width/2;
  y = sin(radians(angle)) * 800 + height/2;
  z = cos(radians(angle)) + width/2;
  pushMatrix();
    translate(x,1000,y);
    rotateY(cos(z));
    rotateX(sin(z));
    //glowLight courtesy of Nick Lally
    float glowLight = sin(radians(angle/3));
    glowLight = map(glowLight, -1,1,0,255);
    stroke(glowLight);
    strokeWeight(.25);
    box(10,10,1000);
  popMatrix();
  angle++;
}

void drawBlack(){
  x = cos(radians(angle)) * 300 + width/2;
  y = sin(radians(angle)) * 100 + height/2;
  z = cos(radians(angle)) + width/2;
  pushMatrix();
    fill(0);
    translate(x,1000,y);
    for(int i = 1; i <100; i++){
      box(20,20,20);
    }
  popMatrix();
  pushMatrix();
    fill(0);
    translate(x,900,y);
    for(int i = 1; i <100; i++){
      box(20,20,20);
    }
  popMatrix();
  pushMatrix();
    fill(0);
    translate(x,1100,y);
    for(int i = 1; i <100; i++){
      box(20,20,20);
    }
  popMatrix();
  angle++;
}

void drawEraser(){
  x = cos(radians(angle)) * 600 + width/2;
  y = sin(radians(angle)) * 200 + height/2;
  z = cos(radians(angle)) + width/2;
  pushMatrix();
    noFill();
    translate(x,mouseX,y);
    for(int i = 1; i <100; i++){
      box(70,90,30);
      
    }
  popMatrix();
  angle++;
}


      



  

