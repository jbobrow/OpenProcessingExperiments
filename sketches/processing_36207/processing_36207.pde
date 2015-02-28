
/*balls follow mouse
after randomx amount of time change colour
randomx time makes balls grow
mouse pressed balls shrink back to normalx
---> not sure about this. mouse clicked = more balls*/


void setup(){
  size(700,400);
  background(255);
  noStroke();
  smooth();
  
}

void draw(){
  fill(0);
  ellipse(mouseX-5,mouseY-5,10,10);
  ellipse(mouseX+5,mouseY+5,10,10);
  ellipse(mouseX-5,mouseY+5,10,10);
  ellipse(mouseX+5,mouseY-5,10,10);
  fill(255,20);
  rect(0,0,width,height);
}


