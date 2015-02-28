
float[]xpoints = new float[4];
float[]ypoints = new float[4];
float[]xtarget = new float[4];
float[]ytarget = new float[4];
 
void setup(){
  size(600,600);
  background(255);
  fill(255,255,255,0);
  stroke(0,0,0,15);
  //initialize points and target
  for(int i=0; i<4; i++){
    xpoints[i] = 100 + i*30;//random(width);
    ypoints[i] = 100 + i*30;//random(height);
    xtarget[i] = 100 + i*30;//random(width);
    ytarget[i] = 100 + i*30;//random(height);
  }
}
 
void draw(){
  quadDrawer();
  quadCompare();
}
 
void quadDrawer(){
   quad(xpoints[0],ypoints[0],xpoints[1],ypoints[1],xpoints[2],ypoints[2],
     xpoints[3],ypoints[3]);
}
 
void quadCompare(){
  for(int i=0; i<4; i++){
    if(int(xpoints[i])<int(xtarget[i])){
      xpoints[i]+=1;
    }
    if(int(xpoints[i])>int(xtarget[i])){
      xpoints[i]-=1;
    }
    if(int(xpoints[i])==int(xtarget[i])){
      xtarget[i] = random(width);
    }
    if(int(ypoints[i])<int(ytarget[i])){
      ypoints[i]+=1;
    }
    if(int(ypoints[i])>int(ytarget[i])){
      ypoints[i]-=1;
    }
    if(int(ypoints[i])==int(ytarget[i])){
      ytarget[i] = random(height);
    }
  }
}
                                
