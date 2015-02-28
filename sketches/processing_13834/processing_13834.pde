
int num = 1;
int[] ex = new int[num];
int[] ey = new int[num];
 
void setup() {
size(300,300);
noFill();
}
void draw() {
background(0);
stroke(255);
noFill();
smooth();
strokeWeight(1);
for (int i=0; i<num; i++) {
ex[i] = ex[i]+1;
ey[i] = ey[i]+1;
if (ex[i]+ey[i]>3000) {
ex[i] = 0;
ey[i] = 0;
b = (b + 100)%350;
}
ellipse(150,150,ex[i],ey[i]);
}
}

                
                
