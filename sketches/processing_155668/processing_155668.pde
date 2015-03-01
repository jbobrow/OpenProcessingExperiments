
//長野高専情報教育センター主催　平成26年度公開講座
//USBメモリだけでできる！　「簡単・お手軽　アート・プログラミング入門」
//sougou2-? ポスター作成プログラム(poster-sougou2.pde)

// E O N C G R x2    ALTPMSUFHY x1
import processing.pdf.*;
int yoko=10;
int tate=2;
int size_x=200;
int size_y=200;
String[][] name = {
                    {"sougou2-P.jpg","sougou2-R1.jpg","sougou2-O1.jpg","sougou2-C1.jpg","sougou2-E1.jpg","sougou2-S.jpg","sougou2-S.jpg","sougou2-I.jpg","sougou2-N1.jpg","sougou2-G1.jpg"},
                    {"sougou2-P.jpg","sougou2-R2.jpg","sougou2-O2.jpg","sougou2-G2.jpg","sougou2-R1.jpg","sougou2-A.jpg","sougou2-M.jpg","sougou2-I.jpg","sougou2-N2.jpg","sougou2-G1.jpg"},
                    {"sougou2-O1.jpg","sougou2-P.jpg","sougou2-E2.jpg","sougou2-N1.jpg"},
                    {"sougou2-L.jpg","sougou2-E1.jpg","sougou2-C2.jpg","sougou2-T.jpg","sougou2-U.jpg","sougou2-R2.jpg","sougou2-E2.jpg"},
                    {"sougou2-N2.jpg","sougou2-A.jpg","sougou2-G2.jpg","sougou2-A.jpg","sougou2-N1.jpg","sougou2-O2.jpg"},
                    {"sougou2-N2.jpg","sougou2-A.jpg","sougou2-T.jpg","sougou2-I.jpg","sougou2-O1.jpg","sougou2-N1.jpg","sougou2-A.jpg","sougou2-L.jpg"},
                    {"sougou2-C1.jpg","sougou2-O2.jpg","sougou2-L.jpg","sougou2-L.jpg","sougou2-E1.jpg","sougou2-G1.jpg","sougou2-E2.jpg"},
                    {"sougou2-O1.jpg","sougou2-F.jpg"},
                    {"sougou2-T.jpg","sougou2-E1.jpg","sougou2-C2.jpg","sougou2-H.jpg","sougou2-N2.jpg","sougou2-O2.jpg","sougou2-L.jpg","sougou2-O1.jpg","sougou2-G2.jpg","sougou2-Y.jpg"},
                    {"sougou2-C1.jpg","sougou2-O2.jpg","sougou2-M.jpg","sougou2-P.jpg","sougou2-U.jpg","sougou2-T.jpg","sougou2-E2.jpg","sougou2-R1.jpg"},
                    {"sougou2-C2.jpg","sougou2-E1.jpg","sougou2-N1.jpg","sougou2-T.jpg","sougou2-R2.jpg","sougou2-E2.jpg"}
                  };
//nagano national college of technology
int dpi=103;
float width_mm=594;
float height_mm=420;
//A2 420×594
int width_pix=int(width_mm *0.03937 *dpi);
int height_pix=int(height_mm *0.03937 *dpi);
size(width_pix,height_pix,PDF,"poster-sougou2.pdf");
colorMode(RGB,256);
background(0,0,0);
int x,y;
//背景の貼り付け
   PImage bp=loadImage("H25-haikei.jpg");
   image(bp,0,0,2400,1697);
   
//受講者作品の貼り付け
//PROCESSING
y=0;
for(x=0; x<=yoko-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,x*size_x+200,y*size_y+250,size_x,size_y);
}
//PROGRAMING
y=1;
for(x=0; x<=yoko-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,x*size_x+200,y*size_y+300,size_x,size_y);
}

//OPEN
y=2;
for(x=0; x<=4-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,200+x*size_x/1.2+20,y*size_y+400,size_x/1.2,size_y/1.2);
}

//LECTURE 7
y=3;
for(x=0; x<=7-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,200+x*size_x/1.2+20,y*size_y+450,size_x/1.2,size_y/1.2);
}

//NAGANO 6
y=4;
for(x=0; x<=6-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,1800+x*size_x/3,800,size_x/3,size_y/3);
}

//NATIONAL   8
y=5;
for(x=0; x<=8-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,1800-67*2+x*size_x/3,900,size_x/3,size_y/3);
}

//COLLEGE  7
y=6;
for(x=0; x<=7-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,1800-67*1+x*size_x/3,1000,size_x/3,size_y/3);
}

//OF  2
y=7;
for(x=0; x<=2-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,1800-67*(-4)+x*size_x/3,1100,size_x/3,size_y/3);
}

//TECHNOLOGY  10
y=8;
for(x=0; x<=10-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,1800-67*4+x*size_x/3,1200,size_x/3,size_y/3);
}

//COMPUTER 6
y=9;
for(x=0; x<=8-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,1050-67*4+x*size_x/3,1350,size_x/3,size_y/3);
}

//CENTRE 6
y=10;
for(x=0; x<=6-1; x++) {
   PImage p=loadImage(name[y][x]);
   image(p,2300-67*14+x*size_x/3,1350,size_x/3,size_y/3);
}

//下部の文字描画
//PFont font=createFont("ARBERKLEY",100);
PFont font=createFont("Algerian",300);

//textAlign(CENTER);
textFont(font,80);

//fill(0,0,0);
//textFont(font,200);
//text("Open lecture",200,950);
//textFont(font,95);
//text("@ Nagano National College of Technology",200,1150);
//text("Computer Center",200,1350);

fill(255,255,255);
text("2014.8.1",1050,1600);
exit();


