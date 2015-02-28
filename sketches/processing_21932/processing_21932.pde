
float y=0;
float colorValue=0;
float i=0;
void setup(){
  size(500,500);
  smooth();
  background(10);
 
}
void draw(){
if(mousePressed==true){
  strokeWeight(5);
  stroke(162,162,128);
  line(y,0,y,500);
  y=y+20;
}else{
  stroke(229,229,185);
  line(y,0,y,500);
}
  y=y+10;
   frameRate(50);
 if(y>500){
   y=-10;
 }
  stroke(67,63,63);
  strokeWeight(1);
  pushMatrix();
  translate(width/2,height/2);
  for(int i=0; i<10; i++){
    rotate(radians(60));
    fill(121,105,106);
    rect(0,0,75,200);
    fill(165,127,129);
    rect(0,0,65,190);
    fill(222,181,184);
    rect(0,0,55,180);
  }
    popMatrix();
  
}

