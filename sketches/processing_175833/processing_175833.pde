
Line[] lines;

void setup(){
  size(600,600,P3D);
  smooth();
  noFill();
  
  lines = new Line[8];
  
  for (int i=0; i< lines.length; i++){
    lines[i] = new Line();
  }
}

void draw(){

  background(0);
  stroke(255);
  
  //if(mousePressed){
    translate(50,0);
    rotateY(PI/3);
  //}
  
  translate(width/2,height/2);
  for(Line line: lines){
    rotate(TWO_PI/lines.length);
    line.display();
  }
}
class Line {
  float a;
  int n;
  float h;
  float p;
  PVector pos;
  float rota;
  float rany;
  
  Line(){
    a = random(TWO_PI);
    h = random(30,100);
    p = random(.1, .9);
    n = (int)random(3,7);
    pos = new PVector(random(-40,40),0);
    rany = random(0,500);
    
    
  }
  
  void display(){
    pushMatrix();
//    translate(600+pos.x,0);
//    translate(map(mouseX,0,500,0,100), map(mouseY,0,500,0,100));
//    rotate(PI/rany);

    translate(map(sin(a),-1,1,0,10), map(cos(a),-1,1,0,10));
    
    float x, y, z;
    for(int i = 0; i< n; i++){
      y = 20*i;
      x = sin(y/h+a)*i*p*5;
      z = cos(y/h+a)*i*p*5;
      
      float rad = map(i, 0, n, 30, 4);
      stroke(rad*2, y, y*4, 80);
      
      pushMatrix();
      translate(x,y,z);
      sphere(rad);
      popMatrix();
      
    }
    
    if(mousePressed){
      n++;
    }
    
    a -= .08;
    popMatrix();
  }
    
}


