
int haHa;


void setup(){
size(600,600);
haHa=0;
smooth();
noCursor();
noStroke();
}

void draw() {
 background(haHa, 30, 75);
haHa++;

for(int i= 0; i<width; i+=10){
 background(haHa, i+30, 75);
  haHa++;
  fill(i+mouseX,200,haHa);
  quad(38, i++, mouseX, 20, haHa, i, 400, haHa);
  //ellipse(mouseX, 75, mouseX, 75);

if(haHa > 700){
 haHa=0;
} else {
  rotate(radians(180));
  
  
}
}
 ellipse(mouseX,mouseY,20,20);
}


