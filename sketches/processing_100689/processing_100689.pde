
int a;
int b;
int amax;
int bmax;
double ah;
double bh;
int temp;

void setup(){
  size(600,600);
  a = (int)random(0,600);
  b = (int)random(0,600);
  amax = a;
  bmax = b;
  textSize(16);
}

void draw(){
   if(a != b){
     if(a > b){
       a = a-b;
     } else{
       b = b-a;
     }
       background(0,0,0);

     fill(255, 0, 0);
     rect(100, 100, 200, a);
     fill(0,0,255);
     rect(300, 100, 200, b);
     fill(255, 255, 255);
     text(a + "", 100, 100);
     text(b+ "",300, 100);
     for(int i = 0; i < 100000000; i++){
       i++;
       i--;
     }
   } else{
     text("GCD of " + amax + " and " + bmax + " is "+a+"", 200,50);
   }
}

