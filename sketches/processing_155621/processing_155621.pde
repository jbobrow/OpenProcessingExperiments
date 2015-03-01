
int nMax;
int b;

void setup() {
    size(800, 800);
    background(255);
    noStroke();
    smooth();
    rectMode(CENTER);
    nMax = 8;
    b = 2;
    
    recRect(width/2, height/2, nMax, -1);
    fill(127, 255, 0);
    ellipse(width/2, height/2, pow(b, nMax), pow(b, nMax));
}

void recRect(int x, int y, int n, int d) {
    if (--n < 0) return;
    
    color c = color(255-((n/nMax)*255)/2, (n/nMax)*255, 0);

    int s = (pow(b, n+1)/2)+(pow(b, n)/2);

    int[] xArr = [x+s, x-s];
    int[] yArr = [y+s, y-s];

    for(int i = 0; i < xArr.length; i++) {
        if (i == d) continue;
        recRect(xArr[i], y, n, (i+1)%2);
        fill(c);
        ellipse(xArr[i], y, pow(b, n), pow(b, n));
    }

    for(int i = 0; i < yArr.length; i++) {
        if (i+2 == d) continue;
        recRect(x, yArr[i], n, ((i+1)%2) + 2);
        fill(c);
        ellipse(x, yArr[i], pow(b, n), pow(b, n));
    }
}
