
int branchesMin, branchesMax, colorStart;
int xx = 100;
int yy = 100;


void setup() {
size (200,200);
smooth();
colorMode(HSB,360,100,100);
frameRate(5);
}

void draw() {
background(int(random(360)),50,80,150);
int r = int(random(50,200));
int n = int(random(2,3));
branchesMin = int(random(2));
branchesMax = int(random(5,6));
colorStart = int(random (300,700));
drawCircle(100,100,r,n);
}

void drawCircle(float x, float y, int radius, int num) {
        float value = colorStart*num/6.0;
        fill(value,100,100,int(random(50,255)));
        ellipse(x, y, radius*2, radius*2);
        if (num>1) {
            num=num-1;
            int branches = int(random(branchesMin,branchesMax));
            for (int i=0; i < branches; i++) {
                float a = random(0, TWO_PI);
                float newx = x + cos(a)*random(6,10)*num;
                float newy = y + sin(a)*random(6,10)*num;
                drawCircle(newx,newy,radius/2,num);
            }
        }
}
