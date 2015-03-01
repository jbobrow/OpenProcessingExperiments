
nt posx=160,posy=455,mov=1; // ////variables enteras
int r=60;
int posx1=560,posy1=365,mov1=1;
void setup (){ ////// configuracion
  size(650,650);
  frameRate(110); //////cuadros por segundo
}
void draw(){ // ////dibuja
 background(255);
  color c = color(255, 129, 129);  // Define color 'c'
fill(c);  // Use color variable 'c' as fill color
noStroke(); 
  ellipse(posx,posy,2*r,2*r);
  color a = color(70, 60, 126);  // Define color 'c'
fill(a);  // Use color variable 'c' as fill color
noStroke();
  ellipse(posx-10,posy-10,7,5);/// ojo 1
  ellipse(posx+10,posy-10,7,5);/// ojo 2
  ellipse(posx,posy+13,20,5); /// boca
  ellipse(posx,posy,4,6);  //// nariz
  color e = color(150, 129, 129);  // Define color 'c'
fill(e);  // Use color variable 'c' as fill color
noStroke(); 
  ellipse(posx1,posy1,2*r,2*r);
  color b = color(70, 60, 126);  // Define color 'c'
fill(b);  // Use color variable 'c' as fill color
noStroke();
  ellipse(posx1-10,posy1-10,7,5);/// ojo 1
  ellipse(posx1+10,posy1-10,7,5);/// ojo 2
  ellipse(posx1,posy1+13,20,5); /// boca
  ellipse(posx1,posy1,4,6);  //// nariz
   
   
    if (mov==1){ //movimientos
      posx=posx+3;
      posy=posy-1;}
    if(mov==2){
      posx=posx-1;
      posy=posy-3;}
    if(mov==3){
      posx=posx-1;
      posy=posy+3;}
    if(mov==4){
      posx=posx+3;
      posy=posy+1;}
   
   //limites izquierdo
    if(posx<=r){
    if (mov==3){
    mov=4;}
    if(mov==2){
    mov=1;}}
  
   //limite superior
   if(posy<=r){
     if(mov==1){
     mov=4;}
     if(mov==2){
       mov=3;}}
   
   //limite inferior
   if(posy>=650-r){
     if(mov==4){
     mov=1;}
     if(mov==3){
     mov=2;}}
   
   //limite derecho
   if(posx>=650-r){
     if(mov==1){
      mov=2;}
     if(mov==4){
     mov=3;}}
     
     if (mov1==1){ //movimientos
      posx1=posx1+3;
      posy1=posy1-1;}
    if(mov1==2){
      posx1=posx1-1;
      posy1=posy1-3;}
    if(mov1==3){
      posx1=posx1-1;
      posy1=posy1+3;}
    if(mov1==4){
      posx1=posx1+3;
      posy1=posy1+1;}
   
   //limites izquierdo
    if(posx1<=r){
    if (mov1==3){
    mov1=4;}
    if(mov1==2){
    mov1=1;}}
  
   //limite superior
   if(posy1<=r){
     if(mov1==1){
     mov1=4;}
     if(mov1==2){
       mov1=3;}}
   
   //limite inferior
   if(posy1>=650-r){
     if(mov1==4){
     mov1=1;}
     if(mov1==3){
     mov1=2;}}
   
   //limite derecho
   if(posx1>=650-r){
     if(mov1==1){
      mov1=2;}
     if(mov1==4){
     mov1=3;}}
     
    ///limites choques
    float d = dist(posx, posy, posx1, posy1);
    if(d<=2*r){
    if((mov1==1)&&(mov==2)){
     mov1=2;
     mov=1;}
     if((mov1==2)&&(mov==1)){
     mov1=1;
     mov=2;}
     if((mov1==1)&&(mov==4)){
     mov1=4;
     mov=1;}
     if((mov1==4)&&(mov==1)){
     mov1=1;
     mov=4;}
     if((mov1==3)&&(mov==4)){
     mov1=4;
     mov=3;}
     if((mov1==4)&&(mov==3)){
     mov1=3;
     mov=4;}
     if((mov1==3)&&(mov==2)){
     mov1=2;
     mov=3;}
     if((mov1==4)&&(mov==2)){
     mov1=2;
     mov=4;}
     if((mov1==1)&&(mov==3)){
     mov1=3;
     mov=1;}
     if((mov1==3)&&(mov==1)){
     mov1=1;
     mov=3;}
     if((mov1==2)&&(mov==4)){
     mov1=4;
     mov=2;}
     if((mov1==4)&&(mov==2)){
     mov1=2;
     mov=4;}
     if((mov1==2)&&(mov==3)){
     mov1=3;
     mov=2;}
     if((mov1==4)&&(mov==2)){
     mov1=2;
     mov=4;}
     if((mov1==2)&&(mov==4)){
     mov1=4;
     mov=2;}
     if((mov1==3)&&(mov==2)){
     mov1=2;
     mov=3;}
     if((mov1==3)&&(mov==1)){
     mov1=1;
     mov=3;}
     if((mov1==1)&&(mov==3)){
     mov1=3;
     mov=1;}
      }
     
  }
      

