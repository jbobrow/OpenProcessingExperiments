
float angle= 0.0;
float offset = 300; 
float scalar= 30;
float incremento = 0.05;
float m= 50;
float n = -30;
float y2= -70;
int diam= 20;
float speed = 5;


void setup(){
  size (1000,600);
  background (75,133,230);
  strokeWeight (2);
}

void draw (){
  
  float x= offset + cos(angle)* scalar;
  float y = offset + sin(angle) *scalar;
 
  triangle(x,y,x+50,y+50,x+70,y-20);
  scalar ++;

  angle += incremento;
  
    ellipse(m,n,diam,diam);
  ellipse( m+ 50,y2,diam-10,diam-10);
    ellipse(m+100,n,diam,diam);
  ellipse( m+150,y2,diam-10,diam-10);
    ellipse(m+200,n,diam,diam);
  ellipse( m+250,y2,diam-10,diam-10);
   ellipse(m+300,n,diam,diam);
  ellipse( m+350,y2,diam-10,diam-10);
   ellipse(m+400,n,diam,diam);
  ellipse( m+450,y2,diam-10,diam-10);  
   ellipse(m+500,n,diam,diam);
  ellipse( m+550,y2,diam-10,diam-10);  
   ellipse(m+600,n,diam,diam);
  ellipse( m+650,y2,diam-10,diam-10);  
   ellipse(m+700,n,diam,diam);
  ellipse( m+750,y2,diam-10,diam-10);  
  ellipse(m+800,n,diam,diam);
  ellipse( m+850,y2,diam-10,diam-10); 
 ellipse(m+900,n,diam,diam);
  ellipse( m+950,y2,diam-10,diam-10);  
  ellipse(m+1000,n,diam,diam);
  
  fill (255,255,255,40);
  n++;
  y2= y2 + 1* speed;
  
  if (n > height + 20) {
    n=-50;
 } 
 if (y2 > height +15){
   y2= -70;
 }
  if (mousePressed){
   if (mouseButton== LEFT) {
     stroke (255,57,141);
}  

if(mouseButton==RIGHT){
  stroke (255,159,57);
  } 
} 

else{
stroke (116,56,124);

}
  
}
