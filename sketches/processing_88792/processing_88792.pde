
//for_loop_2
color[] cstick={#d4823c,#73431f,#5e3213,#402512,#4c0E00};
int s=50;

void setup(){
size(600,600);
smooth();
background(cstick[1]);
noStroke();
for(int x= 0; x< width; x +=s){
for(int y=0; y<height; y+=s){
  fill(cstick[int(random(1,5))]);
  rect(x,y,s,s);
   }
  }
}
void draw(){
fill(cstick[int(random(1,5))]);
int x = int(random(width/s))*s;
int y = int(random(height/s))*s;
rect(x,y,s,s);
frameRate(10);
}
