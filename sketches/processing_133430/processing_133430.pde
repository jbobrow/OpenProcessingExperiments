

void setup(){
size(600,600);
background(255);
strokeWeight(0.2);
}
float a=0;
float b=0;

void draw(){
  if(mouseX<300){
a=map(mouseX,0,300,250,0);
}
if(mouseX>300){
a=map(mouseX,300,600,0,250);
}
if(mouseY<300){
  b=map(mouseY,0,300,250,0);
}
if(mouseY>300){
  b=map(mouseY,300,600,0,250);
}

  for(int i=0;i<600;i=i+20){
    for(int j=0;j<600;j=j+20){
fill(a,random(100,160),b,(a+b)/4);
stroke(a,random(100,160),b,(a+b)/4);
rect(i,j,20,20);
frameRate(20);
}
  }
}

