

void setup() {
  size(400,500);

}
void draw() {
background(255);
  rectMode(CENTER);
  
  if(mousePressed) {
    rectMode(CENTER);
    fill(125,243,124);
    rect(mouseX,mouseY,20,100);
 fill(0);
  ellipse(mouseX+0.3,mouseY-80,75,70);
  ellipse(mouseX +0.5,mouseY-15,10,10);
ellipse(mouseX+0.5,mouseY+5,10,10);
ellipse(mouseX+0.5,mouseY+25,10,10);
fill(126,29,11);
ellipse(mouseX,mouseY -60,60,65);

fill(255);
ellipse(mouseX -20,mouseY-60,20,30);

fill(0);
ellipse(mouseX-15,mouseY-60,10,10);

fill(255);
ellipse(mouseX+20,mouseY-60,20,30);

fill(0);
ellipse(mouseX+15,mouseY-60,10,10);


}else{
      rectMode(CENTER);
    fill(255,166,78);
  rect(mouseX,mouseY,20,100);

fill(253,167,255);
ellipse(mouseX,mouseY -60,60,65);

fill(255);
ellipse(mouseX -20,mouseY-60,20,30);

fill(0);
ellipse(mouseX-15,mouseY-60,10,10);

fill(255);
ellipse(mouseX+20,mouseY-60,20,30);

fill(0);
ellipse(mouseX+15,mouseY-60,10,10);

} 


if(mousePressed) {
  line(mouseX+10,mouseY-10,mouseX+20,mouseY-40);
}else{
line(mouseX +10,mouseY-10,mouseX +20,mouseY +20);
}
line(mouseX-10,mouseY-10,mouseX -20,mouseY +20);
line(mouseX -10,mouseY +50,mouseX -20,mouseY+80);
line(mouseX +10, mouseY +50,mouseX+20,mouseY+80);
}



