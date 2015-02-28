
PImage bild;
int modi = 1;

void setup(){
size(700,407);
bild = loadImage("Tiger.jpg");
background(255);
frameRate(150);
smooth();
}

void draw(){

if(modi==1){ 
for(int i = 0; i<20;i++){
int x = int(random(0,width));
int y = int(random(0,height));
fill(bild.get(x,y),100);
noStroke();
stroke(bild.get(x,y));
ellipse(x,y,random(5,0),random(5,0));
}
}
if(modi==2){ 
  
for(int i = 0; i<20;i++){
int x = int(random(0,width));
int y = int(random(0,height));
color c = bild.get(x,y);
fill(c);
  
float value = brightness(c);  
fill(value);
noStroke();
ellipse(x,y,random(5,0),random(5,0));
  }
}

if(modi==3){ 
  
for(int i = 0; i<20;i++){
int x = int(random(0,width));
int y = int(random(0,height));
color c = bild.get(x,y);
fill(c);
  
float value = saturation(c);  
fill(value);
noStroke();
ellipse(x,y,random(5,0),random(5,0));
  }
}
}

void keyPressed(){

if(key=='1'){
modi = 1;

}

if(key=='2'){
 modi = 2;
}

if(key=='3'){
 modi = 3;
}
}


