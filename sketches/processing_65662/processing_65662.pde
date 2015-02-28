
int bs = 50;


void setup(){
 size(400,400); 
  smooth();
}

void draw(){
fill(255);
rect(0,0,width,height);
for (int x=0;x<width;x+=bs){
 line(x,0,x,height);
 line(0,x,width,x);
 int nowsectx2 = ((x/bs)*(bs))+bs;
  int nowsecty2 = (x/bs)*bs+bs/2;
  int nowsect2 = (nowsectx2/2+nowsecty2)/bs;
  int a =(nowsectx2/50)-1;
  int b = (nowsecty2/25)-1;
  
  fill(255,0,0);
  for (int y=0;y<width+bs+bs;y+=bs*2){
  if(a%2==1)rect(x,y,bs,bs);
  if(a%2==0)rect(x+(bs*2),y+bs,bs,bs);
  if(a%2==0)rect(x-(bs*2),y+bs,bs,bs);
  }
} 
fill(255,0,255);
  
  int nowsectx = ((mouseX/bs)*(bs))+bs;
  int nowsecty = (mouseY/bs)*bs+bs/2;
  int nowsect = (nowsectx/2+nowsecty)/bs;
   int a2 =(nowsectx/50)-1;
  int b2 = (nowsecty/25)-1;
  if(b2%4==0){
    if(a2%2==1)ellipse((mouseX/bs)*bs+bs/2,(mouseY/bs)*bs+bs/2,bs,bs);
  }
  if(b2%4!=0){
     if(a2%2==0)ellipse((mouseX/bs)*bs+bs/2,(mouseY/bs)*bs+bs/2,bs,bs);
  }
  
  
}
