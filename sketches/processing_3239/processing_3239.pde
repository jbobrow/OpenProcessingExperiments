
//FIXZA
//Manten presionado el boton izquierdo del mouse y modifica el paneo y el pich del sample
import pitaru.sonia_v2_9.*; 
Sample mySample;

void setup(){
  size(400,400);
  Sonia.start(this); 
  mySample = new Sample("jungle.wav");   //cambia el sample en la carpeta "data"
 }

void draw(){

 background(0,30,0);
 strokeWeight(1); 
 setRate(); 
 setPan(); 
 //setVolume();//Control de volumen opcional
 circuloColores(50,50,0);  // cambia el tamaño y color de la pelota
}

void circuloColores(int xc, int yc,float ra){
  background(0);
  ra =random(256);
  smooth();
  stroke(#000000);
  fill(mouseX,mouseY,ra);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,xc,yc);  
  stroke(#000000);
  fill(mouseX,mouseY,ra-ra);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,10,10);
}
           
void mousePressed(){
  mySample.repeat();
}

void mouseReleased(){
  mySample.stop(1);
}

void setPan(){
  float pan = -1f + mouseX/(width/2f);
  mySample.setPan(pan);

}

/*void setVolume(){ //control de volumen opcional 
  float vol = mouseY/(height*1f);
  mySample.setVolume(vol);
}*/

void setRate(){
   float rate = (height - mouseY)*88200/(height);
   mySample.setRate(rate);
}

public void stop(){
  Sonia.stop();
  super.stop();
}
         

