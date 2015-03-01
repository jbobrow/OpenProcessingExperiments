
void setup(){
  size(600,400);
  smooth();
  background(158,5,8);
  for(int a=50;a<400;a+=50){
    stroke(0);
    strokeWeight(4);
    line(0,a,600,a);
  }
  for(int b=100;b<600;b+=100){
    line(b,0,b,400);
    }
}

void draw(){
  //spraycan();
  cursor(CROSS);
  
  if(mousePressed==true){
    strokeWeight(10);
    stroke(180,82,205);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
  else{
  }
}


  //void spraycan(){
    //stroke(150);
    //strokeWeight(4);
    //fill(150);
    //rect(mouseX,mouseY,10,25);
    //ellipse(mouseX+5,mouseY,10,10);
  //}
  
