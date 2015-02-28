
PImage plaatje;
PImage Pistool;
PImage NaarL;
PImage Terug;
PFont segoe;
int lifes=1;
int rd=0;
int grn=255;
int yk=0;
int b=200;
int c=300;
int d=400;
int pgaanval1=0;
int pgaanval2=1200;
int pgaanval3=0;
int pgaanval4=1200;
int sp1=1;
int sp2=1;
int sp3=1;
int sp4=1;
int a=1200;
int x=600;
int y=300;
int bolx = int (random(50, 1060));
int boly = int (random(120, 545));
int xbol = int (random(50, 1060));
int ybol = int (random(120, 545));
int xbol1 = int (random(50, 1060));
int ybol1 = int (random(120, 545));
int score = 0;
int levens = 100;
int e = 0;
int f = 1200;
int g = 0;
int h = 0;
int i = 0;
int j = 0;
int k = 1200;
int l = 1200;
int n = 0;
int o = 0;
int p = 1200;
int q = 1200;
int r = 0;
int xbov = 50;
int ybov = 20;
int xlinks = 25;
int ylinks = 70;
int xrechts = 75;
int yrechts = 70;
int z = 4;
int m = 2;
int xr = 1;
int bl = 0;
int gr = 0;
int elio = 0;
int pg = 0;
int pl = 0;
int pr = 0;
int la = 0;
int ra = 0;
int schermVerder1=0;
int schermVerder2=0;
int schermVerder3=0;
int schermVerder4=0;
int vpav1=1;
int vpav2=1;
int vpav3=1;
int vpav4=1;
int vpav5=1;
int vpav6=1;
int vpav7=1;
int vpav8=1;

int vpav9=1;
int letter=0; //hetzelfde als hieronder
int vpav10=1;
int letter1=1200; //hetzelfde als hieronder
int vpav11=1;
int letter2=0; //hetzelfde als hieronder
int vpav12=1;
int letter3=0; //EXTRA INT voor vpav 12 
//Verschijnt als score over 120 is.

int vpav13=1;
int vpav14=1;
int vpav15=1;
int vpav16=1;
int vpav17=1;
int vpav18=1;

void setup() {
  fill(160, 160, 160);
  rect(400, 480, 400, 100);
  size(1200, 600);
  segoe=loadFont("SegoePrint-30.vlw");
  textFont(segoe, 30);
  Pistool=loadImage("http://www.weebly.com/uploads/1/1/7/7/11776051/pistool.png");
  NaarL=loadImage("http://www.weebly.com/uploads/1/1/7/7/11776051/naarl.png");
  plaatje=loadImage("http://www.weebly.com/uploads/1/1/7/7/11776051/img.png");
  Terug=loadImage("http://www.weebly.com/uploads/1/1/7/7/11776051/terug.jpg");
}

void draw() {
  background(0);
  image(plaatje, 0, 0, width, height);
  if (overButton(400, 480, 400, 100)) {
    fill (100, 100, 100);
  }
  else fill(160, 160, 160);
  rect(400, 480, 400, 100);
  fill(0, 0, 0);
  text("PLAY", 558, 535);
  fill(0, 255, 255);
  ///////////////////////////nu begint het spel
  if (schermVerder1==1) {
    background(255, 0, 0);
    noStroke();
    fill(0, 200, 255);
    text("Score = €"+score, 920, 50);
    text("Levens = "+levens, 680, 50);
    if (lifes==1) {
      if (x+50 > a && x < a+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > a && x < a+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > a && x < a+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > e && x < e+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > e && x < e+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > e && x < e+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }      
      if (x+50 > q && x < q+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > q && x < q+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > q && x < q+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > r && x < r+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > r && x < r+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > r && x < r+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > l && x < l+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > l && x < l+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > l && x < l+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > n && x < n+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > n && x < n+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > n && x < n+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > f && x < f+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > f && x < f+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > f && x < f+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > g && x < g+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > g && x < g+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > g && x < g+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > h && x < h+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > h && x < h+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > h && x < h+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > i && x < i+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > i && x < i+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > i && x < i+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > j && x < j+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > j && x < j+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > j && x < j+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > k && x < k+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > k && x < k+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > k && x < k+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > letter && x < letter+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > letter && x < letter+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > letter && x < letter+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > letter1 && x < letter1+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > letter1 && x < letter1+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > letter1 && x < letter1+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > letter2 && x < letter2+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > letter2 && x < letter2+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > letter2 && x < letter2+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > letter3 && x < letter3+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > letter3 && x < letter3+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > letter3 && x < letter3+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval1 && x < pgaanval1+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval1 && x < pgaanval1+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval1 && x < pgaanval1+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval2 && x < pgaanval2+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval2 && x < pgaanval2+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval2 && x < pgaanval2+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval3 && x < pgaanval3+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval3 && x < pgaanval3+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval3 && x < pgaanval3+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval4 && x < pgaanval4+50 && y+25 > b && y < b+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval4 && x < pgaanval4+50 && y+25 > c && y < c+50) {
        levens = levens-1;
      }
      if (x+50 > pgaanval4 && x < pgaanval4+50 && y+25 > d && y < d+50) {
        levens = levens-1;
      }
    }
    fill(rd, grn, 0);
    if (pg==1) {
      pgaanval1=pgaanval1+5;
      rect(pgaanval1, b, 50, 50);
      rect(pgaanval1, c, 50, 50);
      rect(pgaanval1, d, 50, 50);
    }
    if (pg==1 && sp1==1) {
      pgaanval1=0;
      sp1=0;
    }
    if (pg==1) {
      rect(pgaanval1, b, 50, 50);
      rect(pgaanval1, c, 50, 50);
      rect(pgaanval1, d, 50, 50);
    }
    if (pg==1) {
      pgaanval2=pgaanval2-5;
      rect(pgaanval2, b, 50, 50);
      rect(pgaanval2, c, 50, 50);
      rect(pgaanval2, d, 50, 50);
    }
    if (pg==1 && sp2==1) {
      pgaanval2=1200;
      sp2=0;
    }
    if (pg==1) {
      rect(pgaanval2, b, 50, 50);
      rect(pgaanval2, c, 50, 50);
      rect(pgaanval2, d, 50, 50);
    }
    if (pg==1) {
      pgaanval3=pgaanval3+5;
      rect(pgaanval3, b, 50, 50);
      rect(pgaanval3, c, 50, 50);
      rect(pgaanval3, d, 50, 50);
    }
    if (pg==1 && sp3==1) {
      pgaanval3=0;
      sp3=0;
    }
    if (pg==1) {
      rect(pgaanval3, b, 50, 50);
      rect(pgaanval3, c, 50, 50);
      rect(pgaanval3, d, 50, 50);
    }
    if (pg==1) {
      pgaanval4=pgaanval4+5;
      rect(pgaanval4, b, 50, 50);
      rect(pgaanval4, c, 50, 50);
      rect(pgaanval4, d, 50, 50);
    }
    if (pg==1 && sp4==1) {
      pgaanval4=0;
      sp4=0;
    }
    if (pg==1) {
      rect(pgaanval4, b, 50, 50);
      rect(pgaanval4, c, 50, 50);
      rect(pgaanval4, d, 50, 50);
    }
    if (score > 15 && score < 100) {
      q=q-5;
      rect(q, b, 50, 50);
      rect(q, c, 50, 50);
      rect(q, d, 50, 50);
    }
    if (score > 20 && score < 100 && vpav1==1) {
      q=1200;
      vpav1=0;
    }
    if (score > 20 && score < 100) {
      rect(q, b, 50, 50);
      rect(q, c, 50, 50);
      rect(q, d, 50, 50);
    }
    if (score > 15 && score < 100) {
      r=r+5;
      rect(r, b, 50, 50);
      rect(r, c, 50, 50);
      rect(r, d, 50, 50);
    }
    if (score > 20 && score < 100 && vpav2==1) {
      r=0;
      vpav2=0;
    }
    if (score > 20 && score < 100) {
      rect(r, b, 50, 50);
      rect(r, c, 50, 50);
      rect(r, d, 50, 50);
    }
    if (score > 50 && score < 100) {
      a=a-5;

      rect(a, b, 50, 50);
      rect(a, c, 50, 50);
      rect(a, d, 50, 50);
    }
    if (score > 50 && score < 100 && vpav3==1) {
      a=1200;
      vpav3=0;
    }
    if (score > 70 && score < 100) {
      rect(a, b, 50, 50);
      rect(a, c, 50, 50);
      rect(a, d, 50, 50);
    }
    if (score > 50 && score < 150) {
      e=e+5;

      rect(e, b, 50, 50);
      rect(e, c, 50, 50);
      rect(e, d, 50, 50);
    }
    if (score > 70 && score < 100 && vpav4==1) {
      e=0;
      vpav4=0;
    }
    if (score > 70 && score < 100) {
      rect(e, b, 50, 50);
      rect(e, c, 50, 50);
      rect(e, d, 50, 50);
    }
    if (score > 80 && score < 100) {
      l=l-5;

      rect(l, b, 50, 50);
      rect(l, c, 50, 50);
      rect(l, d, 50, 50);
    }
    if (score > 80 && score < 100 && vpav5==1) {
      l=1200;
      vpav5=0;
    }
    if (score > 80 && score < 100) {
      rect(l, b, 50, 50);
      rect(l, c, 50, 50);
      rect(l, d, 50, 50);
    }
    if (score > 80 && score < 100) {
      n=n+5;

      rect(n, b, 50, 50);
      rect(n, c, 50, 50);
      rect(n, d, 50, 50);
    }
    if (score > 80 && score < 100 && vpav6==1) {
      n=0;
      vpav6=0;
    }
    if (score > 80 && score < 100) {
      rect(n, b, 50, 50);
      rect(n, c, 50, 50);
      rect(n, d, 50, 50);
    }
    if (score > 100 && score < 150) {
      j=j+3;

      rect(j, b, 50, 50);
      rect(j, c, 50, 50);
      rect(j, d, 50, 50);
      sp1=1;
      sp2=1;
      sp3=1;
      sp4=1;
      vpav1=1;
      vpav2=1;
      vpav3=1;
      vpav4=1;
      vpav5=1;
      vpav6=1;
    }
    if (score > 100 && score < 150 && vpav7==1) {
      j=0;
      vpav7=0;
    }
    if (score > 100 && score < 150) {
      rect(j, b, 50, 50);
      rect(j, c, 50, 50);
      rect(j, d, 50, 50);
    }
    if (score > 100 && score < 150) {
      k=k-3;

      rect(k, b, 50, 50);
      rect(k, c, 50, 50);
      rect(k, d, 50, 50);
    }
    if (score > 100 && score < 150 && vpav8==1) {
      k=1200;
      vpav8=0;
    }
    if (score > 100 && score < 150) {
      rect(k, b, 50, 50);
      rect(k, c, 50, 50);
      rect(k, d, 50, 50);
    }
    if (score > 120 && score < b) {
      letter=letter-2;

      rect(letter, b, 50, 50);
      rect(letter, c, 50, 50);
      rect(letter, d, 50, 50);
    }
    if (score > 120 && score < b && vpav9==1) {
      letter=1200;
      vpav9=0;
    }
    if (score > 120 && score < b) {
      rect(letter, b, 50, 50);
      rect(letter, c, 50, 50);
      rect(letter, d, 50, 50);
    }
    if (score > 120 && score < b) {
      letter1=letter1+2;

      rect(letter1, b, 50, 50);
      rect(letter1, c, 50, 50);
      rect(letter1, d, 50, 50);
    }
    if (score > 120 && score < b && vpav10==1) {
      letter1=0;
      vpav10=0;
    }
    if (score > 120 && score < b) {
      rect(letter1, b, 50, 50);
      rect(letter1, c, 50, 50);
      rect(letter1, d, 50, 50);
    }
    if (score > 120 && score < b) {
      letter=letter-2;

      rect(letter2, b, 50, 50);
      rect(letter2, c, 50, 50);
      rect(letter2, d, 50, 50);
    }
    if (score > 140 && score < b && vpav11==1) {
      letter2=1200;
      vpav11=0;
    }
    if (score > 140 && score < b) {
      rect(letter2, b, 50, 50);
      rect(letter2, c, 50, 50);
      rect(letter2, d, 50, 50);
    }
    if (score > 140 && score < b) {
      letter3=letter3+2;

      rect(letter3, b, 50, 50);
      rect(letter3, c, 50, 50);
      rect(letter3, d, 50, 50);
    }
    if (score > 140 && score < b && vpav12==1) {
      letter3=0;
      vpav12=0;
    }
    if (score > 140 && score < b) {
      rect(letter3, b, 50, 50);
      rect(letter3, c, 50, 50);
      rect(letter3, d, 50, 50);
    }
    if (score > 150 && score < b) {
      o=o+3;

      rect(o, b, 50, 50);
      rect(o, c, 50, 50);
      rect(o, d, 50, 50);
    }
    if (score > 150 && score < b && vpav13==1) {
      o=0;
      vpav13=0;
    }
    if (score > 150 && score < b) {
      rect(o, b, 50, 50);
      rect(o, c, 50, 50);
      rect(o, d, 50, 50);
    }
    if (score > 150 && score < b) {
      p=p-3;

      rect(p, b, 50, 50);
      rect(p, c, 50, 50);
      rect(p, d, 50, 50);
    }
    if (score > 150 && score < b && vpav14==1) {
      p=1200;
      vpav14=0;
    }
    if (score > 150 && score < b) {
      rect(p, b, 50, 50);
      rect(p, c, 50, 50);
      rect(p, d, 50, 50);
    }
    if (score > 500 && score < 800) {
      h=h+3;

      rect(h, b, 50, 50);
      rect(h, c, 50, 50);
      rect(h, d, 50, 50);
    }
    if (score > 500 && score < 800 && vpav15==1) {
      h=0;
      vpav15=0;
    }
    if (score > 500 && score < 800) {
      rect(h, b, 50, 50);
      rect(h, c, 50, 50);
      rect(h, d, 50, 50);
    }
    if (score > 500 && score < 800) {
      i=i-3;
      rect(i, b, 50, 50);
      rect(i, c, 50, 50);
      rect(i, d, 50, 50);
    }
    if (score > 500 && score < 800 && vpav16==1) {
      i=1200;
      vpav16=0;
    }
    if (score > 500 && score < 800) {
      rect(i, b, 50, 50);
      rect(i, c, 50, 50);
      rect(i, d, 50, 50);
    }
    if (score > 500 && score < 800) {
      f=f+3;

      rect(d, f, 50, 50);
      rect(600, f, 50, 50);
      rect(800, f, 50, 50);
    }
    if (score > 500 && score < 800 && vpav17==1) {
      f=0;
      vpav17=0
        ;
    }
    if (score > 500 && score < 800) {
      rect(b, f, 50, 50);
      rect(c, f, 50, 50);
      rect(d, f, 50, 50);
    }
    if (score > 500 && score < 800) {
      g=g-3;

      rect(b, g, 50, 50);
      rect(c, g, 50, 50);
      rect(d, g, 50, 50);
    }
    if (score > 500 && score < 800 && vpav18==1) {
      g=1200;
      vpav18=0;
    }
    if (score > 500 && score < 800) {
      rect(g, b, 50, 50);
      rect(g, c, 50, 50);
      rect(g, d, 50, 50);
    }
    if (score > 1000 && score < -1500) {
      vpav7=1;
      vpav8=1;
      vpav9=1;
      vpav10=1;
      vpav11=1;
      vpav12=1;
      vpav13=1;
      vpav14=1;
      vpav15=1;
      vpav16=1;
      vpav17=1;      
      vpav18=1;
    }
    if (x+50 > bolx-25 && x < bolx+25 && y > boly-25 && y < boly+25) {
      bolx = int (random(50, 1060));
      boly = int (random(120, 545));
      score = score+1;
    }
    if (x+50 > xbol-25 && x < xbol+25 && y > ybol-25 && y < ybol+25) {
      xbol = int (random(50, 1060));
      ybol = int (random(120, 545));
      score = score+5;
    }
    if (x+50 > xbol1-25 && x < xbol1+25 && y > ybol1-25 && y < ybol1+25) {
      xbol1 = int (random(50, 1060));
      ybol1 = int (random(120, 545));
      score = score+10;
    }

    if (x-50 < bolx+25 && x > bolx+25 && y > boly-25 && y < boly+25) {
      bolx = int (random(50, 1060));
      boly = int (random(120, 545));
      score = score+1;
    }
    if (x-50 < xbol+25 && x > xbol+25 && y > ybol-25 && y < ybol+25) {
      xbol = int (random(50, 1060));
      ybol = int (random(120, 545));
      score = score+5;
    }
    if (x-50 < xbol1+25 && x > xbol1+25 && y > ybol1-25 && y < ybol1+25) {
      xbol1 = int (random(50, 1060));
      ybol1 = int (random(120, 545));
      score = score+10;
    }
    fill(0, 200, 210);
    text("_________________________________________________________________________________________________________________", 0, 80);
    if (la==1) {
      fill(0, 100, 255);
      rect(pr+0.5, y, 10, 10);
    } 
    if (pg==1 && xr==-1) {
      la=1;
    }
    if (pg==1 && xr==1) {
      ra=1;
    }
    if (ra==1) {
      fill(0, 100, 255);
      rect(pl+0.5, y, 10, 10);
    }
    pl=pl-10;
    pr=pr+10;
    if (pl<0 && xr==-1 && pg==1
      || xr==-1 && pl>q && pl<q+50 && y>b-2 && pg==1
      || xr==-1 && pl>r && pl<r+50 && y>b-2 && pg==1
      || xr==-1 && pl>a && pl<a+50 && y>b-2 && pg==1
      || xr==-1 && pl>e && pl<e+50 && y>b-2 && pg==1
      || xr==-1 && pl>l && pl<l+50 && y>b-2 && pg==1
      || xr==-1 && pl>n && pl<n+50 && y>b-2 && pg==1
      || xr==-1 && pl>j && pl<j+50 && y>b-2 && pg==1
      || xr==-1 && pl>k && pl<k+50 && y>b-2 && pg==1
      || xr==-1 && pl>o && pl<o+50 && y>b-2 && pg==1
      || xr==-1 && pl>p && pl<p+50 && y>b-2 && pg==1
      || xr==-1 && pl>h && pl<h+50 && y>b-2 && pg==1
      || xr==-1 && pl>i && pl<i+50 && y>b-2 && pg==1
      || xr==-1 && pl>letter && pl<letter+50 && y>b-2 && pg==1
      || xr==-1 && pl>letter1 && pl<letter1+50 && y>b-2 && pg==1
      || xr==-1 && pl>letter2 && pl<letter2+50 && y>b-2 && pg==1
      || xr==-1 && pl>letter3 && pl<letter3+50 && y>b-2 && pg==1
      || xr==-1 && pl>pgaanval1 && pl<pgaanval1+50 && y>b-2 && pg==1
      || xr==-1 && pl>pgaanval2 && pl<pgaanval2+50 && y>b-2 && pg==1
      || xr==-1 && pl>pgaanval3 && pl<pgaanval3+50 && y>b-2 && pg==1
      || xr==-1 && pl>pgaanval4 && pl<pgaanval4+50 && y>b-2 && pg==1
      ) {
      pl=x-162;
      pl=pl-1;
      //rd=255;
      //grn=0;
      lifes=0;
    }
    if (pl<0 && xr==-1 && pg==1
      || xr==-1 && pl>q && pl<q+50 && y>c-2 && pg==1
      || xr==-1 && pl>r && pl<r+50 && y>c-2 && pg==1
      || xr==-1 && pl>a && pl<a+50 && y>c-2 && pg==1
      || xr==-1 && pl>e && pl<e+50 && y>c-2 && pg==1
      || xr==-1 && pl>l && pl<l+50 && y>c-2 && pg==1
      || xr==-1 && pl>n && pl<n+50 && y>c-2 && pg==1
      || xr==-1 && pl>j && pl<j+50 && y>c-2 && pg==1
      || xr==-1 && pl>k && pl<k+50 && y>c-2 && pg==1
      || xr==-1 && pl>o && pl<o+50 && y>c-2 && pg==1
      || xr==-1 && pl>p && pl<p+50 && y>c-2 && pg==1
      || xr==-1 && pl>h && pl<h+50 && y>c-2 && pg==1
      || xr==-1 && pl>i && pl<i+50 && y>c-2 && pg==1
      || xr==-1 && pl>letter && pl<letter+50 && y>c-2 && pg==1
      || xr==-1 && pl>letter1 && pl<letter1+50 && y>c-2 && pg==1
      || xr==-1 && pl>letter2 && pl<letter2+50 && y>c-2 && pg==1
      || xr==-1 && pl>letter3 && pl<letter3+50 && y>c-2 && pg==1
      || xr==-1 && pl>pgaanval1 && pl<pgaanval1+50 && y>c-2 && pg==1
      || xr==-1 && pl>pgaanval2 && pl<pgaanval2+50 && y>c-2 && pg==1
      || xr==-1 && pl>pgaanval3 && pl<pgaanval3+50 && y>c-2 && pg==1
      || xr==-1 && pl>pgaanval4 && pl<pgaanval4+50 && y>c-2 && pg==1
      ) {
      pl=x-162;
      pl=pl-1;
      //rd=255;
      //grn=0;
      lifes=0;
    }
    if (pl<0 && xr==-1 && pg==1
      || xr==-1 && pl>q && pl<q+50 && y>d-2 && pg==1
      || xr==-1 && pl>r && pl<r+50 && y>d-2 && pg==1
      || xr==-1 && pl>a && pl<a+50 && y>d-2 && pg==1
      || xr==-1 && pl>e && pl<e+50 && y>d-2 && pg==1
      || xr==-1 && pl>l && pl<l+50 && y>d-2 && pg==1
      || xr==-1 && pl>n && pl<n+50 && y>d-2 && pg==1
      || xr==-1 && pl>j && pl<j+50 && y>d-2 && pg==1
      || xr==-1 && pl>k && pl<k+50 && y>d-2 && pg==1
      || xr==-1 && pl>o && pl<o+50 && y>d-2 && pg==1
      || xr==-1 && pl>p && pl<p+50 && y>d-2 && pg==1
      || xr==-1 && pl>h && pl<h+50 && y>d-2 && pg==1
      || xr==-1 && pl>i && pl<i+50 && y>d-2 && pg==1
      || xr==-1 && pl>letter && pl<letter+50 && y>d-2 && pg==1
      || xr==-1 && pl>letter1 && pl<letter1+50 && y>d-2 && pg==1
      || xr==-1 && pl>letter2 && pl<letter2+50 && y>d-2 && pg==1
      || xr==-1 && pl>letter3 && pl<letter3+50 && y>d-2 && pg==1
      || xr==-1 && pl>pgaanval1 && pl<pgaanval1+50 && y>d-2 && pg==1
      || xr==-1 && pl>pgaanval2 && pl<pgaanval2+50 && y>d-2 && pg==1
      || xr==-1 && pl>pgaanval3 && pl<pgaanval3+50 && y>d-2 && pg==1
      || xr==-1 && pl>pgaanval4 && pl<pgaanval4+50 && y>d-2 && pg==1
      ) {
      pl=x-162;
      pl=pl-1;
      //rd=255;
      //grn=0;
      lifes=0;
    }
    if (pr>1206 && xr==1 && pg==1
      || xr==1 && pl>q && pl<q+50 && y>b-2 && pg==1
      || xr==1 && pl>r && pl<r+50 && y>b-2 && pg==1
      || xr==1 && pl>a && pl<a+50 && y>b-2 && pg==1
      || xr==1 && pl>e && pl<e+50 && y>b-2 && pg==1
      || xr==1 && pl>l && pl<l+50 && y>b-2 && pg==1
      || xr==1 && pl>n && pl<n+50 && y>b-2 && pg==1
      || xr==1 && pl>j && pl<j+50 && y>b-2 && pg==1
      || xr==1 && pl>k && pl<k+50 && y>b-2 && pg==1
      || xr==1 && pl>o && pl<o+50 && y>b-2 && pg==1
      || xr==1 && pl>p && pl<p+50 && y>b-2 && pg==1
      || xr==1 && pl>h && pl<h+50 && y>b-2 && pg==1
      || xr==1 && pl>i && pl<i+50 && y>b-2 && pg==1
      || xr==1 && pl>letter && pl<letter+50 && y>b-2 && pg==1
      || xr==1 && pl>letter1 && pl<letter1+50 && y>b-2 && pg==1
      || xr==1 && pl>letter2 && pl<letter2+50 && y>b-2 && pg==1
      || xr==1 && pl>letter3 && pl<letter3+50 && y>b-2 && pg==1
      || xr==1 && pl>pgaanval1 && pl<pgaanval1+50 && y>b-2 && pg==1
      || xr==1 && pl>pgaanval2 && pl<pgaanval2+50 && y>b-2 && pg==1
      || xr==1 && pl>pgaanval3 && pl<pgaanval3+50 && y>b-2 && pg==1
      || xr==1 && pl>pgaanval4 && pl<pgaanval4+50 && y>b-2 && pg==1
      ) {
      pr=x+162;
      pr=pr+1;
      //rd=255;
      //grn=0;
      lifes=0;
    }
    if (pr>1206 && xr==1 && pg==1
      || xr==1 && pl>q && pl<q+50 && y>c-2 && pg==1
      || xr==1 && pl>r && pl<r+50 && y>c-2 && pg==1
      || xr==1 && pl>a && pl<a+50 && y>c-2 && pg==1
      || xr==1 && pl>e && pl<e+50 && y>c-2 && pg==1
      || xr==1 && pl>l && pl<l+50 && y>c-2 && pg==1
      || xr==1 && pl>n && pl<n+50 && y>c-2 && pg==1
      || xr==1 && pl>j && pl<j+50 && y>c-2 && pg==1
      || xr==1 && pl>k && pl<k+50 && y>c-2 && pg==1
      || xr==1 && pl>o && pl<o+50 && y>c-2 && pg==1
      || xr==1 && pl>p && pl<p+50 && y>c-2 && pg==1
      || xr==1 && pl>h && pl<h+50 && y>c-2 && pg==1
      || xr==1 && pl>i && pl<i+50 && y>c-2 && pg==1
      || xr==1 && pl>letter && pl<letter+50 && y>c-2 && pg==1
      || xr==1 && pl>letter1 && pl<letter1+50 && y>c-2 && pg==1
      || xr==1 && pl>letter2 && pl<letter2+50 && y>c-2 && pg==1
      || xr==1 && pl>letter3 && pl<letter3+50 && y>c-2 && pg==1
      || xr==1 && pl>pgaanval1 && pl<pgaanval1+50 && y>c-2 && pg==1
      || xr==1 && pl>pgaanval2 && pl<pgaanval2+50 && y>c-2 && pg==1
      || xr==1 && pl>pgaanval3 && pl<pgaanval3+50 && y>c-2 && pg==1
      || xr==1 && pl>pgaanval4 && pl<pgaanval4+50 && y>c-2 && pg==1
      ) {
      pr=x+162;
      pr=pr+1;
      //rd=255;
      //grn=0;
      lifes=0;
    }
    if (pr>1206 && xr==1 && pg==1
      || xr==1 && pl>q && pl<q+50 && y>d-2 && pg==1
      || xr==1 && pl>r && pl<r+50 && y>d-2 && pg==1
      || xr==1 && pl>a && pl<a+50 && y>d-2 && pg==1
      || xr==1 && pl>e && pl<e+50 && y>d-2 && pg==1
      || xr==1 && pl>l && pl<l+50 && y>d-2 && pg==1
      || xr==1 && pl>n && pl<n+50 && y>d-2 && pg==1
      || xr==1 && pl>j && pl<j+50 && y>d-2 && pg==1
      || xr==1 && pl>k && pl<k+50 && y>d-2 && pg==1
      || xr==1 && pl>o && pl<o+50 && y>d-2 && pg==1
      || xr==1 && pl>p && pl<p+50 && y>d-2 && pg==1
      || xr==1 && pl>h && pl<h+50 && y>d-2 && pg==1
      || xr==1 && pl>i && pl<i+50 && y>d-2 && pg==1
      || xr==1 && pl>letter && pl<letter+50 && y>d-2 && pg==1
      || xr==1 && pl>letter1 && pl<letter1+50 && y>d-2 && pg==1
      || xr==1 && pl>letter2 && pl<letter2+50 && y>d-2 && pg==1
      || xr==1 && pl>letter3 && pl<letter3+50 && y>d-2 && pg==1
      || xr==1 && pl>pgaanval1 && pl<pgaanval1+50 && y>d-2 && pg==1
      || xr==1 && pl>pgaanval2 && pl<pgaanval2+50 && y>d-2 && pg==1
      || xr==1 && pl>pgaanval3 && pl<pgaanval3+50 && y>d-2 && pg==1
      || xr==1 && pl>pgaanval4 && pl<pgaanval4+50 && y>d-2 && pg==1
      ) {
      pr=x+162;
      pr=pr+1;
      //rd=255;
      //grn=0;
      lifes=0;
    }
    if (xr == 1 && pg == 1) {
      image(Pistool, x+50, y-25, 112.5, 70.875);
    }
    if (xr == -1 && pg == 1) {
      image(NaarL, x-162.5, y-25, 112.5, 70.875);
    }
    fill(0, 200, 210);
    ellipse(bolx, boly, 50, 50);
    fill(0, 255, 0);
    rect(380, 13, 50, 50);
    text("= Vijanden", 440, 50);
    ellipse(150, 37.5, 50, 50);
    text("€5", 180, 50);
    ellipse(xbol, ybol, 50, 50);
    ellipse(1157.5, 352.5, 50, 50);
    text("=", 1151.25, 397.5);
    text("Shop", 1121.25, 420);
    text("Afsl-", 1121.25, 450);
    text("uiten", 1121.5, 480);
    fill(255, 255, 0);
    if ( xr == -1) {
      arc(x, y, 100, 100, radians(210), radians(510));
      fill(255, 0, 0);
      ellipse(x-8, y-25, 10, 10);
    }
    else if (xr == 1) {
      arc(x, y, 100, 100, radians(30), radians(330));
      fill(255, 0, 0);
      ellipse(x+8, y-25, 10, 10);
    }
    fill(255, 255, 0);
    ellipse(270, 37.5, 50, 50);
    text("€10", c, 50);
    ellipse(xbol1, ybol1, 50, 50);
    triangle(1160, b, 1135, 250, 1185, 250);
    text("=", 1152, 270);
    text("Upg-", 1122, 290);
    text("rade", 1122, 325);
    fill(0, 200, 210);
    text("€1", 63, 50);
    ellipse(30, 37.5, 50, 50);
    rect(161, 535, 2, 80);
    rect(0, 535, 162, 2);
    rect(1115, 495, 90, 2);
    rect(1115, 82, 2, 414);
    triangle(1160, 90, 1135, 140, 1185, 140);
    triangle(2, 595, 27, 545, 52, 595);
    text("=", 1152, 160);
    text("Shop", 1122, 180);
    fill(255, 0, 0);
    if (levens < 0) {
      background(0, b, 210);
      fill(255, 0, 0);
      text("Je score was --> "+score, 450, 50);
      text("Verloren...", 550, b);
    }
    if (mouseX < 27+25 && mouseX > 27-25 && mouseY < 545+50 && mouseY > 545-50 && mousePressed) {
      elio=1;
    }
    fill(0, 255, 255);
    image(Terug, 60, 537, 51, 63);
    rect(126, 550, 4, 37);
    rect(146, 550, 4, 37);
    if (mousePressed && mouseX > 59 && mouseY > 536 && mouseX < 112) {
      yk=0;
      b=200;
      c=300;
      d=400;
      pgaanval1=0;
      pgaanval2=1200;
      pgaanval3=0;
      pgaanval4=1200;
      sp1=1;
      sp2=1;
      sp3=1;
      sp4=1;
      a=1200;
      x=600;
      y=300;
      bolx = int (random(50, 1060));
      boly = int (random(120, 545));
      xbol = int (random(50, 1060));
      ybol = int (random(120, 545));
      xbol1 = int (random(50, 1060));
      ybol1 = int (random(120, 545));
      score = 0;
      levens = 100;
      e = 0;
      f = 1200;
      g = 0;
      h = 0;
      i = 0;
      j = 0;
      k = 1200;
      l = 1200;
      n = 0;
      o = 0;
      p = 1200;
      q = 1200;
      r = 0;
      xbov = 50;
      ybov = 20;
      xlinks = 25;
      ylinks = 70;
      xrechts = 75;
      yrechts = 70;
      z = 4;
      m = 2;
      xr = 1;
      bl = 0;
      gr = 0;
      elio = 0;
      pg = 0;
      pl = 0;
      pr = 0;
      la = 0;
      ra = 0;
      vpav1=1;
      vpav2=1;
      vpav3=1;
      vpav4=1;
      vpav5=1;
      vpav6=1;
      vpav7=1;
      vpav8=1;
      vpav9=1;
      letter=0;
      vpav10=1;
      letter1=1200;
      vpav11=1;
      letter2=0;
      vpav12=1;
      letter3=0;
      vpav13=1;
      vpav14=1;
      vpav15=1;
      vpav16=1;
      vpav17=1;
      vpav18=1;
    }
    if (mousePressed && mouseX > 111 && mouseX < 161 && mouseY > 536) {
      schermVerder1=0;
    }
    if (elio==1) {
      background(0, 255, 255);
      bl=255;
      gr=255;
      fill(0, 255, 0);
      ellipse(1150, 50, 50, 50);
      fill(255, 255, 0);
      triangle(xbov, ybov+97, xlinks, ylinks+97, xrechts, yrechts+97);
      text("Pistool tegen", xbov+30, ybov+117);
      text("Vijanden.", xbov+30, ybov+147);
      text("€120", xrechts+160, yrechts+97);
      triangle(xbov, ybov, xlinks, ylinks, xrechts, yrechts);
      text("Pacman sneller", xbov+30, ybov+20);
      text("€1000", xrechts+5, yrechts);
      fill(255, 0, 0);
      fill(255, 0, 0);
      rect(0, ylinks+25, 350, 2);
      rect(0, ylinks+122, 350, 2);
      rect(0, ylinks+25, 350, 2);
      rect(0, ylinks+122, 350, 2);
      rect(350, 0, 2, 600);
      rect(0, ylinks+219, 350, 2);
      rect(0, ylinks+316, 350, 2);
      rect(0, ylinks+413, 350, 2);
      fill(0, 255, 0);
      rect(0, ylinks+510, 1200, 20);
      fill(255, 255, 0);
      image(Pistool, 352, ylinks+27, 140, 97);
      rect(490, ylinks+25, 2, 99);
      rect(352, ylinks+122, 140, 2);
      rect(352, ylinks+25, 140, 2);
      if (mouseX>1125 && mouseX<1175 && mouseY>25 && mouseY<75 && mousePressed) {
        elio=0;
      }
    }
  }
  stroke(10);
  ellipse(mouseX, mouseY, 5, 5);
}

void keyPressed() {
  if (schermVerder3==1) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        x = x + z;
        xr = 1;
      }
    }
    if (key == 'y' || key == 'Y') {
      yk=1;
    }
    else yk=0;
    if (key == 'q') {
      x = x - m;
      y = y - m;
    }
    if (key == 'e') {
      x = x + m;
      y = y - m;
    }
    if (key == 'z') {
      x = x - m;
      y = y + m;
    }
    if (key == 'c') {
      x = x + m;
      y = y + m;
    }
    if (key == CODED) {
      if (keyCode == LEFT) {
        x = x - z;
        xr = -1;
      }
    }
    if (key == CODED) {
      if (keyCode == DOWN) {
        y = y + z;
      }
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      y = y - z;
    }
    if (key == CODED) {
      if (keyCode == CONTROL) {
        score=120;
      }
    }
  }
}

void mousePressed() { 
  if (overButton(400, 480, 400, 100)) {
    fill (100, 100, 100);
    schermVerder1=1;
    schermVerder2=1;
    schermVerder3=1;
    schermVerder4=1;
  }
  else fill(160, 160, 160);
  rect(400, 480, 400, 100);
  if (schermVerder4==1) {
    if (mouseX < xbov+25 && mouseX > xbov-25 && mouseY < ybov+50 && mouseY > ybov-50 && score > 999 && elio==1) {
      score = score - 1000;
      z = z + 4;
      m = m + 4;
    }
    if (mouseX < xbov+25 && mouseX > xbov-25 && mouseY < ybov+147 && mouseY > ybov+97 && score > 119 && elio==1 && pg==0) {
      score=score-120;
      pg=1;
    }
  }
}


boolean overButton(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}


