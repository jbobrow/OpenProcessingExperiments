
float[][]eColor=new float[4][11];  //color
float[][] speed = {{10,20,30,40,30,20,10,20,30,40,30},
                   {20,30,40,30,20,10,20,30,40,30,20}, 
                   {30,40,30,20,10,20,30,40,30,20,10}, 
                   {40,30,20,10,20,30,40,30,20,10,20}};  //speed

void setup() {  //setup
  size(500,150);
  background(255);
  smooth();
  noStroke();
  fill(0);
  rectMode(CENTER);
    for (int y= 0;y<4;y++){
      for (int x=0;x<11;x++){
        eColor[y][x] = 0;    //Color=black
      }
    }
}

void draw(){  //draw
  background(255);
  for (int y = 0; y < 4; y ++) {
     for (int x = 0; x < 11; x ++) {
      eColor[y][x] += speed[y][x];  //color change
      //color>255,or,color<0...
      if (eColor[y][x]>255||eColor[y][x]<0)speed[y][x] = -speed[y][x];
      fill(eColor[y][x]/2,eColor[y][x],eColor[y][x]*2,127);
      rect(x*50,y*50,50,50);
      fill(eColor[y][x],eColor[y][x]*2,eColor[y][x]/2,127);
      rect(x*50+50,y*50+50,50,50);    
      fill(eColor[y][x]/2,eColor[y][x],eColor[y][x]*2,127);
      rect(x*50+100,y*50+100,50,50);
      fill(eColor[y][x],eColor[y][x]*2,eColor[y][x]/2,127);
      rect(x*50+150,y*150+50,50,50);
    }
  }
}


