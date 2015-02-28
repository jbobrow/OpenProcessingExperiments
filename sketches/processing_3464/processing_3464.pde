
PImage a;

void setup(){
  size (500,400);
  a = loadImage ("6.jpg");
  fill(250,146,10);
}

void draw(){
  //*background(255,0,0);
  image (a,0,0);
  int d = mouseX/6;
  int e = 50; 
  for(int i=0;i<=width;i+=e){
    for(int j=0;j<=height;j+=e){        
      ellipse(i,j,d,d);
    
    }
  }
}



