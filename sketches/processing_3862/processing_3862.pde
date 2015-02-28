
void setup () {
  size(800,800);
  fill(126);
  background (126);
  
color inside = color(204,104,0);
color middle = color(225,114,26);
color outside = color(239,242,152);
color lawn = color(38,252,36);
color concrete = color(146,157,146);


fill(outside);
rect(160,0,200,800);
fill(outside);
rect(0,0,160,60);
fill(middle);
rect(0,60,160,800);
fill(inside);
rect(50,90,100,700);
fill(lawn);
rect(400,160,350,270);
fill(concrete);
rect(400,160,350,270);
fill(concrete);
rect(360,160,40,270);
fill(concrete);
rect(360,100,420,60);
fill(concrete);
rect(750,100,40,370);
fill(concrete);
rect(360,420,410,60);
fill(outside);
rect(360,470,450,0);


}


void draw () {
  if(mousePressed){
    stroke(255);
  }else{
    stroke(0);
  }
  rect(mouseX,mouseY,10,10);
}



 
  

