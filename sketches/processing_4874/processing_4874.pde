

Bloc [][] Bloc;
float resolution = 10;
float xSize;
float ySize;
void setup(){

  size(400,400,P3D);
background(70);
  xSize= width/resolution;
  ySize= height/resolution;
  Bloc = new Bloc[int(resolution)][int(resolution)];
  for(int x=0;x<resolution;x++){
    for(int y=0;y<resolution;y++){
      float xoff = 0.0;
      float xincrement = random(-0.01,0.01);
      float nX=x*xSize;
      float nY=y*ySize;
      Bloc[x][y]= new Bloc(nX,nY,xoff,xincrement);
    }
  }
  rectMode(CENTER);
}




void draw(){
 translate(xSize/2,ySize/2);
  frame.setLocation(1920,160);
  for(int x=0;x<resolution;x++){
    for(int y=0;y<resolution;y++){
      Bloc[x][y].dessine();
    }
  }
}


class Bloc{
  float xoff;
  float xincrement ;
  float nX,nY;
  Bloc(float x,float y,float v, float inc){
    nX=x;
    nY=y;
    xoff = v;
    xincrement= inc;
  }
  float n(){
    xoff += xincrement;
    return noise(xoff)*255;
  }
  void dessine(){

    //fill(n(),50);
noFill();
   stroke(n(),10);
  
    rect(nX,nY,xSize+n(),ySize+n());
  
}

}





