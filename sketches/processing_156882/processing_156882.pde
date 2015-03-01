
void setup(){
  size(500,500);
noStroke();
background(0);

}

void draw(){


for (int x=0;x<width;x+=0) 
for (int y=0;y<height;y+=0){
  fill(int(random(255)), int(random(0)), int(random(255))); 
  rect(x,y,30,30);
  x+= 10;
  y+= 10;}

}
  




