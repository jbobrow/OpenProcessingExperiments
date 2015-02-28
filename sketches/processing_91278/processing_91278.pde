
int count =0; 
void setup(){
  size(1000, 500);
  background(0);

}

void draw(){
  int b = abs(mouseX-pmouseX);
  int a;
  int x;
  stroke(0,255,0);
  if(b==0){
    a=0;
    x=0;
  }else if(b<20){
    a=(int)random(50);
    x=(int)random(50);
  }else if(b<40){
    a=(int)random(50,100);
    x=(int)random(50,100);
  }else{
    a=(int)random(100, 200);
    x=(int)random(100, 200);
  }

  if(count>=1000){
    line(count, 300, count+5, 300-a);
    line(count+5, 300-a, count+10, 300+x);
    line(count+10, 300+x, count+15, 300);
    background(0);
    count=0;
    
  }else{
    line(count, 300, count+5, 300-a);
    line(count+5, 300-a, count+10, 300+x);
    line(count+10, 300+x, count+15, 300);
    count=count+15;
  }
  

}




