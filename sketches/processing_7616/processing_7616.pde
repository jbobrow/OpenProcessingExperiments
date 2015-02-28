
//import processing.video.*;
//MovieMaker mm;
int num = 300;
float[][] pos = new float[num][2];
float[][] upPos = new float[num][2];
float t;
boolean filterBlur = false;
void setup(){
  frameRate(20);
  background(0);
  size(400,300,P2D);
  noCursor();

 // mm = new MovieMaker(this,width,height, "vortex.mov",30,MovieMaker.H263, MovieMaker.BEST);
  for(int i = 0; i<num; i++){
    float x = 2*PI;
    float y = 2*PI;
    pos[i][0] = noise(width);
    pos[i][1] = random(height);
    upPos[i][0] = sin(-x*tan(y));
    upPos[i][1] = cos(-y*tan(x));
  }
}
  
  void draw(){
    
    if(filterBlur == true){
          filter(BLUR,1);
     }
    
    color a =(int) map(mouseX,0,width,500,150);
    color b =(int) map(mouseY,0,height,100,500);
   // color c =(int) map(mouseY,height,0,250,300);
    colorMode(HSB,a,b,10,300);

    fill(0,3);
    noStroke();
    rect(0,0,width,height);
    t+=.001;
    translate(width/2,height/2);
    for(int i = 0; i<num; i++){
      rotate(radians(t+50)*2);
      pos[i][0] += upPos[i][0];
      pos[i][1] += upPos[i][1];
      for(int j = 0; j<num; j++){
        float distance = dist(pos[i][0],pos[i][1],pos[j][0],pos[j][1]);
        if (distance < 1){
          strokeWeight(1);
          stroke(200,200,220,4);
          noFill();
          
          beginShape();
            vertex(pos[i][0],pos[i][1]);
            bezierVertex(pos[i][0],pos[i][1],0,0,pos[i][1],pos[i][1]);
          endShape();
          
        }
      }
      
    if(pos[i][0] < -num+100){
        pos[i][0] = +num;
      }
      if(pos[i][0] > +num){
        pos[i][0] = -num+100;
      }
      if(pos[i][1] < -num+100){
        pos[i][1] = +num;
      }
      if(pos[i][1] > +num){
        pos[i][1] = -num+100;
      }
    }
    
   // mm.addFrame();

  }
void mousePressed(){
  filterBlur = !filterBlur;
}



