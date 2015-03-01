
void setup(){
  size(400,400);
}

  
void draw(){
    background (255,200,150);
    noStroke();
    noCursor();
for(int i=1; i<mouseX; i=i+10){
ellipse(width/3,i,9,9);  }

for(int i=1; i<mouseX; i=i+10){
ellipse(i,i/2,9,9);  }

for(int i=1; i<mouseX; i=i+15){
ellipse(i/2, i/2, 9,9);  }

for(int i=1; i<mouseX; i=i+10){
ellipse(i,height/2,9,9);  }


}


