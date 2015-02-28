
//moon and stars

int w = 255;
int h = 255;
int gap= 15;
void setup(){
  background(-1);
  size(256,256);
  smooth();
  for (int x =0;x<h;x++){
    stroke(0,0,255-x,255-x);
    line(0,x,w,x); 
  }
  
  
  for (int x =0;x<w;x++){
    
   stroke(-1,255-random(x));
   point(random(w),random(h/4));
  }
  fill(-1,228);
  noStroke();
  ellipse(random(w),random(h/4),30,30);
  translate(0,(h/2)-gap);

  beginShape();
  fill(1);
  noStroke();
  vertex(w,h/2);
  vertex(w,(h/2)+gap);
  vertex(0,(h/2)+gap);
  vertex(0,h/2);

  for (int x =0;x<w;x+=25){
    curveVertex(x,random((h/2)-(gap*2),(h/2)+gap/2)); 

  }
  endShape();
}
                
