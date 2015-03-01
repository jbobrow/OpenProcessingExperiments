
float[] avgSleep = new float[15];
float[] actSleep = new float [15];
float[] expSleep = new float [15];

void setup() {
  size(600, 600);
  for (int i = 0; i < avgSleep.length; i++ ) {
    avgSleep[i] = 6;
    expSleep[i] = 20;
  }
}

void draw(){
  background(255);
  float gap =0;
  noStroke();
  
  for(int i=0;i<actSleep.length;i++){
    float slp = random(0,10);
    actSleep[i] = slp;
    //avg sleeping
    fill(#00FF00,95);
    rect(i*40,height/2-avgSleep[i]*20,35, avgSleep[i]*20);
    
    //expecting sleeping
    fill(#FFD800,98);
    rect(i*40,height/2-expSleep[i]*10,40, expSleep[i]*10);
    
    //ACTUAL sleep
    fill(#E86850);
    rect(i*40,height/2-actSleep[i]*20,15, actSleep[i]*20);

    
    if(actSleep[i]>avgSleep[i]){
      gap = actSleep[i]-avgSleep[i];
      println(gap);
      fill(#587498);
      rect(i*40, height/2-gap*20,10,gap*20);
    }
    
    else{
      rectMode(CORNER);
      gap = avgSleep[i]-actSleep[i];
      //println(gap);
      fill(#587498);
      rect(i*40, height/2, 10,gap*20);
    }
  }
  noLoop();
}


