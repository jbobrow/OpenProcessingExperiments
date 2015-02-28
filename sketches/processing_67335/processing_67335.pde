
int[] time= new int[5];

void setup(){

size(500,500);
colorMode(3);
noStroke();
smooth();
}


void draw(){
int[]time={minute()*4,minute()*2,second()*5,second()*3,second()*2};

for(int i=0;i<5;i++){
  
fill(time[i],width,width);
ellipse(width/2,width/2+i,width/(i+0.3),width/(i+0.3));}}

