
void setup(){
  size(250,250);
  background(0);
}

void draw(){
  for (int i=0; i<1200; i=i+4){
    stroke(i,0,0);
    strokeWeight(i/1200);
    line(i,0,i,1200);
        if (i==mouseX+-2){
         stroke(0,i,0);
         line (i,0,i,1200);
        }
  } 
}




