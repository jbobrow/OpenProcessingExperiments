
/*
 *
 *  CREEPY PAINT by kof 2012
 *
 */

String filename ="out.png";

PImage input;
int X[] = {-1,0,1,-1,1,-1,0,1};
int Y[] = {-1,-1,-1,0,0,1,1,1};
int R = 1;
PGraphics msk[];

PGraphics complete;

float tresh = 5;
int NUM = 2000;
ArrayList seekers;

void setup(){


  input = loadImage(filename);

  input.loadPixels();

  size(700,1059,P2D);


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
  background(0);

  //complete.filter(INVERT);
}



void draw(){

  // image(complete,0,0);

  for(int i = 0 ; i < seekers.size();i++){
    Seeker s = (Seeker)seekers.get(i);
    s.draw();

  }

}



class Seeker{

  PVector pos,dir;
  int P = 30;
  int LIFETIME;
float area;

  Seeker(){
    restart();
  }

  void restart(){
    pos = new PVector(random(width),random(height));
    dir =new PVector(0,0);
    LIFETIME = (int)random(40,150);
    area = random(30,120);
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

      for(float i = 0; i < 1.0;i+=0.1){

        int xx = (int)lerp(pos.x,pos.x+dirs[smer].x,i);
        int yy = (int)lerp(pos.y,pos.y+dirs[smer].y,i);

        xx = constrain(xx,0,width-1);
        yy = constrain(yy,0,height-1);

        int idx = yy*width+xx;

        float b = brightness(complete.pixels[idx]);

        if(b>tresh)
          predict[smer]+=b;

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

    color c = input.pixels[(int)pos.y*input.width+(int)pos.x];



    PVector dest = dirs[id];
    dest.normalize();
    dir.add(dest);
    stroke(c,maxval/2.0);
    line(pos.x,pos.y,pos.x+dir.x,pos.y+dir.y);

    dir.limit(0.3);
    pos.add(dir);


    if(frameCount%LIFETIME==0)
      restart();


  }

}

