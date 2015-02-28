
int[] xP = new int[50];
int[] yP = new int[50];

void setup(){

 size(500, 500);
 smooth();

}

void draw() {
 background(255);

for (int i = 0; i < xP.length-1; i++){
 xP[i] = xP[i+1];
 yP[i] = yP[i+1];
}

xP[xP.length-1] = mouseX;
yP[yP.length-1] = mouseY;

for (int i = 0; i < xP.length; i++) {
 stroke(0);
 fill(255);
 rectMode(CENTER);
 rect(xP[i], yP[i], i, i);
}
}

