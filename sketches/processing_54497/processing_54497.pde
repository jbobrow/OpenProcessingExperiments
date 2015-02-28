
/*Code by Sarah Tse
York Sheridan Joint Program of Design*/

int a = 242;
int b = 234;
int c = 61; 

int d = 65;
int e = 196;
int f = 131;

int h = 150;  //size of large square
int g = 120;  //size of small square

int o = 300;  //opacity

void setup(){
  size(400,400);
  background(0,0,0);
  rectMode(CORNER);
  smooth();
  noCursor();
}

void draw(){
  noStroke();
  //outer squares
  fill(a, b, c);
  rect(35,35,h,h);
  rect(215,35,h,h);
  rect(35,215,h,h);
  rect(215,215,h,h);
  
  //inner squares
  fill(d, e, f, o);
  rect(51,51,g,g);
  rect(231,51,g,g);
  rect(51,231,g,g);
  rect(231,231,g,g);
  
  //instructions for Y for colour change
  if(mouseY < 100){
    b = 173;
    e = 123;
    f = 193;
  }
  else if(mouseY > 100 && mouseY < 200){
    b = 195;
    e = 169;
    f = 193;
  }
  else if(mouseY > 200 && mouseY < 300){
    b = 215;
    e = 193;
    f = 160;
  }  
  else if(mouseY > 300 && mouseY < 400){
    b = 234;
    e = 196;
    f = 131;
  }
  
    //instructions for X for opacity
  if(mouseX < 50){
    o = 0;
  }
  else if(mouseX > 50 && mouseX < 100){
    o = 50;
  }
  else if(mouseX > 100 && mouseX < 150){
    o = 100;
  }
  else if(mouseX > 150 && mouseX < 200){
    o = 150;
  }
  else if(mouseX > 200 && mouseX < 250){
    o = 200;
  }
  else if(mouseX > 250 && mouseX < 300){
    o = 250;
  }
  else if(mouseX > 300 && mouseX < 400){
    o = 300;
  }
}

 //instructions for size decrease  
void mouseClicked(){ 
  if(mouseButton == LEFT && g > 10){
    g -=20;
  }
  else{
    g = 120;
  }
  if(mouseButton == RIGHT && h > 30){
    h -=20;
  }
  else{
    h = 150;
  }
}
     

