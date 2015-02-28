
Miguel mike;
int x;

void setup(){
  
  size(800,600);
background(255);
smooth();

frameRate(10);
mike=new Miguel(random(width),random(height),random(50,50));

}
void draw(){

  //loop para desenhar objectos//
background(255);

mike.desenho();

}
//for(int i=0,i<100,i=i+1);

//mike

class Miguel{
  
 float x1,y1;
 float largura;
 //cordenadas centro do miguel
 
 //funçao construtora
 Miguel(float t_x1,float t_y1,float t_largura){
   
   x1=t_x1;
   y1=t_y1;
   largura=t_largura;
   }
   
   //funçao de desenho//
   
   void desenho(){
   
 for(int i=0; i<10; i++){
   float W=random(width);
   float H=random(height);
   float T=random(10,50);
strokeWeight(random(5,25));
stroke (random(0),random(255),random(255));
line((mouseX),(mouseY),W,H);
     
     fill(random(0),random(255),random(255));
     ellipse(W,H,T,T);
     ellipse((mouseX),(mouseY),T,T);
     
    }
    
   }}
