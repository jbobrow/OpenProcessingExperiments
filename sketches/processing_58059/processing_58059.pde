
// Created by Joseph Kennedy
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP

int a = 0;
int b = 0;
int c = 0;
int d = 0;
int e = 0;
int f = 0;
int g = 0;
int h = 0;
int i = 0;
int j = 0;
int k = 0;
int l = 0;
int m = 0;
int n = 0;
int o = 0;
int p = 0;
int q = 0;
int r = 0;
int s = 0;
int t = 0;
int u = 0;
int v = 0;
int count = 0;
int click = 10;

void setup() {
  size(1025, 1025);
}
void draw() {

  for ( int x = 20; count < click; x += 20) {
    fill(x);
    rect(0, 0, 1025, 1025);
    noStroke();
    count ++;
  }

  float mx = mouseX;
  float my = mouseY;


  fill(mx/2+my/2-45);
  rect(25, 25, 75, 75);

  fill(mx/2+my/2-100); 
  rect(25, 125, 75, 75);

  fill(mx/2+my/2-155);
  rect(25, 225, 75, 75);

  fill(mx/2+my/2-210);
  rect(25, 325, 75, 75);

  fill(mx/2+my/2-265);
  rect(25, 425, 75, 75); 

  fill(mx/2+my/2-320);
  rect(25, 525, 75, 75);

  fill(mx/2+my/2-375);
  rect(25, 625, 75, 75);

  fill(mx/2+my/2-430);
  rect(25, 725, 75, 75);

  fill(mx/2+my/2-485);
  rect(25, 825, 75, 75);

  fill(mx/2+my/2-540);
  rect(25, 925, 75, 75);

  //Column 1

  fill(mx/2+my/2-100);
  rect(125, 25, 75, 75);

  fill(mx/2+my/2-15);
  rect(125, 125, 75, 75);

  fill(mx/2+my/2-100);
  rect(125, 225, 75, 75);

  fill(mx/2+my/2-155);
  rect(125, 325, 75, 75);

  fill(mx/2+my/2-300);
  rect(125, 425, 75, 75); 

  fill(mx/2+my/2-400);
  rect(125, 525, 75, 75);

  fill(mx/2+my/2-400);
  rect(125, 625, 75, 75);

  fill(mx/2+my/2-270);
  rect(125, 725, 75, 75);

  fill(mx/2+my/2-225);
  rect(125, 825, 75, 75);

  fill(mx/2+my/2-120);
  rect(125, 925, 75, 75);

  //Column 2

  fill(mx/2+my/2-155);
  rect(225, 25, 75, 75);

  fill(mx/2+my/2-400);
  rect(225, 125, 75, 75);

  fill(mx/2+my/2-340);
  rect(225, 225, 75, 75);

  fill(mx/2+my/2-320);
  rect(225, 325, 75, 75);

  fill(mx/2+my/2-300);
  rect(225, 425, 75, 75); 

  fill(mx/2+my/2-100);
  rect(225, 525, 75, 75);

  fill(mx/2+my/2-230);
  rect(225, 625, 75, 75);

  fill(mx/2+my/2-300);
  rect(225, 725, 75, 75);

  fill(mx/2+my/2-370);
  rect(225, 825, 75, 75);

  fill(mx/2+my/2-180);
  rect(225, 925, 75, 75);

  // Column 3

  fill(mx/2+my/2-210);
  rect(325, 25, 75, 75);

  fill(mx/2+my/2-550);
  rect(325, 125, 75, 75);

  fill(mx/2+my/2-600);
  rect(325, 225, 75, 75);

  fill(mx/2+my/2-670);
  rect(325, 325, 75, 75);

  fill(mx/2+my/2-630);
  rect(325, 425, 75, 75); 

  fill(mx/2+my/2-580);
  rect(325, 525, 75, 75);

  fill(mx/2+my/2-520);
  rect(325, 625, 75, 75);

  fill(mx/2+my/2-330);
  rect(325, 725, 75, 75);

  fill(mx/2+my/2-350);
  rect(325, 825, 75, 75);

  fill(mx/2+my/2-230);
  rect(325, 925, 75, 75);

  //Column 4

  fill(mx/2+my/2-280);
  rect(425, 25, 75, 75);

  fill(mx/2+my/2-320);
  rect(425, 125, 75, 75);

  fill(mx/2+my/2-400);
  rect(425, 225, 75, 75);

  fill(mx/2+my/2-425);
  rect(425, 325, 75, 75);

  fill(mx/2+my/2-450);
  rect(425, 425, 75, 75); 

  fill(mx/2+my/2-475);
  rect(425, 525, 75, 75);

  fill(mx/2+my/2-500);
  rect(425, 625, 75, 75);

  fill(mx/2+my/2-120);
  rect(425, 725, 75, 75);

  fill(mx/2+my/2-150);
  rect(425, 825, 75, 75);

  fill(mx/2+my/2-250);
  rect(425, 925, 75, 75);

  //Column 5

    fill(mx/2+my/2-400);
  rect(525, 25, 75, 75);

  fill(mx/2+my/2-450);
  rect(525, 125, 75, 75);

  fill(mx/2+my/2-480);
  rect(525, 225, 75, 75);

  fill(mx/2+my/2-500);
  rect(525, 325, 75, 75);

  fill(mx/2+my/2-230);
  rect(525, 425, 75, 75); 

  fill(mx/2+my/2-190);
  rect(525, 525, 75, 75);

  fill(mx/2+my/2-150);
  rect(525, 625, 75, 75);

  fill(mx/2+my/2-120);
  rect(525, 725, 75, 75);

  fill(mx/2+my/2-600);
  rect(525, 825, 75, 75);

  fill(mx/2+my/2-650);
  rect(525, 925, 75, 75);

  //Column 6

  fill(mx/2+my/2-320);
  rect(625, 25, 75, 75);

  fill(mx/2+my/2-280);
  rect(625, 125, 75, 75);

  fill(mx/2+my/2-135);
  rect(625, 225, 75, 75);

  fill(mx/2+my/2-100);
  rect(625, 325, 75, 75);

  fill(mx/2+my/2-85);
  rect(625, 425, 75, 75); 

  fill(mx/2+my/2-700);
  rect(625, 525, 75, 75);

  fill(mx/2+my/2-620);
  rect(625, 625, 75, 75);

  fill(mx/2+my/2-580);
  rect(625, 725, 75, 75);

  fill(mx/2+my/2-550);
  rect(625, 825, 75, 75);

  fill(mx/2+my/2-520);
  rect(625, 925, 75, 75);

  //Clolumn 7

  fill(mx/2+my/2-210);
  rect(725, 25, 75, 75);

  fill(mx/2+my/2-250);
  rect(725, 125, 75, 75);

  fill(mx/2+my/2-160);
  rect(725, 225, 75, 75);

  fill(mx/2+my/2-220);
  rect(725, 325, 75, 75);

  fill(mx/2+my/2-270);
  rect(725, 425, 75, 75); 

  fill(mx/2+my/2-340);
  rect(725, 525, 75, 75);

  fill(mx/2+my/2-230);
  rect(725, 625, 75, 75);

  fill(mx/2+my/2-220);
  rect(725, 725, 75, 75);

  fill(mx/2+my/2-140);
  rect(725, 825, 75, 75);

  fill(mx/2+my/2-480);
  rect(725, 925, 75, 75);

  //Column 8

  fill(mx/2+my/2-180);
  rect(825, 25, 75, 75);

  fill(mx/2+my/2-320);
  rect(825, 125, 75, 75);

  fill(mx/2+my/2-330);
  rect(825, 225, 75, 75);

  fill(mx/2+my/2-340);
  rect(825, 325, 75, 75);

  fill(mx/2+my/2-350);
  rect(825, 425, 75, 75); 

  fill(mx/2+my/2-360);
  rect(825, 525, 75, 75);

  fill(mx/2+my/2-380);
  rect(825, 625, 75, 75);

  fill(mx/2+my/2-400);
  rect(825, 725, 75, 75);

  fill(mx/2+my/2-420);
  rect(825, 825, 75, 75);

  fill(mx/2+my/2-440);
  rect(825, 925, 75, 75);

  //Column 9

  fill(mx/2+my/2-150);
  rect(925, 25, 75, 75);

  fill(mx/2+my/2-110);
  rect(925, 125, 75, 75);

  fill(mx/2+my/2-80);
  rect(925, 225, 75, 75);

  fill(mx/2+my/2-60);
  rect(925, 325, 75, 75);

  fill(mx/2+my/2-310);
  rect(925, 425, 75, 75); 

  fill(mx/2+my/2-240);
  rect(925, 525, 75, 75);

  fill(mx/2+my/2-600);
  rect(925, 625, 75, 75);

  fill(mx/2+my/2-650);
  rect(925, 725, 75, 75);

  fill(mx/2+my/2-230);
  rect(925, 825, 75, 75);

  fill(mx/2+my/2-180);
  rect(925, 925, 75, 75);

  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(a, 112, .5, .5);
    a++;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(b-50, 212, .5, .5);
    b+=5;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(c, 312, .5, .5);
    c++;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(d-25, 412, .5, .5);
    d+=2;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(e-50, 512, .5, .5);
    e+=3;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(f-75, 612, .5, .5);
    f+=4;
  } 
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(g-50, 712, .5, .5);
    g+=5;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(h, 812, .5, .5);
    h+=10;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(i-30, 912, .5, .5);
    i++;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(112, j, .5, .5);
    j++;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(212, k-40, .5, .5);
    k+=8;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(312, l-55, .5, .5);
    l+=3;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(412, m-40, .5, .5);
    m+=6;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(512, n-40, .5, .5);
    n++;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(612, o-25, .5, .5);
    o+=2;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(712, p-10, .5, .5);
    p++;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(812, q-50, .5, .5);
    q+=4;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(912, r, .5, .5);
    r+=2;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(12, s, .5, .5);
    s++;
  }  
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(1012, t-15, .5, .5);
    t+=3;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(u-20, 12, .5, .5);
    u++;
  }
  {
    stroke(1);
    strokeWeight(25);
    fill(0);
    rect(v-60, 1012, .5, .5);
    v+=7;
  }
  if (a>width) {
    a=0;
  } 
  if (b>width+50) {
    b=0;
  }
  if (c>width) {
    c=0;
  }
  if (d>width+25) {
    d=0;
  }
  if (e>width+50) {
    e=0;
  }
  if (f>width+75) {
    f=0;
  }
  if (g>width+50) {
    g=0;
  }
  if (h>width) {
    h=0;
  }
  if (i>width+30) {
    i=0;
  }
  if (j>width) {
    j=0;
  }
  if (k>width+40) {
    k=0;
  }
  if (l>width+55) {
    l=0;
  }
  if (m>width+40) {
    m=0;
  }
  if (n>width) {
    n=0;
  }
  if (o>width+25) {
    o=0;
  }
  if (p>width+10) {
    p=0;
  }
  if (q>width+50) {
    q=0;
  }
  if (r>width) {
    r=0;
  }
  if (s>width) {
    s=0;
  }
  if (t>width+15) {
    t=0;
  }
  if (u>width+20) {
    u=0;
  }
  if (v>width+60) {
    v=0;
  }

  noStroke();
}

void mousePressed () {
  count = 0;
  click ++;
}


