
                float num=0;
int speed=1;
  
float num2=0;
int speed2=3;
  
void setup() {
  size (400, 400);
  fill(225,225,90,2);
  background(255,90,100);
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
    speed=4;
    
    {
       rect(num2, num2, 150, 130);
    fill (180, 90, 130, 240);
    if (num2>400){
      speed2=-3;
    }
    if (num2<0)
    speed2=3;
    }
      {
       rect(num2, num2, 20, 30);
    fill (60, 90, 40, 55);
    if (num2>300){
      speed2=-3;
    }
    if (num2<0)
    speed2=3;
    }
  }
    {
       rect(num2, num2, 100, 130);
    fill (180, 90, 240, 25);
    if (num2>400){
      speed2=-10;
    }
    if (num2<0)
    speed2=5;
    }
    
      {
       rect(num2, num2, 50, 130);
    fill (80, 290, 340, 55);
    if (num2>400){
      speed2=-7;
    }
    if (num2<0)
    speed2=1;
    }
     
}
                
