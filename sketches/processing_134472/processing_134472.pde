
 
void setup(){
size (400,400);
background(157,149,211);
}

int value = 0;

void draw() {
fill (value);
ellipse(200,200,300,300);

strokeWeight(20);
stroke(204, 102, 0);
line(40,0, 360, 400);
}

void mouseClicked() {
  if (value == 0) {
    stroke (100,255,0);
    value = 255;
    
  } else {
    value = 0;
   
  }
}



