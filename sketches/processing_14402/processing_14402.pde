
           
                float num=0;
int speed=1;
 
float num2=0;
int speed2=3;
 
void setup() {
  size (400, 400);
  background(255);
}
  
void draw(){
  background(255);
  num=num+speed;
  num2=num2+speed2;
  {
    rect (num, num, 80, 50);
    fill (40, 170, 150, 125);
    if (num>400){
      speed=-1;
    }
    if (num<0)
    speed=1;
   
    {
       rect(num2, num2, 150, 130);
    fill (180, 90, 240, 255);
    if (num2>400){
      speed2=-3;
    }
    if (num2<0)
    speed2=3;
    }
  }
}

