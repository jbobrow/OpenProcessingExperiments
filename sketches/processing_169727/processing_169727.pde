
float mouseX=0;
float mouseY=0;

void setup(){
 size(300,300);
 frameRate(10);
 noCursor();//quitamos cursor 
}
void draw(){
  background(40,188,177);
 
  mouseX=random(0,width); //definimos el mouse como random
  mouseY=random(0,height);
  
 for(int i=0; i<width; i+=7){
   stroke(255,250,i); //degradación colores lineas
    
   line (mouseX,mouseY,width,i); 
   line (mouseX,mouseY,i,0);
   line (mouseX,mouseY,0,i);
   line (mouseX,mouseY,i,height);
   
  }

}


