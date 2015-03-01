

void setup (){
size (400,400);
background (0);
frameRate (10);
}

void draw (){

int r;
int a;



stroke(255);
if (mousePressed==true) {
fill(255,255,290);

for ( r=100;r<300; r=r+50){
  for(a=100;a<300; a=a+50){
    rect(r,a,25,25);
  }
}
}

strokeWeight(10);
stroke(155,150,196);
for ( r=100;r<300; r=r+25){
  for(a=100;a<300; a=a+25){
  point(r,a);
  }
}
}
