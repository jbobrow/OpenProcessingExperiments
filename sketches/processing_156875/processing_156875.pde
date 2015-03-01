

void setup() {
size(300,300);
}

void draw(){
  background(80);
  if (mousePressed){
    fill(0);
rect(mouseX,90,70,70);
rect(mouseX+100,90,70,70);
rect(mouseX-30,230,200,10);

} 
else{
  fill(255);
  ellipse(mouseX,90,70,70);
  ellipse(mouseX+100,90,70,70);
  ellipse(mouseX+50,230,70,70);
 rect(mouseX,80,10,10);
 rect(mouseX+90,80,10,10);
}
}




