
int sx=604;
int sy=500;
int s=15;
int[][] output = new int[1000][1000];
int nx=sx/s;
int ny=sy/s;

void setup() {
size(sx,sy);
fill(0,158,158);
stroke(0,158,158);
textSize(30);
}

void draw() {
background(0);
text("window.width: "+window.innerWidth,100,100);
int mydiv = document.getElementById("menuHeader").offsetWidth;
text(mydiv,100,200);

}
