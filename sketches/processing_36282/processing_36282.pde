
/*balls follow mouse
after randomx amount of time change colour
randomx time makes balls grow
mouse pressed balls shrink back to normalx
---> not sure about this. mouse clicked = more balls*/
float fl = 0;
float sz = 9;
float n = 0;
int bg = 0;

void setup(){
  size(700,400);
  background(0);
  noStroke();
  smooth();
  noCursor();
  
}

void draw(){
  fl = random (2,40);
  fill(255,0,0);
  ellipse(mouseX-fl,mouseY-fl,sz,sz);
  fl = random (2,40);
  ellipse(mouseX+fl,mouseY+fl,sz,sz);
  fl = random (2,40);
  ellipse(mouseX-fl,mouseY+fl,sz,sz);
  fl = random (2,40);
  ellipse(mouseX+fl,mouseY-fl,sz,sz);
  
  /*n = fl*2;
  ellipse(pmouseX-n,pmouseY-n,sz,sz);
  ellipse(pmouseX+n,pmouseY+n,sz,sz);
  ellipse(pmouseX-n,pmouseY+n,sz,sz);
  ellipse(pmouseX+n,pmouseY-n,sz,sz);*/
  fill(bg,5);
  rect(0,0,width,height);
  if (mousePressed){
    if (sz < 250){
    sz=sz*1.5;}}   
}
 
 void mouseReleased(){
    sz = 9;
    if (bg == 255){
      bg = 0;}
      else bg = 255;
}



