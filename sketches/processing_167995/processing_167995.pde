
void setup()
{
  size(1000,1000);
  background(255);
}

void draw(){
  
  fill(#F71905);
  rect(900,0,100,100);
  
  fill(#3B086F);
  rect(900,100,100,100);
  
  fill(#01431E);
  rect(900,200,100,100);
  
  fill(#105F04);
  rect(900,300,100,100);
  
  fill(#158167);
  rect(900,400,100,100);
  
  fill(#BACB04);
  rect(900,500,100,100);
  
  fill(#0E208E);
  rect(900,600,100,100);
  
  fill(#4B0493);
  rect(900,700,100,100);
  
  fill(#920493);
  rect(900,800,100,100);
  
 float b=random(255);
 float g=random(255);
 float r=random(255);
  fill(b,g,r);
  rect(900,900,100,100);
  
  if(mousePressed){
  line(pmouseX,pmouseY,mouseX,mouseY);}
  

if(mouseX>900 && mouseY<100){
  if(mousePressed){
    stroke(#F71905);}}
 
  else if(mouseX>900 && mouseY<200 && mouseY>100){
    if (mousePressed){
    stroke(#3B086F);}}
 
  else if(mouseX>900 && mouseY<300 && mouseY>100){
    if (mousePressed){
    stroke(#01431E);}}
 
   else if(mouseX>900 && mouseY<400 && mouseY>100){
    if (mousePressed){
    stroke(#105F04);}}
 
   else if(mouseX>900 && mouseY<500 && mouseY>100){
    if (mousePressed){
    stroke(#158167);}}
 
  else if(mouseX>900 && mouseY<600 && mouseY>100){
    if (mousePressed){
    stroke(#BACB04);}} 
  
   else if(mouseX>900 && mouseY<700 && mouseY>100){
    if (mousePressed){
    stroke(#0E208E);}}
  
  else if(mouseX>900 && mouseY<800 && mouseY>100){
    if (mousePressed){
    stroke(#4B0493);}} 
   
  else if(mouseX>900 && mouseY<900 && mouseY>100){
    if (mousePressed){
    stroke(#920493);}} 
   
  else if(mouseX>900 && mouseY<1000 && mouseY>100){
    if (mousePressed){
    stroke(b,g,r);}} 
}
