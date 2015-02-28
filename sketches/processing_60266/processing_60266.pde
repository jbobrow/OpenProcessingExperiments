
int x=0;
void setup(){
size(400,400);
smooth();
fill(132,112,255);
noStroke();
}

void draw(){
redT (1,1);
}
void redT(int c, int j) {
noStroke();
fill(200,0,0, 100);
for(int i=c; i<400; i=i+1) {
float r = random(400);
rect(i, r, i, j);
}
}



