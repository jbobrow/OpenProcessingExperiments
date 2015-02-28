
float inc=0.0;
void setup(){
  size(800,600);
  smooth();
  PImage b;
  b = loadImage ("jungle.png");
  background (b);
}
void draw(){
  
  inc+=0.02;
  float angle = sin(inc)/1.0+sin(inc*5)/1.0;
  pushMatrix();
  translate(300,600);
  for(int i = 0;i>0;i--){
    strokeWeight(i);
    tint (255,133);
    line(0,0,0,-30);
    translate(0,-30);
    rotate(angle);
}
  popMatrix();
  
  
   pushMatrix();
  translate(320,600);
  for(int i = 10;i>0;i--){
    strokeWeight(i);
    stroke (216, 246, 152);
    line(0,0,0,-20);
    translate(0,-20);
    rotate(angle/.2);
}
  popMatrix();
  
  
   pushMatrix();
  translate(120,600);
  for(int i = 10;i>0;i--){
    strokeWeight(i);
    stroke (68, 95, 9);
    line(0,100,0,-30);
    translate(0,-30);
    rotate(angle/.3);
}

popMatrix();
  
  
   pushMatrix();
  translate(250,600);
  for(int i = 12;i>0;i--){
    strokeWeight(i);
    stroke (168, 234, 26);
    line(0,100,0,-30);
    translate(0,-30);
    rotate(angle/.3);
    
  }
    
    popMatrix();
  
  
   pushMatrix();
  translate(250,600);
  for(int i = 12;i>0;i--){
    strokeWeight(i);
    stroke (106, 148, 14);
    line(0,100,0,-30);
    translate(0,-30);
    rotate(angle/.3);
    
    
  }

popMatrix();

  
    pushMatrix();
  translate(520,600);
  for(int i = 2;i>0;i--){
    strokeWeight(i);
    line(100,0,0,-20);
    translate(0,-20);
    rotate(angle/.4);
  }

  popMatrix();
  
    pushMatrix();
  translate(100,600);
  for(int i = 5;i>0;i--){
    strokeWeight(i);
    line(0,0,0,-20);
    translate(0,-20);
    rotate(angle/.5);
  }



  popMatrix();
  
    pushMatrix();
  translate(10,600);
  for(int i = 8;i>0;i--){
    strokeWeight(i);
    stroke (57, 144, 46);
    line(0,0,0,-20);
    translate(0,-20);
    rotate(angle/.6);
  }

  popMatrix();
  
      pushMatrix();
  translate(500,600);
  for(int i = 8;i>0;i--){
    strokeWeight(i);
    stroke (139, 225, 55);
    line(0,0,0,-20);
    translate(0,-20);
    rotate(angle/.6);
  }
  
    popMatrix();
    
   
  
      pushMatrix();
  translate(700,600);
  for(int i = 4;i>0;i--){
    strokeWeight(i);
    stroke (16, 76, 4);
    line(0,0,100,-20);
    translate(0,-60);
    rotate(angle/.4);
    
}

  popMatrix();
  
      pushMatrix();
  translate(400,600);
  for(int i = 20;i>0;i--){
    strokeWeight(i);
    stroke (29, 164, 6);
    line(0,20,0,-20);
    translate(0,-10);
    rotate(angle/.6);
  }
  
    popMatrix();
    
     

  
  
   pushMatrix();
  translate(600,600);
  for(int i = 10;i>0;i--){
    strokeWeight(i);
    stroke (151, 212, 20);
    line(0,100,0,-30);
    translate(0,-30);
    rotate(angle/5);
    
  }
  
      popMatrix();
    
}

