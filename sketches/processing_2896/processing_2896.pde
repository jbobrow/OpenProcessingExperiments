
float M,S,r,g,b,s,m,D;//mis float en setup
void setup(){
  M=0;//variable para noise 
  S=5;//variable para noise
  r=0;//Rojo
  g=0;//Verde
  b=0;//Azul
  s=second();//float para segundos
  m=millis();//float para milesimas
  D=-300;//variable de desplazamiento para sacar figuras del plano rapidamente
  size(400,400);
  background(m%255);
  smooth();
}




void draw(){

  M+=0.01;//aumenta la variable para el noise moderado
  S+=0.1;//aumenta la variable para el noise rapido
  r+=0.05;//comando para aumentar el Rojo en 0.05
  g+=0.2;//comando para aumentar  el Verde en 0.2
  b+=0.003;//comando para  aumentar el Azul en 0.003
  D+=300;//comando para aumentar el desplazador en 300
float R=noise(S);//noise rapido
float N=noise(M);//noise moderado
fill(#B2FFFE);
rect(D,0,400,115);//pinta el fondo de cielo
fill(#B26410);
noStroke();
ellipse(50,180+D,150,150);//montaña
ellipse(130,130+D,150,70);//montaña
ellipse(250,130+D,100,90);
rect(D,110,400,400);//tierra


  pushMatrix();
  noStroke();
  rotate(R%m);
  translate(S*2,0); 
  rotate(N);
  fill(10+r,10+g,7+b,160-R);
  ellipse(N*width/2,N*height,M/2,M/2);//pinta el pasto
  ellipse(N*width,N*height/2,M/4,M/4);
  popMatrix();
if(s>10){
pushMatrix();
  beginShape();{
fill(50*r,30-R);

  translate(S,M); 
 ellipse(R*300,N*1.1,M*2,M*2);//pintan las nubes
 
 ellipse(R*400,N*1.1,M*2,M*2);
 translate(S,M*4); 
 ellipse(R*400,N*1.1,M*2,M*2);
 ellipse(R*200,N*1.1,M*2,M*2);
 
 endShape();}
 popMatrix();
 
 beginShape();
 noStroke();
 fill(#B2FFFE);
 ellipse (0,0,215,215);
 fill(255,244-N*200,13);//fill de color variable y suave gracias a noise
 ellipse(0,0,N*250,N*250);//el sol
 fill(255,244-N*150,13);
 ellipse(0,0,N*50,N*50);//brillo central del sol
endShape();
  }}




