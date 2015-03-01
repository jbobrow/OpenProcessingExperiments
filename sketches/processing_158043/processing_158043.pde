
nt r=20,mov1=1,mov2=1,mov3=1,mov4=1,mov5=1;
int posb1=50,posb2=150,posb3=250,posb4=350,posb5=450;
int posa1=50,posa2=50,posa3=50,posa4=50,posa5=50;
float posx2= random(0,130);
float posx3= random(250,380);

void setup(){ ////// configuracion
  size(500,500);
  frameRate(30); //////cuadros por segundo
}

void draw(){
  background(255);
    color c = color(255, 129, 129);  // Define color 'c'
fill(c);  // Use color variable 'c' as fill color
noStroke(); 
  ellipse(posb1,posa1,r,r);
  ellipse(posb2,posa2,r,r);
  ellipse(posb3,posa3,r,r);
  ellipse(posb4,posa4,r,r);
  ellipse(posb5,posa5,r,r);
  
 color d = color(50, 129, 129);
 fill(d);
 noStroke();
  rect(posx2, 300, 120, 10);
  rect(posx3, 300, 120, 10);
  
  
    if(mov1==1){ //movimientos pelotas
      posa1= posa1+5;}
    if(mov2==1){
      posa2= posa2+5;}
    if(mov3==1){
      posa3= posa3+5;}
    if(mov4==1){
     posa4= posa4+5; }
    if(mov5==1){
     posa5= posa5+5; }
    
    if(mov1==2){//movimiento estatico de pelota
    posa1=300;}
    if(mov2==2){
    posa2=300;}
     if(mov3==2){
    posa3=300;}
    if(mov4==2){
    posa4=300;}
    if(mov5==2){
    posa5=300;}
    
   if(posa1==300){///condicion para que se detengan las pelotas
   if((posb1>=posx2)&&(posb1<=posx2+120)){
  mov1=2; }}
   if(posa2==300){
if((posb2>=posx2)&&(posb2<=posx2+120)){
   mov2=2;}}
   if(posa3==300){
if((posb3>=posx2)&&(posb3<=posx2+120)){
   mov3=2;}}
   if(posa3==300){
if((posb3>=posx3)&&(posb3<=posx3+120)){
  mov3=2;}}
   if(posa4==300){
if((posb4>=posx3)&&(posb4<=posx3+120)){
   mov4=2;}}
   if(posa5==300){
if((posb5>=posx3)&&(posb5<=posx3+120)){
   mov5=2;}}
   
   if(posa1==500){//condiciones para que se vuelvan a mover los bolas
   r=20;mov1=1;mov2=1;mov3=1;mov4=1;mov5=1;
   posb1=50;posb2=150;posb3=250;posb4=350;posb5=450;
   posa1=50;posa2=50;posa3=50;posa4=50;posa5=50;
   posx2= random(0,130);posx3= random(250,380);}
   
   if(posa2==500){
   r=20;mov1=1;mov2=1;mov3=1;mov4=1;mov5=1;
   posb1=50;posb2=150;posb3=250;posb4=350;posb5=450;
   posa1=50;posa2=50;posa3=50;posa4=50;posa5=50;
   posx2= random(0,130);posx3= random(250,380);}
  
  if(posa3==500){
   r=20;mov1=1;mov2=1;mov3=1;mov4=1;mov5=1;
   posb1=50;posb2=150;posb3=250;posb4=350;posb5=450;
   posa1=50;posa2=50;posa3=50;posa4=50;posa5=50;
   posx2= random(0,130);posx3= random(250,380);}
  
  if(posa4==500){
   r=20;mov1=1;mov2=1;mov3=1;mov4=1;mov5=1;
   posb1=50;posb2=150;posb3=250;posb4=350;posb5=450;
   posa1=50;posa2=50;posa3=50;posa4=50;posa5=50;
   posx2= random(0,130);posx3= random(250,380);}
   
   if(posa5==500){
   r=20;mov1=1;mov2=1;mov3=1;mov4=1;mov5=1;
   posb1=50;posb2=150;posb3=250;posb4=350;posb5=450;
   posa1=50;posa2=50;posa3=50;posa4=50;posa5=50;
   posx2= random(0,130);posx3= random(250,380);}
}

