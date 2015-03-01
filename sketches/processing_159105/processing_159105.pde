
color[] beach= {#15FF3D, #15FFFD, #6721A5, #45718C, #F06ACA, #FFFFFF};
color[] palette=beach;

int s=50;

void setup(){
size(600,200);
background(palette[5]);
smooth();
noStroke();

for(int x=0; x<width; x+=s){
  for(int y=0; y<height; y+=s){
  fill(palette[int(random(0,5))]);
  rect(x,y,s,s);
}
}
}

void draw(){
  fill(palette[int(random(0,5))]);
  int x=int(random(width/s))*s;
  int y=int(random(height/s))*s;
  rect(x,y,s,s);
}


