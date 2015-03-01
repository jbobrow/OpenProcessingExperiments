
void setup(){
  size(500,500);
  background(255);
}

void draw(){
  
  fill(#F53457);
  rect(450,0,50,50);
  
  fill(#FA03FF);
  rect(450,50,50,50);
  
  fill(#2703FF);
  rect(450,100,50,50);
  
  fill(#03DBFF);
  rect(450,150,50,50);
  
  fill(#03FF4C);
  rect(450,200,50,50);
  
  fill(#FAFF03);
  rect(450,250,50,50);
  
  fill(#FF5303);
  rect(450,300,50,50);
  
  fill(#3C8601);
  rect(450,350,50,50);
  
  fill(#9C78AF);
  rect(450,400,50,50);
  
 float b=random(255);
 float g=random(255);
 float r=random(255);
  fill(b,g,r);
  rect(450,450,50,50);
  
  if(mousePressed){
  line(pmouseX,pmouseY,mouseX,mouseY);}
  

if(mouseX>450 && mouseY<50){
  if(mousePressed){
    stroke(#F53457);}}
 
  else if(mouseX>450 && mouseY<100 && mouseY>50){
    if (mousePressed){
    stroke(#FA03FF);}}
 
  else if(mouseX>450 && mouseY<150 && mouseY>50){
    if (mousePressed){
    stroke(#2703FF);}}
 
   else if(mouseX>450 && mouseY<200 && mouseY>50){
    if (mousePressed){
    stroke(#03DBFF);}}
 
   else if(mouseX>450 && mouseY<250 && mouseY>50){
    if (mousePressed){
    stroke(#03FF4C);}}
 
  else if(mouseX>450 && mouseY<300 && mouseY>50){
    if (mousePressed){
    stroke(#FAFF03);}} 
  
   else if(mouseX>450 && mouseY<350 && mouseY>50){
    if (mousePressed){
    stroke(#FF5303);}}
  
  else if(mouseX>450 && mouseY<400 && mouseY>50){
    if (mousePressed){
    stroke(#3C8601);}} 
   
  else if(mouseX>450 && mouseY<450 && mouseY>50){
    if (mousePressed){
    stroke(#9C78AF);}} 
   
  else if(mouseX>450 && mouseY<500 && mouseY>50){
    if (mousePressed){
    stroke(b,g,r);}} 
}
