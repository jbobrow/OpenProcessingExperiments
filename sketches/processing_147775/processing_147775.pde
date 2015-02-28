
void setup(){
  size(640,480);
}
 void draw(){

 fill(0,15);  
rect( 0,0,width,height);

for ( int i =0;i < width;i++){
  color colorEntrada= color(random(100),random(150),random(255),random(255));
  
  Estrella(random(0,width),random(0,width),30,30,colorEntrada,i);
}
 }
  void Estrella(float x , float y , float ancho,float alto,color colorcito, int anillos){
    fill(colorcito);
   rect( x, y, ancho,  alto);
   noFill();
   strokeWeight(0.1);
  rect(x *2,y *2,ancho/2,alto/2);
  }
