
void setup(){ 
size(600,600); 
background(0); 
noSmooth();
drawwhitepoint();
drawcircle();
drawcross();
} 
void drawwhitepoint(){
  stroke(255);
  for(int i=0;i<30;i++){
    for(int p=0;p<30;p++){
      int r=int(random(2));
      if(r==1){        
        point(20*i,20*p);
      }
    }
  }
}
void drawcircle(){
  noFill();
  for(int i=1;i<550;i++){
    int r=int(random(256));
    int g=int(random(256));
    int b=int(random(256));
    stroke(r,g,b);
    ellipse(300,300,i,i);
    }
}
void drawcross(){
  fill(255,0,0);
  noStroke();
  translate(300,300);
  rotate(PI/4);
  ellipse(0,0,840,20);
  rotate(PI/2);
  ellipse(0,0,840,20);
}



