
void setup(){
size(400,400);
rectMode(CENTER);} 
void draw(){
background(234,228,9);  
stroke(0);
fill(45,125,150);
rect(200,200,20,100);

fill(9,170,120);
ellipse(200,140,60,60);

fill(255);
ellipse(167,135,19,30);
ellipse(233,135,19,30);

fill(0);
ellipse(167,135,12,12);
ellipse(233,135,12,12);

stroke(0);
line(185,150,160,160);
line(215,150,240,160);

stroke(9,170,120);
line(190,250,175,290);
line(210,250,225,290);

stroke(0);
fill(88,60,9);
rect(173,290,20,10);
rect(227,290,20,10);

fill(255,126,5);
ellipse(mouseX,mouseY,48,48);
}
void keyPressed() {
  if(key=='s'){ 
    saveImage();}
}


