
int myRandomNumber1;
int myRandomNumber2;
int myRandomNumber3;
int myRandomNumber4;
int myRandomNumber5;
int myRandomNumber6;
int myRandomNumber7;


void setup(){
size(300,600);
myRandomNumber1=(int)random(4000);
myRandomNumber2=(int)random(4000);
myRandomNumber3=(int)random(4000);
myRandomNumber4=(int)random(4000);
myRandomNumber5=(int)random(4000);
myRandomNumber6=(int)random(4000);
myRandomNumber7=(int)random(4000);

}

void draw(){
  background(0);
  
  text(myRandomNumber1,30,30);
  text(myRandomNumber2,30,50);
  text(myRandomNumber3,30,70);
  text(myRandomNumber4,30,90);
  text(myRandomNumber5,30,110);
  text(myRandomNumber6,30,130);
  text(myRandomNumber7,30,150);
}
                
                
