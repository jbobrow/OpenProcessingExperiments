
Monstre[] bob=new Monstre [50];

void setup() {

  size (800, 800);


  for (int i=0;i<bob.length;i++) {
    bob[i] = new Monstre(width/2, height/2);
  }
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0, 0, width, height);
  //background(255);

  for (int i=0;i<bob.length;i++) {
    bob[i].aff();
  }
}

class Monstre{
  
  float x;
  float y;
  //float wh;
  float vitx;
  float vity;
  float r, v, b;
  
  Monstre(float _x,float _y) {
    x= _x;
    y= _y;
    vitx=random(-3,3);
    vity=random(-3,3);
    r= random(255);
    v= random(255);
    b= random(255);
    //wh= random(3,60);
    

  }
  
  void aff() {
   
    fill(0,0,0);
    ellipse(x,y,random(3,7),random(3,7));
    
    x+=vitx;
    y+=vity;
    
    if(x>width) {
      vitx*=-1;
    }
  
    if(x<0) {
      vitx*=-1;
    }

    if(y>height) {
      vity*=-1;
    }
  
    if(y<0) {
      vity*=-1;
    }
    
  
  }

}


