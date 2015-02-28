
// practice 2
// Chang,Kuo-Ping

void setup(){
  size(480,480);
  background(255);
}

void draw(){
  if(mousePressed){
  stroke(mouseX,mouseY,150);
  strokeWeight(2);
  line(240,240,mouseX,mouseY);
  }else{
    stroke(255 );
  strokeWeight(2);
  line(240,240,mouseX,mouseY);
  }

}


