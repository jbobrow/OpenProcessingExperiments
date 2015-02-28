
boolean button =false;
boolean button1 =false;
boolean button2 =false;
boolean button3 =false;


void setup(){
  size(700,500);
}

void draw(){
  background(0);
  fill(255);
  for(int x=50; x<600; x=x+40){
  for(int y=50; y<480; y=y+40){
  
  ellipse(x,y,20,20);
  
  }
  }
// If click the first rect, color is change.
  if (button){
   fill(random(255),random(255),random(255));
  }
  else{
   fill(255);
  }
   rect(650,50,20,20);
   for(int x=50; x<600; x=x+40){
   for(int y=50; y<480; y=y+40){
   ellipse(x,y,20,20);
  
  }
  }

if (button1){
   fill(255,10,10);
  }
  else{
   fill(255);
  }
   rect(650,150,20,20);
   for(int x=50; x<600; x=x+40){
   for(int y=50; y<480; y=y+40){
   ellipse(x,y,20,20);
  
  }
  }
  if (button2){
   fill(255,255,0);
  }
  else{
   fill(255);
  }
   rect(650,250,20,20);
   for(int x=50; x<600; x=x+40){
   for(int y=50; y<480; y=y+40){
   ellipse(x,y,20,20);
  
  }
  }
  if (button3){
   fill(random(255),random(255),random(255));
  }
  else{
   fill(255);
  }
   rect(650,350,20,20);
   for(int x=50; x<600; x=x+40){
   for(int y=50; y<480; y=y+40){
   ellipse(x,y,20,20);
  
  }
  }

}
  
  

void mousePressed(){
  if(mouseX > 650 && mouseX<670 && mouseY>50 && mouseY<70){
    button=!button;
  }
  if(mouseX > 650 && mouseX<670 && mouseY>150 && mouseY<170){
    button1=!button1;
  }
   if(mouseX > 650 && mouseX<670 && mouseY>250 && mouseY<270){
    button2=!button2;
  }
  if(mouseX > 650 && mouseX<670 && mouseY>350 && mouseY<370){
    button3=!button3;
  }
   
}
  

 
 


