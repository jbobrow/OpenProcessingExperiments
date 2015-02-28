


void setup() {
  size(1400, 1000, P2D);
  //frameRate(30);

  int startx=0;
  int starty=0;
  int endx=0;
  int endy=height;
  
  int r = 125;
  float ri1=0;
  float ri2=0;
  float prev_ri1=0;
  float prev_ri2=0;

  noFill();
  background(0);
  
  stroke(0);
  strokeWeight(1);
  
  int w =r;
  
  for(int i=0; i <= width; i+=w){  
    prev_ri1 = ri1;
    prev_ri2 = ri2;
    
    ri1=random(-r,r);
    ri2=random(-r,r);
    strokeWeight(1);
    strokeCap(ROUND);
    smooth();
    
//    w = round(max(ri1,ri2,50));
    stroke(random(0,255),random(0,255),random(0,255));
    //bezier(startx+i, starty, startx+i + ri1, starty + ri2, endx+i + ri2, endy + ri1, endx +i , endy);
    
     if(i>1){
 
        int steps = 20;
        //for (float j = 0; j <= 1; j+=random(0.001,.015)) {
         for (float j = 0; j <= 1; j+=.003) {
          float t = j ;
          
          
          float x1 = bezierPoint(startx + i -w, startx + i -w + prev_ri1, endx + i -w + prev_ri2, endx + i -w, t);
          float y1 = bezierPoint(starty, starty + prev_ri2, endy + prev_ri1, endy, t);
          
          float x2 = bezierPoint(startx+i, startx+i + ri1, endx+i + ri2, endx +i, t);
          float y2 = bezierPoint(starty, starty + ri2, endy + ri1, endy, t);
          
          
          //red oragne and greens
          //stroke(random(j+i*1.0/width*50,255),random(j+50,200),random(j-20,50+i*1.0/width*50), 255);
          //pinks and purples
          stroke(random(j+i*1.0/width*50,255),random(j-20,50+i*1.0/width*50),random(j+50,200), 255);
          
          strokeWeight(3);
          bezierDetail(256);
          
          bezier(x1, y1, x1, y1+25*sin(j/2.0*PI), x2, y2+25*cos(1-j/2.0*PI), x2 , y2);
          
        } 
     }
  }
  
}

