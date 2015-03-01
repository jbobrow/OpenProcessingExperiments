
//Use Numbers 0-9



Mover[] m = new Mover[100];

void setup(){
  size(640,480);
  background(255,255,255);
  frameRate(60);
  for(int i=0; i<100; i++){
    m[i] = new Mover(int(random(width)),int(random(height)), int(random(7)+1));
  }
}
void draw(){
  if(key=='1'){
   if(mousePressed){
     fill(255,0,0);
     noStroke();
     ellipse(mouseX,mouseY,15,15);
   }
  }
  if(key=='2'){
    if(mousePressed){
    fill(255,128,0);
    noStroke();
    ellipse(mouseX,mouseY,15,15);
    }
  }
  if(key=='3'){
    if(mousePressed){
      fill(255,247,0);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
  if(key=='4'){
    if(mousePressed){
      fill(0,255,0);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
  if(key=='9'){
    if(mousePressed){
  fill(255,255,255);
  noStroke();
  ellipse(mouseX,mouseY,15,15);
    }
  }
    if(key=='5'){
    if(mousePressed){
      fill(0,0,255);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
      if(key=='6'){
    if(mousePressed){
      fill(255,0,255);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
      if(key=='0'){
        fill(random(255),random(255),random(255));
    ellipse(random(500),random(500),random(50),random(50));
      fill(random(255),random(255),random(255));
      rect(random(500),random(500),random(50),random(50));
    
    }
      if(key=='7'){
    if(mousePressed){
      fill(92,92,92);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
      if(key=='8'){
    if(mousePressed){
      fill(163,163,163);
      noStroke();
      ellipse(mouseX,mouseY,15,15);
    }
  }
  
 fill(0,0,0,40);
  rect(0,0,639,479);
  for (int i=0; i<100; i++){
    m[i].display();
  }
}

class Mover{
  //DATA
  int x;
  int y;
  int z;
  
  //CONSTRUCTOR
  Mover(int myx, int myy, int myz){
   x = myx;
   y = myy;
   z = myz;   
  }
  //FUNCTION
  void display(){
    if(x<0 || x>width){
    z *= -1;
    }
    if(mousePressed){
    if (mouseY-y<50&&mouseY-y>0&&mouseX-x>-50&&mouseX-x<50){
    y-=10;
    }
    if(mouseY-y>-50&&mouseY-y<0&&mouseX-x>-50&&mouseX-x<50){
      y+=10;
    }
    }
    if(y>height){
      y=(0);
    }
    if(y<0){
      y=(479);
    }
 x = x+z;
stroke (0,255,0);
fill(0,100,100);
ellipse(x, y, 15, 15);
}
}

