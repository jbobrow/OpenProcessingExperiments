

void setup(){
  size(500,500);
  frameRate(6);
}
void draw(){
  int x=0;
  background(random(0,255),random(0,255),random(0,255));
  while(x<100){
    if(x%2==0){
      rectangle();
    }
    else if(x%5==0){
      square();
    }
    else{
      ellipse();
    }
    x++;
  }
}
void ellipse(){
  fill(255,255,0);
  ellipse(random(0,500),random(0,500),random(0,150),random(0,150));
}
void square(){
  fill(0,255,0);
  float r=random(0,150);
  rect(random(0,500),random(0,500),r,r);  
}
void rectangle(){
  fill(0,0,255);
  rect(random(0,500),random(0,500),random(0,90),random(0,140));
}
  
  


