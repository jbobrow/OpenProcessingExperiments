
void setup(){
  size(720,480);
  background(0,35,82);
}

void draw(){
  persona();
  raton();
  for(int i=0; i<10; i++){
    pushMatrix();
      translate(i*83,15);
      estrellas();
    popMatrix();
  }
  for(int i=-1; i<10; i++){
    pushMatrix();
      translate(i*83+41,53);
      estrellas();
    popMatrix();
  }
  for(int i=-1; i<10; i++){
    pushMatrix();
      translate(i*83,95);
      estrellas();
    popMatrix();
  }
}

void persona(){
  //translate(100,100);
  //bezier(30,90,60,20,90,30,80,80);
  //ellipse(0,0,40,40);
  for(int i = -1; i<3;i++){
    pushMatrix();
    fill(198,197,196);
    translate(i*300,300);
    scale(3);
    beginShape();
    vertex(0, 0);
    vertex(100, 0);
    vertex(140, 100);
    vertex(40, 100);
    endShape(CLOSE);
    popMatrix();
  }
  rect(-2,170,723,10);
  for(int j = 0; j<5;j++){
    pushMatrix();
    translate(j*15,275-j*25);
    for(int i = -1; i<20;i++){
      pushMatrix();
      fill(185,59,0);
      translate(i*50,0);
      rect(-50, 0, 50,25);
      popMatrix();
    }
    popMatrix();
  }
  
}

void raton(){
  
  pushMatrix();
  translate(340,340);
  noFill();
  bezier(20, 20, 90, 50, 0, 80, 60, 90);
  fill(0);
  //noFill();
  translate(100,100);
  pushMatrix();
  //scale(2);
  //curve(-45, 10, -35, 24, -30, 15, -70, 20);
  ellipse(-20,0,45,45);
  ellipse(0,0,80,40);
  ellipse(0,5,70,40);
  ellipse(40,-20,60,30);
  ellipse(30,-10,30,35); //cuello
  ellipse(36,-35,8,25);
  pushMatrix();
  translate(5,15);
  pushMatrix();
  rotate(-PI/8);
  ellipse(36,-35,8,25);
  popMatrix();
  
  popMatrix();
  
  pushMatrix();
  rotate(PI/8);
  ellipse(-10,30,8,30);
  popMatrix();
  
  pushMatrix();
  rotate(PI/4);
  ellipse(-8,31,8,30);
  popMatrix();
  
  pushMatrix();
  rotate(-PI/8);
  ellipse(17,28,8,30);
  popMatrix();
  
  pushMatrix();
  rotate(-PI/4);
  ellipse(15,26,8,30);
  popMatrix();
  
  fill(255);
  ellipse(40,-25,7,7);
  //fill(0);
  
  stroke(255);
  line(45,-10, 54,-15);
  line(45,-15, 54,-17);
  stroke(0);
  line(75,-40, 70,-35);
  line(80,-40, 75,-35);
  
  popMatrix();
  popMatrix();
}

void estrellas(){
  stroke(255,237,33);
   pushMatrix();
     line(0,0,10,10);
     line(5,0,5,10);
     line(0,5,10,5);
     line(10,0,0,10);
   popMatrix();
   stroke(0);
}


