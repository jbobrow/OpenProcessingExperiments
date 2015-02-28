
int num=20;
float[]AngleX=new float[num];
float[]AngleY=new float[num];

void setup(){
  size(600,400,P3D);
  for(int i=0; i<num; i++){
    AngleX[i]=random(360);
    AngleY[i]=random(360);
  }
  smooth();
}

void draw(){
  background(255);
  translate(width/2,height/2);
  for(int i=0; i<num; i++){
    AngleX[i]+=1;
    AngleY[i]+=1;
    noFill();
    stroke(0,100);
    strokeWeight(2);
    rotateX(radians(AngleX[i]));
    rotateY(radians(AngleY[i]));
    ellipse(0,0,250,250);
  }
} 
    
  

