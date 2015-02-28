
void setup(){
  size(600,600);
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
  //makes rectangles
  for (int x=0;x<(width/2);x++) {
    for (int y=0;y<(height*4);y++) {
      stroke(380, x, y, 255);
      fill(380, x*2, y*3, 80);
    }
  }
  rectMode(CENTER);
  for (int d=0;d<=600;d+=50) {
    rect(width/2, height/2, d, d);
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


