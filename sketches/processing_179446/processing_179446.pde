

int x;
int y;
int bg;


int value = 0;

void setup(){
size (500,500);
background (255);






x=100;
y=100;
bg=70;
noStroke();
fill (230,120,120);
rectMode (CENTER);

}


void draw(){
  background(bg);
  fill(value);
  rect(100,150,50,250);
  rect(100,150,50,250);
  rect(200,250,50,250);
  rect(300,50, 50,250);
  rect(300,350,50,250);
  rect(400,300,50,250);
  rect(500,150,50,250);
 
  rect(50,30,10,250);
  rect(140,150,20,250);
  rect(200,250,50,250);
  rect(300,50, 50,250);
  rect(300,350,50,250);
  rect(400,300,50,250);
  rect(500,150,50,250); 
  
  



pushMatrix();
translate(30, 20);
fill(0);
rect(x,y,50,50);
popMatrix();

}

void mouseDragged()
{
  value = value + 5;
  if (value >255) {
    value=0;
  }
}

void mouseReleased() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}



