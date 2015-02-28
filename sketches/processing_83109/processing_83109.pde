
PImage o;
int num=(int)random(15,30);
int i=0;
void setup(){
  frameRate(5);
  size(500,500);
  o=loadImage("tex.jpg");
}
void draw(){
  background(o);
  if(num%6==0 && num%4==0){
   fill(171,125,196);
  } 
  else if(num%6==0){
    fill(191,88,87);
  }
  else if(num%4==0){
    fill(94,170,175);
  }
  while(num<150){
    while(i<=num){
      if(num%3==0){
        circle();
      }
      else if(num%5==0){
        square();
      }
      else if(num%2==0){
        rectangle();
      }
      else{
        circle();
      }
      i++;
    }
    System.out.println("Number of shapes = "+num);
    i=0;
    num*=2;
  }
  num=(int)random(15,30);
}
void circle(){
  float s=random(0,50);
  ellipse(random(100,600),random(200,500),s,s);
}
void square(){
  float s=random(0,50);
  rect(random(50,400),random(50,400),s,s);
}
void rectangle(){
  float s=random(0,30);
  float u=random(30,100);
  rect(random(0,300),random(0,300),s,u);
}


