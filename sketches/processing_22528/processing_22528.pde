
int ballcount = 500;
int ballsize = 100;
int ballspeed = 20;
float[]xspeed = new float[ballcount];
float[]yspeed = new float[ballcount];
float[]xpos = new float[ballcount];
float[]ypos = new float[ballcount];
float[]wdth = new float[ballcount];
float[]ht = new float[ballcount];

void setup(){
  size(1000,1000);
  background(0);
  
  for(int i=0; i<ballcount; i++){
    
    xspeed[i] = random(1, ballspeed);
    yspeed[i] = random(-ballspeed, ballspeed);
    
    wdth[i]= random(1, ballsize);
    ht[i]= wdth[i];
    
    xpos[i] = width/2+random(-width/3, width/3);
    ypos[i] = height/2+random(-height/3, height/3);
  }
  
  noStroke();
  frameRate(60);
}

void draw(){
  background(0);
  
  for (int i=0; i<ballcount; i++){
    
    ellipse(xpos[i],ypos[i],wdth[i],ht[i]);
    
    xpos[i]+=xspeed[i];
    ypos[i]+=yspeed[i];
    
    if (xpos[i]+wdth[i]/2>=width || xpos[i]<=wdth[i]/2){
      xspeed[i]*=-1;
    }
     if (ypos[i]+ht[i]/2>=height || ypos[i]<=ht[i]/2){
      yspeed[i]*=-1;
    }
  }
}


