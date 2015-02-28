

int sx, sy, maxx, maxy, w; 
float density = 0.5; 
int zx=maxx/2;
int zy=maxy/2;
int[][] record;

void setup() 
{ 
    size(1000, 1000);
    frameRate(12);
    maxx = width;
    maxy = height;
    zx=maxx/2;
    zy=maxy/2;
    record = new int[2000][2000];
    background(0); 
    noFill();
   stroke(255,255,255);
   stroke(255,255,255);
   ellipse(zx, zy, 50, 50);
   line(0,0,maxx,maxy);
    line(maxx,0,0,maxy);
}

void draw() 
{ 
int s1,s2,s3,s4,s0;
int s5,s6,s7,s8,ss;
int p1,p2,p3,p4,p5,p6;
int p7,p8,p9,p10,p11,p12;
int p13,p14,p15,p16;

 
for (sx=5 ; sx < maxx-5; sx++)
{
  for (sy=5 ; sy < maxy-5; sy++)
  {
    s0=get(sx,sy); if (s0==-1){  s0=1;  } else { s0=0; }
    record[sx][sy] = s0 ;
  }
}
  
for (sx=5 ; sx < maxx-5; sx++)
  {
    for (sy=5 ; sy < maxy-5; sy++)
      {

s0=get(sx,sy); if (s0==-1){  s0=1;  } else { s0=0; }
record[sx][sy] = s0 ;

p1 = record[sx-2][sy-2]; 
p2 = record[sx - 1][sy-2];
p3 = record[sx][sy-2];
p4 = record[sx+1][sy-2]; 
p5 = record[sx+2][sy-2]; 

p6 = record[sx-2][sy-1];
p7 = record[sx+2][sy-1]; 

p8 = record[sx-2][sy];
p9 = record[sx+2][sy]; 

p10 = record[sx-2][sy+1];
p11 = record[sx+2][sy+1]; 

p12 = record[sx - 2][sy+2];
p13 = record[sx - 1][sy+2];
p14 = record[sx][sy+2]; 
p15 = record[sx+1][sy+2]; 
p16 = record[sx+2][sy+2]; 


s1 = record[sx - 1][sy - 1];
s2 = record[sx - 1][sy];
s3 = record[sx - 1][sy + 1];
s4 = record[sx][sy - 1];

s5=record[sx][sy+1];
s6=record[sx+1][sy+1]; 
s7=record[sx+1][sy]; 
s8=record[sx+1][sy-1]; 

ss=s1+s2+s3+s4+s5+s6+s7+s8+p1+p2+p3+p4+p5+p6+p7+p8+p9+p10+p11+p12+p13+p14+p15+p16;

if ((s0 == 0) && ((ss == 3) || (ss==7) || (ss==4) || (ss==6)))

  {
    color white = color(255);
    set(sx, sy, white);
  }

if ((s0 == 1) && ((ss != 11) && (ss != 13) && (ss!=15) && (ss!=17) && (ss!=19)))

  {
    color black = color(0);
    set(sx, sy, black);
  }

}
} 
}


