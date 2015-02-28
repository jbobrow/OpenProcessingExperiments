
square[][] grid;
float[][] values;
int res=360;//360 = ровно 4 квадрата по вертикали(не выходит за экран) и 5,3 - по горизонтали (0,7 за экраном)
//int resH=640;            //540 = ровно 2 квадрата по вертикали(не выходит за экран) и 3,5 - по горизонтали (0,5 за экраном)
float scale;
float noiseScale;
float noiseChange;
int c, dc, inc;
int lx,ly;

void setup(){
  size(360,360);
  //size(560,560);
  frameRate(1111);
  scale=1.10f;//Увеличение масштаба рисунка квадрата
  background(0);
  noiseDetail(2+int(random(3.0)),0.5f);//(3+int(random(5.0)) - искривлённости в квадрате
  grid = new square[res][res];
  values = new float[res+1][res+1];
  noiseScale=random(50.0f,200.0f);
  noiseChange=random(50.0f,200.0f);
  c=dc=lx=ly=0;
  inc=20;
  for(int i=0;i<res+1;i++){
    for(int j=0;j<res+1;j++){
      values[i][j]=noise(i/noiseScale,j/noiseScale,0.0f);
    }
  }
  for(int i=0;i<res;i++){
    for(int j=0;j<res;j++){
      grid[i][j]=new square(values[i][j],values[i+1][j],values[i+1][j+1],values[i][j+1]);    
    }
  }
  stroke(250,230,230,55);
  //stroke(random(200,250),random(100,230),random(200,230),55);
  fill(255,0,0,55);
  //noFill();
}


void draw(){

  for(int i=0;i<res+1;i++){
    for(int j=0;j<res+1;j++){
      values[i][j]=noise((i+lx)/noiseScale,(j+ly)/noiseScale,c/noiseChange);
    }
  }
  for(int i=0;i<res;i++){
    for(int j=0;j<res;j++){
      grid[i][j].update(values[i][j],values[i+1][j],values[i+1][j+1],values[i][j+1]);

    }
  }
  for(int i=0;i<res;i++){
    for(int j=0;j<res;j++){
      grid[i][j].draw((i+lx)*scale,(j+ly)*scale,scale,0.5f);
    }
  }
  for(int i=0;i<res+1;i++){
    for(int j=0;j<res+1;j++){
      //values[i][j]=noise((i+lx)/noiseScale,(j+ly)/noiseScale,-c/noiseChange);//этот просто дублирует и отнимает время
    }
  }
  for(int i=0;i<res;i++){
    for(int j=0;j<res;j++){
     grid[i][j].update(values[i][j],values[i+1][j],values[i+1][j+1],values[i][j+1]);//Увеличивает оттенок от fill();

    }
  }
  ///////////////
  for(int i=0;i<res;i++){
    for(int j=0;j<res;j++){
     grid[i][j].update(values[i][j],values[i+1][j],values[i+1][j+1],values[i][j+1]);//Увеличивает оттенок от fill(), чем придаёт рельеф

    }
  }
  //////////////
  for(int i=0;i<res;i++){
    for(int j=0;j<res;j++){
      //grid[i][j].draw((i+lx)*scale,(j+ly)*scale,scale,0.5f);//Увеличивает интенсивность, контраст
    }
  }
  c++;
  if(c>dc+inc){

    lx+=res;
    if (lx>=width){
      lx=0;
      ly+=res;
      if(ly>=height){
        lx=0;
        ly=0;

        dc+=inc;
        inc=20;//=20 -в какой готовности картинка нам нужна в квадрате (чтобы не бегать по квадратам каждый раз)(20 - примерно один проход квадратов по экрану)
      }

    }
    c=dc;//Переход в следующий квадрат
  }




}

void mouseReleased(){
  background(0);
  noiseDetail(2+int(random(3.0)),0.5f);//(3+int(random(5.0)) - искривлённости
  noiseScale=random(50.0f,200.0f);
  noiseChange=random(50.0f,200.0f);
  grid = new square[res][res];
  values = new float[res+1][res+1];
  c=dc=lx=ly=0;
  inc=2;
  for(int i=0;i<res+1;i++){
    for(int j=0;j<res+1;j++){
      values[i][j]=noise(i/noiseScale,j/noiseScale,0.0f);
    }
  }
  for(int i=0;i<res;i++){
    for(int j=0;j<res;j++){
      grid[i][j]=new square(values[i][j],values[i+1][j],values[i+1][j+1],values[i][j+1]);    
    }
  }

}
class square{
  float[] v = new float[4];

  square(){
    for(int i=0;i<4;i++){
      v[i]=0.0f;
    }
  }

  square(float v0, float v1, float v2, float v3){
    v[0]=v0;
    v[1]=v1;
    v[2]=v2;
    v[3]=v3;  
  }

  int determineType(float treshold){
    int lv0,lv1,lv2,lv3;
    lv0=lv1=lv2=lv3=0;
    if (v[0]<=treshold) lv0=1;
    if (v[1]<=treshold) lv1=2;  
    if (v[2]<=treshold) lv2=4;
    if (v[3]<=treshold) lv3=8;
    return lv0+lv1+lv2+lv3;
  };

  void update(float v0, float v1, float v2, float v3){
    v[0]=v0;
    v[1]=v1;
    v[2]=v2;
    v[3]=v3;  
  }
  void draw(float offsetx, float offsety, float scale, float treshold){
    int type = determineType(treshold);
    beginShape(LINES);
    switch (type){
    case 0:
      break;
    case 1:

      vertex(offsetx,offsety+interpolate(v[0],v[3],treshold)*scale);
      vertex(offsetx+interpolate(v[0],v[1],treshold)*scale,offsety);
      break;
    case 2:
 
      vertex(offsetx+scale,offsety+interpolate(v[1],v[2],treshold)*scale);
      vertex(offsetx+interpolate(v[0],v[1],treshold)*scale,offsety);
      break;
    case 3:
 
      vertex(offsetx,offsety+interpolate(v[0],v[3],treshold)*scale);
      vertex(offsetx+scale,offsety+interpolate(v[1],v[2],treshold)*scale);

      break;
    case 4:

      vertex(offsetx+scale,offsety+interpolate(v[1],v[2],treshold)*scale);
      vertex(offsetx+interpolate(v[3],v[2],treshold)*scale,offsety+scale);
      break;
    case 5:

      vertex(offsetx,offsety+interpolate(v[0],v[3],treshold)*scale);
      vertex(offsetx+interpolate(v[0],v[1],treshold)*scale,offsety);
 
      vertex(offsetx+scale,offsety+interpolate(v[1],v[2],treshold)*scale);
      vertex(offsetx+interpolate(v[3],v[2],treshold)*scale,offsety+scale);
      break;
    case 6:
 
      vertex(offsetx+interpolate(v[0],v[1],treshold)*scale,offsety);
      vertex(offsetx+interpolate(v[3],v[2],treshold)*scale,offsety+scale);

      break;
    case 7:

      vertex(offsetx,offsety+interpolate(v[0],v[3],treshold)*scale);
      vertex(offsetx+interpolate(v[3],v[2],treshold)*scale,offsety+scale);

      break;
    case 8:
      vertex(offsetx,offsety+interpolate(v[0],v[3],treshold)*scale);
      vertex(offsetx+interpolate(v[3],v[2],treshold)*scale,offsety+scale);
      break;
    case 9:
      vertex(offsetx+interpolate(v[0],v[1],treshold)*scale,offsety);
      vertex(offsetx+interpolate(v[3],v[2],treshold)*scale,offsety+scale);
      break;
    case 10:
      vertex(offsetx+scale,offsety+interpolate(v[1],v[2],treshold)*scale);
      vertex(offsetx+interpolate(v[0],v[1],treshold)*scale,offsety);
      vertex(offsetx,offsety+interpolate(v[0],v[3],treshold)*scale);
      vertex(offsetx+interpolate(v[3],v[2],treshold)*scale,offsety+scale);
      break;
    case 11:
      vertex(offsetx+scale,offsety+interpolate(v[1],v[2],treshold)*scale);
      vertex(offsetx+interpolate(v[3],v[2],treshold)*scale,offsety+scale);
      break;
    case 12:
      vertex(offsetx,offsety+interpolate(v[0],v[3],treshold)*scale);
      vertex(offsetx+scale,offsety+interpolate(v[1],v[2],treshold)*scale);
      break;
    case 13:
      vertex(offsetx+scale,offsety+interpolate(v[1],v[2],treshold)*scale);
      vertex(offsetx+interpolate(v[0],v[1],treshold)*scale,offsety);
      break;
    case 14:
      vertex(offsetx,offsety+interpolate(v[0],v[3],treshold)*scale);
      vertex(offsetx+interpolate(v[0],v[1],treshold)*scale,offsety);
      break;
    case 15:
      break;
    default:
      break;


    }
    endShape();
  }

  float interpolate(float xi, float xj, float treshold){
    return( (treshold-xi)/(xj-xi));

  }
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
