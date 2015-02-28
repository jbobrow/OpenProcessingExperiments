
int count = 0;
void setup(){
  size(500,500);
  background(0);
}

void draw(){
if(count% 15 ==0){
  background(0);
  int xCount = 0;
while(xCount<520){
  int yCount = 0;
  float frequency = .3;
  int i = (int)(random(50)); 
  while(yCount<520&& i<32){
   float red   = (float)(Math.sin(frequency*i + 0) * 127 + 128);
   float green = (float)(Math.sin(frequency*i + 2) * 127 + 128);
   float blue  = (float)(Math.sin(frequency*i + 4) * 127 + 128);
   stroke(red,green,blue);
   int test= (int)(random(10));
if(test%3==0){
noFill();
}
else{
  fill(red,green,blue);
}
   ellipse(xCount,yCount,20,20);
yCount= yCount+20;
i++;
  }
xCount= xCount+20;
}
count++;
}
else{
count++;
}
}
