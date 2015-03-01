
void setup () {
size(500,500);
noStroke();
rectMode(CENTER);
}
void draw (){
fill(200,10);
rect(width/2,height/2,width,height);
  fill(#08FCB5);
noStroke();
if(mousePressed) {
  rect(mouseX,mouseY,900,900);
}else {
  fill(0);
  ellipse(mouseX,250,40,40);

  
  
}
}
