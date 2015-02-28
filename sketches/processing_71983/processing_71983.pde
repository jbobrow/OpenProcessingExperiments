

void setup(){
  size(600,600);
  //smooth(8);
  
  
}

void draw(){
  background(0);
  smooth();
  int a=width/2;
  int b=height/2;
  //Makes concentric circles
  for(int r=595;r>20;r=r-50){
    fill(44,117,255);
    stroke(0);
    strokeWeight(3);
    ellipse(a,b,r,r);
  }
  //Makes lines 
  for(int c=0;c<601;c=c+50){
  stroke(255);
  strokeWeight(3);
  line (a,b,c,0);
  line (a,b,0,c);
  line (a,b,c,600);
  line (a,b,600,c);
  }
  //Makes triangles
  fill (0);
  stroke (255);
  strokeWeight(4);
  triangle (a,b,a, 0,200,200);
  triangle (a,b,a, 0,400,200);
  triangle (a,b,a, height,200, 400);
  triangle (a,b,a, height,400,400); 
  triangle (a,b,0,b, 100, 200);
  triangle (a,b,0,b, 100, 400);
  triangle (a,b,width,b,500,200);
  triangle (a,b,width,b,500,400);
  
}


