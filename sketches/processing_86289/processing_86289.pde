

void setup(){
   size(800,800);
 background(244,235,190);
  colorMode(HSB,360,100,100,100);

 smooth();

}



void draw(){
  if(mousePressed){
    colorMode(RGB,255,255,255);
    background(244,235,190);
   colorMode(HSB,360,100,100,100);
     for(int i = 0; i<=10; i++){
           int x = (int)random(800);
           int y = (int)random(800);
           float d = random (80,250);
           float s = d/80;
           int h= (int)random(0,100);
                  for (int t=0; t<=80; t+=2){
                      noFill();
                      strokeWeight(s);
                      stroke(h,80,80,t);
                      ellipse(x,y,d,d);
                      d-=2*s;
                              }
                                }
                                
        for(int i = 0; i<=13; i++){
           int x = (int)random(800);
           int y = (int)random(800);
           float d = random (100,300);
           float s = d/70;
           int h= (int)random(150,220);
                  for (int t=0; t<=70; t+=2){
                      noFill();
                      strokeWeight(s);
                      stroke(h,60,80,t);
                      ellipse(x,y,d,d);
                      d-=2*s;
                              }
                                }
                                
          for(int i = 0; i<=3; i++){
           int x = (int)random(800);
           int y = (int)random(800);
           float d = random (50,100);
           float s = d/60;
           int h= (int)random(250,330);
                  for (int t=0; t<=60; t+=2){
                      noFill();
                      strokeWeight(s);
                      stroke(h,90,100,t);
                      ellipse(x,y,d,d);
                      d-=2*s;
                              }
                }
  }
}


