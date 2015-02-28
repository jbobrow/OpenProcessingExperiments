
//David Escudero Moyano
int colorsombrero= color (0,0,0);
int colorcara= color (255,223,128);
int alturaboca= 70;
boolean llansador= false;
int alturadientes=10;

void setup(){
  size(300,300);
  background(255,255,255);
}
void draw(){
  fill(colorcara); //Color del circulo de la cara
  ellipse(150,150,180,250); //Circulo que forma la cara
    fill(colorsombrero);//color sombrero
  beginShape();//sombrero
  if(llansador== true){
    colorsombrero=color (random(0,255), random(0,255), random(0,255));
  }else{
    colorsombrero=color (0,0,0);
  }
  vertex(50,30);
  vertex(50,60);
  vertex(250,60);
  vertex(250,30);
  vertex(200,30);
  vertex(200,10);
  vertex(100,10);
  vertex(100,30);
  vertex(50,30);
  endShape();
    fill(255,255,255); //Color de circulos de ojos
  ellipse(120,120,random(20,30), random(20,10)); //Ojo Izquierdo
  line(100,90,135,105); //ceja izquierda
  ellipse(175,120,random(20,30), random(20,10)); //Ojo Derecho
  line(160,105,190,90); //ceja derecha
    fill (#BDB76B); //color de la pupila
  ellipse(120,120,10,10); //pupila izquierda
  ellipse(175,120,10,10); //pupila derecha
    fill (0,0,0);//color punto negro
    line(138,138,132,158);
    line(148,138,153,158);
  ellipse(120,120,4,4);//punto izquierdo
  ellipse(175,120,4,4);//punto derecho
  //nariz
  ellipse(135,160,random(5,8), random(5,8));
  ellipse(150,160,random(5,8), random(5,8));
  //Boca
  fill(255,74,50);
  arc(150, 200, 100, alturaboca, 0, PI, OPEN);
  if(llansador==true){
    alturaboca=0;
  }else{
    alturaboca=70;
  }
  //dientes
  fill(255,255,255);
  rect(104,200,10,alturadientes);
  rect(114,200,10,alturadientes);
  rect(124,200,10,alturadientes);
  rect(134,200,10,alturadientes);
  rect(144,200,10,alturadientes);
  rect(154,200,10,alturadientes);
  rect(164,200,10,alturadientes);
  rect(174,200,10,alturadientes);
  rect(184,200,10,alturadientes);
  if(alturaboca==0){
    alturadientes=0;}
    else{
    alturadientes=10;}
    fill (0,0,0);
    text ("Pulsa para ver mejor su enfado",10,288);
println(mouseX+", "+mouseY);
}
void mousePressed(){
  colorcara=color (224,4,48);
  llansador= true;
  
}
void mouseReleased(){
  colorsombrero=color (0,0,0);
  colorcara= color (255,223,128);
  llansador=false;
}


