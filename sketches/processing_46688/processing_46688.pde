
sand[] grains;
int numGrains = 128;
int wid=128,hei=128,dep=128;
float zoom = 3;
boolean[][][] testMap;
int minimum = hei;
int maximum = 0;
float azimuth = 0;
float elevation = 0;
void setup(){
  size(640,480,P3D);
  ortho();
  stroke(255);
  strokeWeight(3);
  textMode(SCREEN);
  textFont(createFont("Calibri",18));
  textAlign(CENTER);
}
void initSand(){
  grains = new sand[numGrains];
  testMap = new boolean[wid][hei][dep];
  int count = 0;
  while(count<numGrains){
    int[] newLoc = {round(random(0,wid-1)),
                    round(random(0,hei-1)),
                    round(random(0,dep-1))};
    if(testMap[newLoc[0]][newLoc[1]][newLoc[2]]==false){
      grains[count] = new sand(newLoc);
      count++;
    }
  }
}
void addSand(int[] newLoc){
  if(testMap[newLoc[0]][newLoc[1]][newLoc[2]]==false){
    grains = (sand[]) append(grains,new sand(newLoc));
  }
}
void removeSand(int[] loc){
  if(testMap[loc[0]][loc[1]][loc[2]]==true){
    for(int i=0;i<grains.length;i++){
      if(grains[i].isInTheSamePlaceAs(loc)){
        grains[i].dead = true;
      }
    }
  }
}
void draw(){
  if(frameCount%60==0){println(frameRate);}
  if(frameCount==1){
    background(0);
    text("loading...",width/2,height/2);
  }else if(frameCount==2){
    initSand();
  }else{
    if(mousePressed){
      float mx = mouseX-width/2;
      float my = mouseY-height/2;
      float mRad = width/(zoom*wid)*mag(mx,my);
      float mAngle = atan2(my,mx);
      mAngle += azimuth;
      mx = mRad*cos(mAngle);
      my = mRad*sin(mAngle);
      int[] mouseLoc = {round(map(mx,-width/2,width/2,0,wid-1)),
        round(map(my,-width/2,width/2,0,hei-1)),dep/2};
      if(mouseButton==RIGHT){mouseLoc[2]=2;}
      for(int i=0;i<125;i++){
        int[] newLoc = {mouseLoc[0],mouseLoc[1],mouseLoc[2]};
        for(int j=0;j<3;j++){
          newLoc[j]+=round(random(-2.5,2.5));
        }
        if(outOfBounds(newLoc)==false){
          if(mouseButton==RIGHT){removeSand(newLoc);
          }else if(mouseButton==LEFT){addSand(newLoc);}
        }
      }
    }
    update();
    background(0);
    translate(width,height);
    if(mousePressed==false){
      elevation = -PI/4-(1f*mouseY-height/2)/(height/2)*PI/4;
      azimuth = (1f*mouseX-width/2)/(width/2)*PI/2;
    }
    rotateX(elevation);
    rotateY(azimuth);
    rotateX(PI/2);
    scale(zoom);
    translate(-wid/2,-hei/2,-dep/4);
    int[] ks = new int[hei*wid];
    for(int j=0;j<hei;j++){
      for(int i=0;i<wid;i++){
        int k=dep-1;
        boolean found = false;
        while(k>=0&&found==false){
          if(testMap[i][j][k]){
            stroke(constrain(map(k+1
              ,minimum,maximum,16,255),16,255));
            point(i,j,k);
            ks[j*wid+i]=k;
            found = true;
          }
          k--;
        }
      }
    }
    minimum = min(ks);
    maximum = max(ks);
    stroke(128);
    for(int i=0;i<=wid;i+=wid){
      for(int j=0;j<=hei;j+=hei){
        line(i,j,0,i,j,maximum);
      }
    }
    for(int i=0;i<=wid;i+=wid){
      line(i,0,0,i,hei,0);
    }
    for(int j=0;j<=hei;j+=hei){
      line(0,j,0,wid,j,0);
    }
  }
}
void update(){
  int alive = 0;
  for(int i=0;i<grains.length;i++){
    int[] newLoc = grains[i].offsetLoc();
    if(grains[i].dead==false){alive++;}
    if(outOfBounds(newLoc)==false&&
      testMap[newLoc[0]][newLoc[1]][newLoc[2]]==false){
      testMap[grains[i].location[0]]
             [grains[i].location[1]]
             [grains[i].location[2]]=false;
      grains[i].location = newLoc;
      testMap[grains[i].location[0]]
             [grains[i].location[1]]
             [grains[i].location[2]]=true;
    }
  }
  sand[] liveGrains = new sand[alive];
  int count = 0;
  for(int i=0;i<grains.length;i++){
    if(grains[i].dead){
      testMap[grains[i].location[0]]
             [grains[i].location[1]]
             [grains[i].location[2]]=false;
    }else{
      liveGrains[count] = grains[i];
      count++;
    }
  }
  grains = liveGrains;
}
class sand{
  int[] location;
  boolean dead = false;
  sand(int[] loc){
    location = loc;
    testMap[location[0]][location[1]][location[2]]=true;
  }
  int[] offsetLoc(){
    int[] offsetLoc = {location[0],location[1],location[2]};
    if(location[2]-1>=0){
      offsetLoc[0]+=round(random(-1.5,1.5));
      offsetLoc[1]+=round(random(-1.5,1.5));
      offsetLoc[2]--;
    }
    return offsetLoc;
  }
  boolean isInTheSamePlaceAs(int[] loc){
    boolean val = true;
    if(location[0]!=loc[0]){val=false;}
    if(location[1]!=loc[1]){val=false;}
    if(location[2]!=loc[2]){val=false;}
    return val;
  }
}
boolean outOfBounds(int[] loc){
  boolean val = false;
  if(loc[0]<0){val=true;}
  if(loc[1]<0){val=true;}
  if(loc[2]<0){val=true;}
  if(loc[0]>=wid){val=true;}
  if(loc[1]>=hei){val=true;}
  if(loc[2]>=dep){val=true;}
  
  return val;
}
void keyPressed(){
  if(key==' '){
    initSand();
  }
}

