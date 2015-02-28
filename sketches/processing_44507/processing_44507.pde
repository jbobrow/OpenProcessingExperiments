


void setup(){
size(500,500);
background(255);
}

void draw(){
for(int x = 0;x <= 500; x=x+10){
  for(int y = 0;y <= 500; y=y+10){
    fill(208-x/3,32-x/3,144-x/3);
      rect(x,y,10,10);
  }
} 
noLoop();
}

