
void setup(){
  smooth();
  size(1000,1000);
  
}
  void draw(){
    background(130);
  for(int i=0; i<100;i++){
    line(width/2,height/2,i*10,0);
    stroke(0,0,200);
    line(mouseX,mouseY,i*-50,0);
    line(mouseX,mouseY,i*50,0);
  }

}



