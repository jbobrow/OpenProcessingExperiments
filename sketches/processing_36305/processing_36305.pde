
/*balls follow mouse
after randomx amount of time change colour
randomx time makes balls grow
mouse pressed balls shrink back to normalx
---> not sure about this. mouse clicked = more balls*/
float fl = 0;
float sz = 9;
float n = 0;
int bg = 0;
int bluex = #3c738a;
int orangex = #f6996c;
int beigex = #fee2bc;
int greenx = #70a798;
int purplex = #977979;

void setup(){
  size(700,400);
  background(0);
  noStroke();
  smooth();
  noCursor();
  
}

void draw(){
    fl = random (2,40);
    fill(beigex);
  ellipse(mouseX-fl,mouseY-fl,sz,sz);
    fl = random (2,40);
    fill(greenx);
  ellipse(mouseX-fl,mouseY+fl,sz,sz);
      fl = random (2,40);
    fill(orangex);
  ellipse(mouseX+fl,mouseY+fl,sz,sz);
    fl = random (2,40);
    fill(bluex);
  ellipse(mouseX+fl,mouseY-fl,sz,sz);
    fill(bg,5);
  rect(0,0,width,height);
  if (mousePressed){
    if (sz < 250){
    sz=sz+2;}}    
}
 
 void mouseReleased(){
    sz = 9;
    if (bg == 0){
      bg = 255;}
      else bg = 0;
}



//colours//
//70a798 green
//3c738a blue
//7b7870 dark brown
//f6996c orange
//d79e6c camel
//fee2bc beige
//977979 purple

