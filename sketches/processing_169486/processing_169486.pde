
boolean lapiz=true;
boolean goma=true;
boolean circ=true;
boolean fondo=true;
boolean linea=true;
int z=50;
int x=10;
int y=10;
int u=10;
int t=10;
float r,g,b;

void setup(){
size(1000,500);
background(255);
smooth();}

void draw(){
  stroke(0);
  strokeWeight(2);
  fill(#2DFA2F);
  rect(0,0,50,50);
  fill(#FA2DCE);
  rect(0,50,50,50);
  fill(#1EE1F5);
  rect(0,100,50,50);
  fill(#EDF51E);
  rect(0,150,50,50);
  fill(#F5301E);
  rect(0,200,50,50);
 
  if(lapiz==false){
    if(mousePressed){
      strokeWeight(1);
   line(pmouseX,pmouseY,mouseX,mouseY);}
      if(keyPressed){
        if(key=='e'){
          r=random(255);
          g=random(255);
          b=random(255);
          stroke(r,g,b);
          line(pmouseX,pmouseY,mouseX,mouseY);}}}
 
  if(goma==false){
    if(mousePressed){
      noStroke();
      fill(255);
      rect(mouseX,mouseY,z,z);}
      if(keyPressed){
        if(key=='a'){
          rect(mouseX,mouseY,z,z);
          z=z+10;}}}
  
  if(circ==false){
     if(mousePressed){
       r=random(255);
       g=random(255);
       b=random(255);
       noStroke();
       fill(r,g,b);
       ellipse(mouseX,mouseY,x,x);
        if(keyPressed){
          if(key=='c'){
            ellipse(mouseX,mouseY,x,x);
            x=x+5;}}
        if(keyPressed){
        if(key=='d'){
          ellipse(mouseX,mouseY,x,x);
            x=x-5;}}}}
            
  if(fondo==false){
    if(mousePressed){
      r=random(255);
      g=random(255);
      b=random(255);
      background(r,g,b);}}
  
  if(linea==false){
    if(mousePressed){
      stroke(0);
      fill(175);
      line(mouseX,mouseY,500,250);}
      if(keyPressed){
        if(key=='f'){
          r=random(255);
          g=random(255);
          b=random(255);
          stroke(r,g,b);
          line(mouseX,mouseY,500,250);}}
}}
   
void mousePressed(){
  if(mouseX<50 && mouseY<50){
    lapiz=!lapiz;}
  if(mouseX<50 && mouseY>50 && mouseY<100){
    goma=!goma;}
  if(mouseX<50 && mouseY>100 && mouseY<150){
    circ=!circ;}
  if(mouseX<50 && mouseY>150 && mouseY<200){
    fondo=!fondo;}
  if(mouseX<50 && mouseY>200 && mouseY<250){
    linea=!linea;}
 

}

