

void setup(){
size(1000,1000);
smooth();
frameRate(30);
}
void scene1(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.63,5.65);

}
void scene2(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.01,6.29);
}
void scene3(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.63,5.65);
}
void scene4(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.01,6.29);
}
void scene5(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.63,5.65);
}
void scene6(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.01,6.29);
}
void scene7(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.63,5.65);

}
void scene8(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.01,6.29);
}
void scene9(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.63,5.65);
}
void scene10(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.01,6.29);
}
void scene11(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.63,5.65);
}
void scene12(){
fill(255,255,0);
arc(mouseX,mouseY,300,300,.01,6.29);
}

void draw(){
  
background (1);

int m=millis();

if(m<2000){
  
  scene1();
  
} else if (m<4000){
  
  scene2();
  
}else if(m<6000){
  
  scene3();
}else if (m<8000){
  
  scene4();
}else if (m<10000){
  
   scene5();
  
}else if(m<12000){
  
  scene6();
}else if (m<14000){
  
  scene7();
}else if (m<16000){
  
   scene8();
  
}else if(m<18000){
  
  scene9();
}else if (m<20000){
  
  scene10();
}else if (m<22000){
  
   scene11();
  
}else if(m<24000){
  
  scene12();
}else if (m<26000){
  

  
   
}
}

