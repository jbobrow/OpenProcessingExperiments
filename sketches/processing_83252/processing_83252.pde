
int z;
int count;
int a=(int)random(15,31);
PImage picture;

void setup(){
size(575,426);
frameRate(1);
picture = loadImage("picture.jpg");

}
void draw(){
  background(picture);
  count=0;

  if (a%6==0){
    fill(255,0,0);
  }
  
  if (a%4==0){
    fill(0,0,255);
  }
  
  if (a%6==0 && a%4==0){
    fill(104,10,118);
  }
    
  if ((a%15==0) || (a%6==0) || (a%10==0)){
    while(count<=a){
      ellipse((int)random(470),(int)random(470),(int)random(150),(int)random(150));
      count=count+1;}
  }
  if (a%3==0){
    while(count<=a){
      int z=(int)random(150);
      ellipse((int)random(470),(int)random(470),z,z);
      count=count+1;}
   }
  
  if(a%5==0){
    while(count<=a){
      int z=(int)random(150);
      rect((int)random(470),(int)random(470),z,z);
      count=count+1;}
    }
  
  if(a%2==0){
    while(count<=a){
      rect((int)random(470),(int)random(470),(int)random(150),(int)random(150));
      count=count+1;}
     }
  textSize(70);
  text(a,480,75);
  a=a*2;
  if(a>=150){
    a=(int)random(15,31);
}
}



