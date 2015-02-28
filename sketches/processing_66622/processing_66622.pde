

int []arrayPosX;
int []arrayPosY;

//float x3=15;
//float s1=0.5;//zengjialiang
//float s2=0.5;
//float s3=0.5;

void setup(){
  size(500,500);
arrayPosX=new int[3];
arrayPosY=new int[3];
arrayPosX[0]=20;
arrayPosX[1]=50;
arrayPosX[2]=100;
arrayPosY[0]=20;
arrayPosY[1]=50;
arrayPosY[2]=100;

}


void draw(){
  background(255);

  for(int i=0; i<3; i++){
   if(mouseX>arrayPosX[i] && mouseX<arrayPosX[i]+50 && mouseY>arrayPosY[i] && mouseY< arrayPosY[i]+50){
  arrayPosX[i]++;
  arrayPosY[i]++;
  
   }  rect(arrayPosX[i],arrayPosY[i],50,50);
  }
}

