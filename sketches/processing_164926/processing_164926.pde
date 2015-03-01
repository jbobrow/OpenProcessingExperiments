
float raio=150;
float x,y;
float ang;
float rota=PI/360;
float adiciona=PI/360;

void setup(){
size(500,500);
frameRate(30);
background(0);
}

//background(255);
//for (ang=0;ang<=360;ang+=10){
 
void draw(){
//  background(255);
  translate(width/2,height/2);
  rotate(rota);
  //pushMatrix();
  float rad=radians(ang);
  x=raio*cos(rad);
  y=raio*sin(rad);
  strokeWeight(pow(x+y,2)/1000);
  stroke(133,random(122),random(100),random(34,250));
  point(x,y);
  strokeWeight((noise(1)*1.5));
  line(x,y,x+x,y+y);
  rota+=PI/360;
  ang+=noise(1)*width/2;
  raio-=1;
  ;
   
}

