
void setup(){
  
  size(600,600,P3D);
  
}

 int k = 355;
 int g = 205;
 int s = 255;
 int c = 0;
 int l = 0;
 int r = 0;
 
void draw(){
  background(237,198,124);
  
  fill(44,71,240);
  
  translate(width/2,height/2);
  rotateY(map(mouseX,0,width,0,2*PI));
  translate(-width/2,-height/2);
  //float cameraX = map(mouseX, 0, width, 
  
 
  for(float z = -200; z<0; z+=0.5){
    pushMatrix();
    translate(0,0,z);
    rect(200,150,200,300,80);
    popMatrix();
  }
  
  pushMatrix();
  fill(44,71,150);
  translate(0,0,-201);
  rect(200,150,200,300,80);
  popMatrix();
  
   
  //left eye
  fill(240,189,213);
  ellipse(250,200,40,40);
  //left puple
  fill(5,5,5);
  ellipse(s,g,20,20);
  if(mousePressed == true){
    pushMatrix();
    s = 250;
    g = 200;  
    translate(0,0,30);
    popMatrix();
        
  }
  else if (mousePressed == false){
    s = 255;
    g = 205;
  }
   
   
  //right eye
  fill(240,189,213);
  ellipse(350,200,40,40);
   
   
  //right puple
  fill(5,5,5);
  ellipse(k,g,20,20);
    if(mousePressed == true){
    k = 350;
    g = 200;      
  }
  else if (mousePressed == false){
    k = 355;
    g = 205;
  }
  //mouth
  fill(c,l,r);
  ellipse(300,300,70,70);
    if(mousePressed == true){
     c =44;
     l =71;
     r =240;
  }
  else if (mousePressed == false){
    c = 0;
    l = 0;
    r = 0;
  }
  //mouth2
  fill(0);
  arc(300,300,70,70,PI,TWO_PI);
   
  //leftfoot
  fill(0);
  noStroke();
  for(float z = -140 ; z<0 ; z++){
    pushMatrix();
    translate(0,0,z);
    arc(240,460,50,50,PI,TWO_PI);
    popMatrix();
  }
  
  //right foot
  for(float z = -140 ; z<0 ; z++){
    pushMatrix();
    translate(0,0,z);
    arc(350,460,50,50,PI,TWO_PI);
    popMatrix();
  }
  
  
  //left arm
  
  pushMatrix();
  
  for(float z = -140 ; z<-70 ; z++){
    pushMatrix();
    translate(0,0,z);
    rect(160,290,50,60);
    ellipse(190,286,60,40);
    rotate(radians(map(mouseX,0,width/2,PI/4,0)));
    popMatrix();
  }  
  popMatrix();
  
  
  
  
  //right arm
 
  for(float z = -140 ; z<-70 ; z++){
    pushMatrix();
    translate(0,0,z);
    rect(390,290,50,60);  
    ellipse(400,286,80,40);
    popMatrix();
  }
  
  
  
  //umbrella
  pushMatrix();
  translate(170,-50,-100);
  rotateX(-PI/2);
  noStroke();
  fill(255,0,0);
  beginShape(TRIANGLE_STRIP);
  for(float z = 0 ; z<200; z+=1){
    for(float t = 0 ; t < 360 ; t+=0.5){
      pushMatrix();
      lights();
      translate(0,0,z);
      float d = radians(t);
      float x = z * cos(d);
      float y = z * sin(d);
      vertex(x,y,z);
      
      float d2 = radians(t+1);
      float z2 = z + 1;
      x = z2 * cos(d2);
      y = z2 * sin(d2);
      
      vertex(x,y,z2);
      popMatrix();
    }
  }
  endShape(CLOSE);
  popMatrix();
  
  pushMatrix();
  rotateX(-PI/2);
  for(float z = 0; z<400; z++){
    pushMatrix();
    translate(0,0,z);
    ellipse(160,100,5,5);
    popMatrix();
  }
  popMatrix();
    
  
  
}



