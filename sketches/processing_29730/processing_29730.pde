
float grados;
float angulo;


void setup(){
  size (600,600);
  smooth();
  grados = 90.0;
  angulo =0;
  
}
void draw(){
background (128);
noStroke();
angulo += 3;
buzo(width/2, height/2, 300,color(128,0,0), angulo );
  
}
void buzo (float buzoX,float buzoY,float buzoW,color miColor,float a){
//buzo

fill(miColor);
ellipse (buzoX, buzoY+ (buzoW/4), buzoW/2, buzoW/2);
rect (buzoX - (buzoW/8), buzoY- (buzoW/8)- (buzoW/11),buzoW/10,buzoW/4);

//circulo catalejo
ellipse (buzoX-(buzoW/8),buzoY -(buzoW/4),buzoW/5,buzoW/5);

//pupila buzo
fill (255);
 float xp= buzoX-(buzoW/8) + (cos(radians(a))* buzoW/16);
 float yp= buzoY-(buzoW/4) + (sin(radians(a))* buzoW/16);

ellipse (xp,yp,buzoX/16,buzoX/16);

//ellipse (buzoX-(buzoW/6),buzoY -(buzoW/4),buzoW/15,buzoW/15);




ellipse (buzoX+(buzoW/6),buzoY+(buzoW/4),buzoW/4,buzoW/4);
ellipse (buzoX-(buzoW/6),buzoY+(buzoW/4),buzoW/4,buzoW/4);
fill(0);
rect (buzoX+(buzoW/6),buzoY+(buzoW/6),buzoW/10,buzoW/10);
rect (buzoX-(buzoW/6),buzoY+(buzoW/6),buzoW/10,buzoW/10);

}

