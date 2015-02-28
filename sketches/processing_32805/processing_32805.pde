

void setup(){
size(500,500);
smooth();
int y = 0;
int x = 0;
noStroke();
background(0);
for(x=18; x <= 500; x+=21){
  for(y=18; y <= 500; y+=21){
    fill(x,y,255,100);
ellipse(x,y,15,15);
  }
  
}

}

