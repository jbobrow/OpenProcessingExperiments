
/**
Coded by Kof @ 
Mon Nov 18 18:15:27 CET 2013



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'

*/

boolean anim = false;

float EXPRESSIVE = 3.3;

String filename ="20111025_016h.jpg";

PImage input;
int X[] = {-1,0,1,-1,1,-1,0,1};
int Y[] = {-1,-1,-1,0,0,1,1,1};
int R = 1;
PGraphics msk[];

PGraphics complete;

float tresh = 45;
int NUM = 5000;
ArrayList seekers;

void setup(){


  noiseSeed(19);
  randomSeed(19);

  input = loadImage(filename);

  input.loadPixels();
  

  size(550,807,P2D);

  //size(input.width,input.height,P2D);


  smooth();
  
  msk = new PGraphics[X.length];

  for(int i = 0 ; i < msk.length;i++){
    msk[i] = createGraphics(input.width,input.height,P2D);
    msk[i].beginDraw();
    msk[i].image(input,0,0);
    msk[i].blend(msk[i],X[i]*R,Y[i]*R,width,height,0,0,width,height,DIFFERENCE);
    msk[i].filter(GRAY);
    msk[i].endDraw();
  }

  complete = createGraphics(input.width,input.height,P2D);
  complete.beginDraw();
  complete.background(0);
  for(int i = 0 ; i < msk.length;i++){
    complete.blend(msk[i],0,0,width,height,0,0,width,height,LIGHTEST);
  }
  complete.blend(complete,0,0,width,height,0,0,width,height,ADD);
  complete.endDraw();

  complete.loadPixels();

  seekers = new ArrayList();

  for(int i = 0 ; i < NUM;i++){

    seekers.add(new Seeker());
  }

  background(255);

  //complete.filter(INVERT);
}

int frcnt = 0;


void draw(){

  // image(complete,0,0);

  for(int i = 0 ; i < seekers.size();i++){
    Seeker s = (Seeker)seekers.get(i);
    s.draw();

  }



  if(frameCount%150==0 && anim){
    save("anim/"+nf(frcnt,5)+".jpg");
    frcnt++;
    fill(255,75);
    noStroke();
    rect(0,0,width,height);
  }
  /*
  pushStyle();
   
   fill(,-1);
    stroke(0,5);
    strokeWeight(random(10));
    rect(0,0,width,height);
        
    popStyle();
*/
 /* if(frameCount%10==0){
    blend(g,(int)random(-1,1),(int)random(-1,1),width,height,0,0,width,height,OVERLAY);
  }
*/  
     //tint(255,100);
     //image(g,random(-1,1),random(-1,1));
     //noTint();
     

  
}

void mousePressed(){
   background(255); 
}

/*
void keyPressed(){
  if(key==' '){
  save("out/"+filename.substring(0,filename.indexOf("."))+".jpg");
  exit();
  }
}
*/


class Seeker{

  PVector pos,dir;
  int P = 8;
  int LIFETIME;
  float area;

  Seeker(){
    restart();
  }

  void restart(){
    pos = new PVector(random(width),random(height));
    dir = new PVector(0,0);
    LIFETIME = (int)random(5,500);//(int)random(40,150);
    area = random(2,50);
  }

  void draw(){



    float [] predict = new float[P];
    PVector [] dirs = new PVector[P];
    for(int smer = 0 ;smer < predict.length;smer++){
      dirs[smer] = new PVector(random(-1,1),random(-1,1));
      dirs[smer].normalize();
      dirs[smer].mult(area);


      int cnt = 0;

      predict[smer] = 0;
      for(float i = 0; i < 1.0;i+=0.05){

        int xx = (int)lerp(pos.x,pos.x+dirs[smer].x,i);
        int yy = (int)lerp(pos.y,pos.y+dirs[smer].y,i);

        xx = constrain(xx,0,width-1);
        yy = constrain(yy,0,height-1);

        int idx = yy*width+xx;

        float b = brightness(complete.pixels[idx]);

        if(b>tresh)
          predict[smer] += b/4.0;

        cnt++;

      }
      for(float i = 0; i < 1.0;i+=0.05){

        int xx = (int)lerp(pos.x,pos.x+dirs[smer].x,i);
        int yy = (int)lerp(pos.y,pos.y+dirs[smer].y,i);

        xx = constrain(xx,1,width-1);
        yy = constrain(yy,1,height-1);

        int idx = yy*width+xx;

        float b = brightness(input.pixels[idx]);

        predict[smer]+=(255-b)/2.0;

        cnt++;

      }

      predict[smer] /= (float)cnt;


    }

    float maxval = 0;
    int id = 0;
    for(int smer = 0 ;smer < predict.length;smer++){

      if(maxval<predict[smer]){
        maxval = predict[smer];
        id = smer;
      }
    }

    pos.x = constrain(pos.x,0,width-1);
    pos.y = constrain(pos.y,0,height-1);

    color c = color(0);//color(brightness(input.pixels[(int)pos.y*input.width+(int)pos.x]));



    PVector dest = dirs[id];
    dest.normalize();
    dir.add(dest);
    stroke(c,maxval/4.0);
    PVector ddir = new PVector(cos(frameCount/100.0),sin(frameCount/100.0));
    dir.sub(ddir);
    dir.limit(noise(frameCount/10.0)*EXPRESSIVE);
    line(pos.x,pos.y,pos.x+dir.x,pos.y+dir.y);


    pos.add(dir);


    if(frameCount%LIFETIME==0)
      restart();


  }

}





