
int x=250;

void setup(){
size(500,500);
background(0);

smooth();
}

void draw(){

  fill(0,0,255);

ellipse(250, 450, 400, 400);
  fill(225);
ellipse(250, 150, 400, 400);

  
fill(0);
ellipse(150, 150, 60, 60);
fill(250);
ellipse(150, 150, 30, 30);
fill(0);
ellipse(280, 150, 60, 60);
fill(255,20,30);

ellipse(280, 150, 30, 30);

triangle(230,x,120,250, 350, 250);




}

void mouseClicked() {
  if(x == 250) {
    x = 380;
  } else {
    x = 250;
  }
}        
