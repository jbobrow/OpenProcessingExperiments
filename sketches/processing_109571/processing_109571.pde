
float minRect = 30;
int space = 2;
int rectSide = 20;
int[] row = new int[rectSide];

float rectW,rectH;

int colorH;
int rectNum;

int x,y;
int vacantSpace;

void setup(){
  size(640,640)
  frameRate(20);
  colorMode(HSB,100);
  noStroke();
  
  for(int i=0; i<rectSide; i++){
    row[i]=1;
  }
  colorH=0;
  rectNum=0;
  x=0;
  y=0;
  background(100);
  vacantSpace = 0;
}

void draw(){
  if(x==rectSide){
    x=0;
    y++;
  }
  if(y==rectSide){
    background(100);
    vacantSpace = 0;
    y=0;
    if(colorH < 100){
      colorH+=5;
    }else{
      colorH=0;
    }
  }
  
  
  if(vacantSpace==0){
    for(int j=x; j<rectSide; j++){
      if(row[j]==2){
        if(vacantSpace==0){
          row[j]=1;
          x++;
        }
        break;
      }else{
        vacantSpace++;
      }
    }
  }
  if(vacantSpace > 0){
    if(vacantSpace>=2 && x<rectSide){
      if(int(random(1,4)) == 2){
        rectW = 2*minRect+space;
        vacantSpace-=2;
      }else{
        rectW = minRect;
        vacantSpace--;
      }
    }else{
      rectW = minRect;
      vacantSpace--;
    }
    
    if(y < rectSide-1){
       if(int(random(1,4)) == 2){
        rectH = 2*minRect+space;
      }else{
        rectH = minRect;
      }
    }else{
      rectH = minRect;
    }
  
  
    fill(colorH,random(60,100),random(50,100));
    int roundMin = 3;
    int roundMax = 15;
    rect(x*(space+minRect)+space,y*(space+minRect)+space,rectW,rectH,
    random(roundMin,roundMax),random(roundMin,roundMax),random(roundMin,roundMax),random(roundMin,roundMax));
  
    if(rectW == minRect && rectH == minRect){
      row[x]=1;
      x++;
    }else if(rectW == minRect && rectH != minRect){
      row[x]=2;
      x++;
    }else if(rectW != minRect && rectH == minRect){
      row[x]=1;
      row[x+1]=1;
      x+=2;
    }else if(rectW != minRect && rectH != minRect){
      row[x]=2;
      row[x+1]=2;
      x+=2;
    }
  }
  
}
