
void setup(){
  size(1000,1000);
}

void draw(){
  rect(0,0,1000,1000);
  fill(random(255),random(255),random(255),random(255));
  if (mousePressed){
  ellipse((mouseX),(mouseY),50,50);
  ellipse((mouseX),(mouseY),40,40);
  ellipse((mouseX),(mouseY),30,30);
  ellipse((mouseX),(mouseY),20,20);
  ellipse((mouseX),(mouseY),10,10);}
  ellipse(random(1000),random(1000),50,50);
  ellipse(random(1000),random(1000),50,50);
  ellipse(random(1000),random(1000),50,50);
  ellipse(random(1000),random(1000),50,50);
  line(random(1000),0,random(1000),1000);
  line(0,random(1000),1000,random(1000));
  line(random(1000),random(1000),random(1000),random(1000));
  rect(random(1000),random(1000),random(1000),random(1000));
  triangle(random(1000),random(1000),random(1000),random(1000),random(1000),random(1000));
  rect(random(1000),random(1000),random(1000),random(1000));
  rect(random(1000),random(1000),random(1000),random(1000));
  rect(random(1000),random(1000),random(1000),random(1000));
  if (mousePressed){
  ellipse((mouseY),(mouseX),50,50);
  ellipse((mouseY),(mouseX),40,40);
  ellipse((mouseY),(mouseX),30,30);
  ellipse((mouseY),(mouseX),20,20);
  ellipse((mouseY),(mouseX),10,10);
  ellipse((mouseX),(mouseX),50,50);
  ellipse((mouseX),(mouseX),40,40);
  ellipse((mouseX),(mouseX),30,30);
  ellipse((mouseX),(mouseX),20,20);
  ellipse((mouseX),(mouseX),10,10);
  ellipse((mouseY),(mouseY),50,50);
  ellipse((mouseY),(mouseY),40,40);
  ellipse((mouseY),(mouseY),30,30);
  ellipse((mouseY),(mouseY),20,20);
  ellipse((mouseY),(mouseY),10,10);}
}

