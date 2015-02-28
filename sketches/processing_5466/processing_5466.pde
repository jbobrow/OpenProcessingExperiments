
int[] blocks = new int[10];

int a; 
int b;
float c = 0;
float speed = .5;

void setup(){
  size(301,31);
  smooth();
}

void draw(){
  background(0);
  rect(a,0,30,30);
  c = c + speed;
  for(int i = 0; i < blocks.length; i++){
   if(c > i*10){
    a = i*30;
   }
   if(c > 100){
     c = 0;
   }
  }
}

