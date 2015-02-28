
boolean f= false;
void setup(){
  size(600,600);
  background(255,255,255);
}
void mouseReleased (){
  if (f==false){
  f=true;
  }
  else if (f==true){
    f=false;
  }
}
  void draw(){
    if(f==true) {
      fill(252,0,0);
      //se puede cambiar por el primitivo que yo quiera
      ellipse(mouseX,mouseY,10,10);
    }
    else if (f==false);
    {
      fill(0,0,0);
      //se puede cambiar por el primitivo que yo quiera
      line(mouseX,mouseY, 10,10);
    }
  }
 void keyPressed() {
 if (key=='s'){
 save ("foto.png");
 }
 }
 
