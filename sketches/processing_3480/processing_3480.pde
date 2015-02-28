
int l=100000;
int p=360000;
void setup(){
size(600,600);
background(0);
}
void draw(){
loadPixels();
int r=int(random(p));
for(int i=r;i<(r+l);i++){
pixels[i%p]=pixels[i%p]+89000;
}
updatePixels();
}

