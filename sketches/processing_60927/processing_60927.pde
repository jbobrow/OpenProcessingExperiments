
void setup(){
  size(800,1200);
  smooth();
}

int randomized = int(random(2,5));

void draw(){
  
  int triX = 40;
  int triY = 70;
  
  int triCountX = width/triX;
  int triCountY = height/triY;
  
  noStroke();
  
  for (int j = 0; j<=triCountY; j++){
    for (int i = 0; i<=triCountX; i++){
    fill(185+j*4,40-j,55-j*2);
    triangle(0+i*triX,0+j*triY,40+i*triX,0+j*triY,20+i*triX,35+j*triY);
  }
  }
  
   for (int j = 0; j<=triCountY; j++){
     for (int i = 0; i<=triCountX; i++){
     fill(220+j*2,200,150-j*2);
     triangle(-20+i*triX,35+j*triY,0+i*triX,0+j*triY,20+i*triX,35+j*triY);
  }
  }
  
  for (int j = 0; j<=triCountY; j++){
    for (int i = 0; i<=triCountX; i++){
    fill(185+j*4,40-j,55-j*2);
    triangle(-20+i*triX,35+j*triY,20+i*triX,35+j*triY,0+i*triX,70+j*triY);
  }
  }
  
   for (int j = 0; j<=triCountY; j++){
     for (int i = 0; i<=triCountX; i++){
     fill(220+j*2,200,150-j*2);
     triangle(-40+i*triX,70+j*triY,-20+i*triX,35+j*triY,0+i*triX,70+j*triY);
  }
  }
  
    for (int j = 0; j<=triCountY; j++){
     for (int i = 0; i<=triCountX; i++){
     noFill();
     if(i%2==0){
       fill(100+j*6,40-j*8,55-j*3);
       strokeWeight(1);
       stroke(105,0,20);
     }
     triangle(-40+i*triX,70+j*triY,-20+i*triX,35+j*triY,0+i*triX,70+j*triY);
  }
  }
  
  
   for (int j = 0; j<=triCountY; j++){
     for (int i = 0; i<=triCountX; i++){
     noFill();
     if(i%2==0){
       fill(100+j*6,40-j*8,55-j*3);
       strokeWeight(1);
       stroke(105,0,20);
     }
     triangle(-40+i*triX,0+j*triY,-20+i*triX,35+j*triY,0+i*triX,0+j*triY);
  }
  }
  
  
    
  
      for (int i = 0; i<=height;i++) {
        
      int c1 = 25-i;
      int c2 = 260;
      int c3 = 205+i;
      
      if(keyPressed){
        if(key=='1'){
           c1 = 200+i;
           c2 = 90-i*2;
           c3 = 30+i*2;
        }
      }
      
      if(keyPressed){
        if(key=='2'){
           c1 = 165+i;
           c2 = 205-i*2;
           c3 = 35+i*2;
        }
      }
    
      strokeWeight(1);
      if(i%4==0){
        strokeWeight(3);
      }
      stroke(c1,c2,c3);
      line(-400+i*40,0,57+i*40,800);
    }
    
    for (int i = 0; i<=height;i++) {
      
      int c1 = 25-i;
      int c2 = 260;
      int c3 = 205+i;
      
      if(keyPressed){
        if(key=='1'){
           c1 = 200+i;
           c2 = 90-i*2;
           c3 = 30+i*2;
        }
      }
    
    if(keyPressed){
        if(key=='2'){
           c1 = 165+i;
           c2 = 205-i*2;
           c3 = 35+i*2;
        }
      }
   
      strokeWeight(1);
      if(i%4==0){
        strokeWeight(3);
      }
      stroke(c1,c2,c3);
      line(1600-i*40,0,1143-i*40,800);
    }
    
  
  int circleDistX = 40;
  int circleDistY = 35; 
  int circleCount = width/circleDistX;

  for (int j = 0; j<=circleCount;j++) {
    for (int i = 0; i<=circleCount;i++) {
      
      int circleSize = 20; 

      int c1 = 25-i;
      int c2 = 260;
      int c3 = 205+i;
      
      if(keyPressed){
        if(key=='1'){
           c1 = 200+i;
           c2 = 90-i*2;
           c3 = 30+i*2;
        }
      }
      
      if(keyPressed){
        if(key=='2'){
           circleSize=int(sin(i/3.0)*20);
           c1 = 165+i;
           c2 = 205-i*2;
           c3 = 35+i*2;
        }
      }

  
      noFill();
      stroke(105,0,20);
      strokeWeight(1);
      if(i%4==0) {
       fill(c1,c2,c3);
       circleSize = 10;
      }
       if(i%3==0) {
       fill(c1,c2,c3);
       circleSize = 10;
      }
      ellipse(20+circleDistX*i, 35+circleDistY*2*j, circleSize, circleSize);
    }
  }

  
  for (int j = 0; j<=circleCount;j++) {
    for (int i = 0; i<=circleCount;i++) {
      
      int c1 = 25-i;
      int c2 = 260;
      int c3 = 205+i;
      
      if(keyPressed){
        if(key=='1'){
           c1 = 200+i;
           c2 = 90-i*2;
           c3 = 30+i*2;
        }
      }
      
      if(keyPressed){
        if(key=='2'){
           c1 = 165+i;
           c2 = 205-i*2;
           c3 = 35+i*2;
        }
      }
      
      int circleSize = 20; 

      fill(105,0,20);
      noStroke();
         
      int circleSize2 =int( dist(mouseX,mouseY,circleSize*i,circleSize*j))/20;

      if(i%4==0){
        circleSize2=30;
        fill(c1,c2,c3);
      }
      ellipse(circleDistX*i, 70+circleDistY*2*j, circleSize2/2, circleSize2/2);
    }
  }
  
}
