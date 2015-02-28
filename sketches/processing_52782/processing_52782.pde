
int numLoops;
void setup(){
size(800,600);
smooth();
numLoops=1;


PVector[] p = new PVector[2];
float shift = 10.0;
float fade = 0;
float fillCol = 0;
float rot = 0;
float spin = 100;

}
void draw(){
  background(111);
translate(width/2,height/2);
for(int i = 0; i < numLoops; i++){
  rotate(radians(3));
   strokeWeight(3);
   rect(0,i/(mouseY+.666),125,200);
   ellipse(2,i/(mouseY-.666),125,2000);
   rect(10,100,1025,32);

  }
}


void keyPressed(){
  if(key == 'a'){
  numLoops++;

  } else if(key =='s'){
    numLoops--;
  }
}

void mouseReleased(){
 background(980,256,34); 
 numLoops --;
}

