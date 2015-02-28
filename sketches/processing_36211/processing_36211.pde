
/*balls follow mouse
after randomx amount of time change colour
randomx time makes balls grow
mouse pressed balls shrink back to normalx
---> not sure about this. mouse clicked = more balls*/
float fl = 0;
float sz = 9;

void setup(){
  size(700,400);
  background(255);
  noStroke();
  smooth();
  
}

void draw(){
 fl = random (0,40);
  fill(0);
  ellipse(mouseX-fl,mouseY-fl,sz,sz);
  ellipse(mouseX+fl,mouseY+fl,sz,sz);
  ellipse(mouseX-fl,mouseY+fl,sz,sz);
  ellipse(mouseX+fl,mouseY-fl,sz,sz);
  fill(255,20);
  rect(0,0,width,height);
}


