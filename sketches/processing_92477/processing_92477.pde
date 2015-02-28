
int branchesMin, branchesMax, colorStart;

PGraphics pg;
void setup() {
size (600,600);
pg = createGraphics(200, 200);

smooth();
for (int vert=0; vert<3; vert++) {
     for (int hor=0; hor<3; hor++) {
        pg.beginDraw();
        pg.colorMode(HSB,360,100,100);
        pg.background(int(random(360)),50,80,150);
        int xx = 100+vert*200;
        int yy = 100+hor*200;
        int r = int(random(50,200));
        int n = int(random(2,6));
        //int rs = 10;
        branchesMin = int(random(2));
        branchesMax = int(random(5,6));
        colorStart = int(random (300,700));
        drawCircle(100,100,r,n);
        pg.endDraw();
        image(pg, xx-100, yy-100);
         fill(0);
         line(200,0,200,600);
         line(400,0,400,600);
         line(0,200,600,200);
         line(0,400,600,400);
     }
  }
}

void drawCircle(float x, float y, int radius, int num) {
        float value = colorStart*num/6.0;
        pg.fill(value,100,100,int(random(50,255)));
        pg.ellipse(x, y, radius*2, radius*2);
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
    
