
float elip = 0.2;
float elip2 = 0.2;



//rebote
float parp = 0;
float parp_neg = 1;
//float par = 0.0;

 float ancho = 10;
 float alto = 25;


void setup(){
  size(700,500);
  background(0);
  frameRate(1000);
}

void draw(){
  
  float x = 0;
  float y = 0;
  color c = color(255, 255, 255);
  float a = 0;
 
  
  x = -10;
  while( x <= width){
  y = - 25;
    while(y <= height){
      
      y = y + 25;
      float color1 = elip;
      float color2 = elip2;
      
      fill(color1 - 255,color2 + 0,color1 - 255,elip2);
      stroke(ancho);
      rect(x,y,ancho,alto);
       }x = x + 10;
    }
  
  x = -10;
  while( x <= width){
  y = - 25;
    while(y <= height){
      
      y = y + 25;
      float color1 = abs(elip - x);
      float color2 = abs(elip - y);
      
      fill(25,200,200,color1);
      stroke(ancho);
      rect(x,y,ancho,alto);
       }x = x + 10;
    }
  
  zumbido();
  rebote();
}

void rebote(){
    elip2 = elip2 + parp_neg;
    elip = elip + parp_neg;
  if(elip > 700){
    parp_neg = -1;
  }
  if(elip < 0 ){
    parp_neg = 1;
   
  }}
  void zumbido(){
    if(mousePressed){
      ancho = random(7,13);
      alto = random(25,30);
    }
   }



