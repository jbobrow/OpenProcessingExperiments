
int num=10;
float[]AngleX=new float[num];
float[]AngleY=new float[num];

void setup(){
  size(600,400,P3D);
  for(int i=0; i<num; i++){
    AngleX[i]=random(360);
    AngleY[i]=random(360);
  }
  textAlign(CENTER);
  textSize(100);
}

void draw(){
  background(0);
  translate(width/2,height/2);
  for(int i=0; i<num; i++){
    AngleX[i]+=1;
    AngleY[i]+=1;
    fill(255,100);
    rotateX(radians(AngleX[i]));
    rotateY(radians(AngleY[i]));
    text("Eiichi",0,0);
  }
} 
    
  

