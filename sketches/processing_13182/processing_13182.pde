
//Ian L.: DMA252A - Assignment #1, Part B - Interactive Self-Portrait

//inserting photo as background with green tint

void setup() {
  size(480,320);
  background(255);
  smooth();
  color green = color(#006600); 
  PImage img;
  img = loadImage("photoe.png");
  tint(green);
  image(img,0,0,480,320);

}

//creating stripes

void draw(){

  for(int ey=0;ey<=10;ey+=5){
    if (mouseY<=5){
    stroke(197,291,183,51);
    strokeWeight(0.5);
    line (0,ey,480,ey);
  }else{
        stroke(#006600);
    strokeWeight(0.5);
    line (0,ey,480,ey);
  }
  }
    for(int eya=10;eya<=20;eya+=5){
    if (mouseY<=10){
    stroke(197,291,183,51);
    strokeWeight(0.5);
    line (0,eya,480,eya);
  }else{
        stroke(#006600);
    strokeWeight(0.5);
    line (0,eya,480,eya);
  }
  }
  
      for(int eyb=20;eyb<=30;eyb+=5){
    if (mouseY<=20){
    stroke(197,291,183,51);
    strokeWeight(0.5);
    line (0,eyb,480,eyb);
  }else{
        stroke(#006600);
    strokeWeight(0.5);
    line (0,eyb,480,eyb);
  }
  }
    for(int eyc=30;eyc<=40;eyc+=5){
    if (mouseY<=30){
    stroke(197,291,183,51);
    strokeWeight(0.5);
    line (0,eyc,480,eyc);
  }else{
        stroke(#006600);
    strokeWeight(0.5);
    line (0,eyc,480,eyc);
  }
  }
  
    for(int eyd=40;eyd<=50;eyd+=5){
    if (mouseY<=40){
    stroke(197,291,183,51);
    strokeWeight(0.5);
    line (0,eyd,480,eyd);
  }else{
        stroke(#006600);
    strokeWeight(0.5);
    line (0,eyd,480,eyd);
  }
  }
  int fx=145;
  for (int fy=50;fy<53;fy+=3) {
    
  if (mouseY <= 50){
    stroke(197,291,183,51);
    strokeWeight(0.75);
    line (fx,fy,fx+0.75,fy+0.75);
    strokeWeight(1);
    line (fx+0.75,fy+0.75,fx+25,fy+0.75);
    strokeWeight(0.75);
    line (fx+25,fy+1.5,fx+28,fy);
    strokeWeight(0.5);
    line (0,fy,fx,fy);
    line (fx+28,fy,480,fy);
  } else {
    stroke(#006600);
    strokeWeight(0.75);
    line (fx,fy,fx+0.75,fy+0.75);
    strokeWeight(1);
    line (fx+0.75,fy+0.75,fx+25,fy+0.75);
    strokeWeight(0.75);
    line (fx+25,fy+1.5,fx+28,fy);
    strokeWeight(0.5);
    line (0,fy,fx,fy);
    line (fx+28,fy,480,fy);
  }
  }
  int gx=140;
  for (int gy=52;gy<55;gy+=5) {
 if (mouseY <= 52){
    stroke(197,291,183,51);
    strokeWeight(1.25);
    line (gx,gy,gx+1.5,gy+1.5);
    strokeWeight(1.75);
    line (gx+1.5,gy+1.5,gx+32,gy+1.5);
    strokeWeight(1.25);
    line (gx+32,gy+1.5,gx+38,gy);
    strokeWeight(0.5);
    line (0,gy,gx,gy);
    line (gx+38,gy,480,gy);
    } else {
       stroke(#006600);
    strokeWeight(1.25);
    line (gx,gy,gx+1.5,gy+1.5);
    strokeWeight(1.75);
    line (gx+1.5,gy+1.5,gx+32,gy+1.5);
    strokeWeight(1.25);
    line (gx+32,gy+1.5,gx+38,gy);
    strokeWeight(0.5);
    line (0,gy,gx,gy);
    line (gx+38,gy,480,gy);
  } 
  }

  int hx=137;
  for (int hy=55; hy<60; hy+=5) {
    if (mouseY <= 55){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (hx,hy,hx+2,hy+2);
    strokeWeight(2);
    line (hx+2,hy+2,hx+42,hy+2);
    strokeWeight(1.5);
    line (hx+42,hy+2,hx+46,hy);
    strokeWeight(0.5);
    line (0,hy,hx,hy);
    line (hx+46,hy,480,hy);
  } else {
        stroke(#006600);
    strokeWeight(1.5);
    line (hx,hy,hx+2,hy+2);
    strokeWeight(2);
    line (hx+2,hy+2,hx+42,hy+2);
    strokeWeight(1.5);
    line (hx+42,hy+2,hx+46,hy);
    strokeWeight(0.5);
    line (0,hy,hx,hy);
    line (hx+46,hy,480,hy);
  }
  } 

  int hxa=134;
  for (int hya=57; hya<59; hya+=5) {
       if (mouseY <= 57){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (hxa,hya,hxa+3,hya+4);
    strokeWeight(2);
    line (hxa+3,hya+4,hxa+48,hya+4);
    strokeWeight(1.5);
    line (hxa+48,hya+4,hxa+51,hya);
    strokeWeight(0.5);
    line (0,hya,hxa,hya);
    line (hxa+51,hya,480,hya);
  } else {
   stroke(#006600);
    strokeWeight(1.5);
    line (hxa,hya,hxa+3,hya+4);
    strokeWeight(2);
    line (hxa+3,hya+4,hxa+48,hya+4);
    strokeWeight(1.5);
    line (hxa+48,hya+4,hxa+51,hya);
    strokeWeight(0.5);
    line (0,hya,hxa,hya);
    line (hxa+51,hya,480,hya);
  }
  }

  int ix=130;
  for (int iy=62; iy<65; iy+=5) {
    if (mouseY <= 62){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (ix,iy,ix+3,iy+3);
    strokeWeight(2);
    line (ix+3,iy+3,ix+55,iy+3);
    strokeWeight(1.5);
    line (ix+55, iy+3, ix+59, iy);
    strokeWeight(0.5);
    line (0,iy,ix,iy);
    line (ix+59,iy,480,iy);
  }else{
    stroke(#006600);
    strokeWeight(1.5);
    line (ix,iy,ix+3,iy+3);
    strokeWeight(2);
    line (ix+3,iy+3,ix+55,iy+3);
    strokeWeight(1.5);
    line (ix+55, iy+3, ix+59, iy);
    strokeWeight(0.5);
    line (0,iy,ix,iy);
    line (ix+59,iy,480,iy);
  }
}
  int jxa=125;
  for (int jya=65;jya<85;jya+=5) {
     if (mouseY <= 65){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (jxa,jya,jxa+5,jya+5);
    strokeWeight(2);
    line (jxa+5,jya+5,jxa+60,jya+5);
    strokeWeight(1.5);
    line (jxa+60,jya+5,jxa+69,jya);
    strokeWeight(0.5);
    line (0,jya,jxa,jya);
    line (jxa+69,jya,480,jya);
  }else{
  stroke(#006600);
    strokeWeight(1.5);
    line (jxa,jya,jxa+5,jya+5);
    strokeWeight(2);
    line (jxa+5,jya+5,jxa+60,jya+5);
    strokeWeight(1.5);
    line (jxa+60,jya+5,jxa+69,jya);
    strokeWeight(0.5);
    line (0,jya,jxa,jya);
    line (jxa+69,jya,480,jya);
  }
  }
   int jxb=125;
  for (int jyb=85;jyb<105;jyb+=5) {
     if (mouseY <= 85){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (jxb,jyb,jxb+5,jyb+5);
    strokeWeight(2);
    line (jxb+5,jyb+5,jxb+60,jyb+5);
    strokeWeight(1.5);
    line (jxb+60,jyb+5,jxb+69,jyb);
    strokeWeight(0.5);
    line (0,jyb,jxb,jyb);
    line (jxb+69,jyb,480,jyb);
  }else{
  stroke(#006600);
    strokeWeight(1.5);
    line (jxb,jyb,jxb+5,jyb+5);
    strokeWeight(2);
    line (jxb+5,jyb+5,jxb+60,jyb+5);
    strokeWeight(1.5);
    line (jxb+60,jyb+5,jxb+69,jyb);
    strokeWeight(0.5);
    line (0,jyb,jxb,jyb);
    line (jxb+69,jyb,480,jyb);
  }
  }
  int jxc=125;
  for (int jyc=105;jyc<121;jyc+=5) {
     if (mouseY <= 105){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (jxc,jyc,jxc+5,jyc+5);
    strokeWeight(2);
    line (jxc+5,jyc+5,jxc+60,jyc+5);
    strokeWeight(1.5);
    line (jxc+60,jyc+5,jxc+69,jyc);
    strokeWeight(0.5);
    line (0,jyc,jxc,jyc);
    line (jxc+69,jyc,480,jyc);
  }else{
  stroke(#006600);
    strokeWeight(1.5);
    line (jxc,jyc,jxc+5,jyc+5);
    strokeWeight(2);
    line (jxc+5,jyc+5,jxc+60,jyc+5);
    strokeWeight(1.5);
    line (jxc+60,jyc+5,jxc+69,jyc);
    strokeWeight(0.5);
    line (0,jyc,jxc,jyc);
    line (jxc+69,jyc,480,jyc);
  }
  }

  int kx=120;
  for (int ky=125;ky<140;ky+=5) {
     if (mouseY <= 125){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (kx,ky,kx+5,ky+5);
    strokeWeight(2);
    line (kx+5,ky+5,kx+70,ky+5);
    strokeWeight(1.5);
    line (kx+70,ky+5,kx+75,ky);
    strokeWeight(0.5);
    line (0,ky,kx,ky);
    line (kx+75,ky,480,ky);
  }else{
    stroke(#006600);
    strokeWeight(1.5);
    line (kx,ky,kx+5,ky+5);
    strokeWeight(2);
    line (kx+5,ky+5,kx+70,ky+5);
    strokeWeight(1.5);
    line (kx+70,ky+5,kx+75,ky);
    strokeWeight(0.5);
    line (0,ky,kx,ky);
    line (kx+75,ky,480,ky);
  }
  }
  int lx=115;
  for (int ly=140;ly<145;ly+=5) {
     if (mouseY <= 140){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (lx,ly,lx+5,ly+5);
    strokeWeight(2);
    line (lx+5,ly+5,lx+80,ly+5);
    strokeWeight(1.5);
    line (lx+80,ly+5,lx+85,ly);
    strokeWeight(0.5);
    line (0,ly,lx,ly);
    line (lx+85,ly,480,ly);
  }else{
    stroke(#006600);
    strokeWeight(1.5);
    line (lx,ly,lx+5,ly+5);
    strokeWeight(2);
    line (lx+5,ly+5,lx+80,ly+5);
    strokeWeight(1.5);
    line (lx+80,ly+5,lx+85,ly);
    strokeWeight(0.5);
    line (0,ly,lx,ly);
    line (lx+85,ly,480,ly);
  }
  }
  int mx=113;
  for (int my=145;my<150;my+=5) {
    if (mouseY <= 145){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (mx,my,mx+5,my+5);
    strokeWeight(2);
    line (mx+5,my+5,mx+85,my+5);
    strokeWeight(1.5);
    line (mx+85,my+5,mx+90,my);
    strokeWeight(0.5);
    line (0,my,mx,my);
    line (mx+90,my,480,my);
  }else{
        stroke(#006600);
    strokeWeight(1.5);
    line (mx,my,mx+5,my+5);
    strokeWeight(2);
    line (mx+5,my+5,mx+85,my+5);
    strokeWeight(1.5);
    line (mx+85,my+5,mx+90,my);
    strokeWeight(0.5);
    line (0,my,mx,my);
    line (mx+90,my,480,my);
  }
  }
  int nx=62;
  for (int ny=150;ny<160;ny+=5) {
    if (mouseY <=150) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (nx,ny,nx+5,ny+5);
    strokeWeight(2);
    line (nx+5,ny+5,nx+146,ny+5);
    strokeWeight(1.5);
    line (nx+146,ny+5,nx+151,ny);
    strokeWeight(0.5);
    line (0,ny,nx,ny);
    line (nx+151,ny,480,ny);
  }else{
    stroke(#006600);
    strokeWeight(1.5);
    line (nx,ny,nx+5,ny+5);
    strokeWeight(2);
    line (nx+5,ny+5,nx+146,ny+5);
    strokeWeight(1.5);
    line (nx+146,ny+5,nx+151,ny);
    strokeWeight(0.5);
    line (0,ny,nx,ny);
    line (nx+151,ny,480,ny);
  }
  }

  int ox=58;
  for (int oy=160;oy<165;oy+=5) {
    if (mouseY <= 160){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (ox,oy,ox+5,oy+5);
    strokeWeight(2);
    line (ox+5,oy+5,ox+149,oy+5);
    strokeWeight(1.5);
    line (ox+149,oy+5,ox+154,oy);
    strokeWeight(0.5);
    line (0,oy,ox,oy);
    line (ox+154,oy,480,oy);
  }else{
     stroke(#006600);
    strokeWeight(1.5);
    line (ox,oy,ox+5,oy+5);
    strokeWeight(2);
    line (ox+5,oy+5,ox+149,oy+5);
    strokeWeight(1.5);
    line (ox+149,oy+5,ox+154,oy);
    strokeWeight(0.5);
    line (0,oy,ox,oy);
    line (ox+154,oy,480,oy);
  }
}
  int px=51;
  for (int py=165;py<170;py+=5) {
    if (mouseY <= 165) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (px,py,px+5,py+5);
    strokeWeight(2);
    line (px+5,py+5,px+160,py+5);
    strokeWeight(1.5);
    line (px+160,py+5,px+165,py);
    strokeWeight(0.5);
    line (0,py,px,py);
    line (px+165,py,480,py);
  } else {
        stroke(#006600);
    strokeWeight(1.5);
    line (px,py,px+5,py+5);
    strokeWeight(2);
    line (px+5,py+5,px+160,py+5);
    strokeWeight(1.5);
    line (px+160,py+5,px+165,py);
    strokeWeight(0.5);
    line (0,py,px,py);
    line (px+165,py,480,py);
  }
  }
  int qx=45;
  for (int qy=170;qy<180;qy+=5) {
     if (mouseY <= 170) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (qx,qy,qx+5,qy+5);
    strokeWeight(2);
    line (qx+5,qy+5,qx+170,qy+5);
    strokeWeight(1.5);
    line (qx+170,qy+5,qx+177,qy);
    strokeWeight(0.5);
    line (0,qy,qx,qy);
    line (qx+177,qy,480,qy);
  }  else {
     stroke(#006600);
    strokeWeight(1.5);
    line (qx,qy,qx+5,qy+5);
    strokeWeight(2);
    line (qx+5,qy+5,qx+170,qy+5);
    strokeWeight(1.5);
    line (qx+170,qy+5,qx+177,qy);
    strokeWeight(0.5);
    line (0,qy,qx,qy);
    line (qx+177,qy,480,qy);
  }
  }
  int rx=35;
  for (int ry=180;ry<190;ry+=5) {
    if (mouseY <= 180){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (rx,ry,rx+5,ry+5);
    strokeWeight(2);
    line (rx+5,ry+5,rx+190,ry+5);
    strokeWeight(1.5);
    line (rx+190,ry+5,rx+195,ry);
    strokeWeight(0.5);
    line (0,ry,rx,ry);
    line (rx+195,ry,480,ry);
  }  else {
        stroke(#006600);
    strokeWeight(1.5);
    line (rx,ry,rx+5,ry+5);
    strokeWeight(2);
    line (rx+5,ry+5,rx+190,ry+5);
    strokeWeight(1.5);
    line (rx+190,ry+5,rx+195,ry);
    strokeWeight(0.5);
    line (0,ry,rx,ry);
    line (rx+195,ry,480,ry);
  }
  }
  int sx=28;
  for (int sy=190;sy<195;sy+=5) {
    if (mouseY <= 190){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (sx,sy,sx+5,sy+5);
    strokeWeight(2);
    line (sx+5,sy+5,sx+203,sy+5);
    strokeWeight(1.5);
    line (sx+203,sy+5,sx+208,sy);
    strokeWeight(0.5);
    line (0,sy,sx,sy);
    line (sx+208,sy,480,sy);
  }   else {
    stroke(#006600);
    strokeWeight(1.5);
    line (sx,sy,sx+5,sy+5);
    strokeWeight(2);
    line (sx+5,sy+5,sx+203,sy+5);
    strokeWeight(1.5);
    line (sx+203,sy+5,sx+208,sy);
    strokeWeight(0.5);
    line (0,sy,sx,sy);
    line (sx+208,sy,480,sy);
  }
  }
  int tx=25;
  for (int ty=195;ty<210;ty+=5) {
    if (mouseY<=195){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (tx,ty,tx+5,ty+5);
    strokeWeight(2);
    line (tx+5,ty+5,tx+213,ty+5);
    strokeWeight(1.5);
    line (tx+213,ty+5,tx+218,ty);
    strokeWeight(0.5);
    line (0,ty,tx,ty);
    line (tx+218,ty,480,ty);
  }   else {
 stroke(#006600);
    strokeWeight(1.5);
    line (tx,ty,tx+5,ty+5);
    strokeWeight(2);
    line (tx+5,ty+5,tx+213,ty+5);
    strokeWeight(1.5);
    line (tx+213,ty+5,tx+218,ty);
    strokeWeight(0.5);
    line (0,ty,tx,ty);
    line (tx+218,ty,480,ty);
  }
}

  int ux=26;
  for (int uy=210;uy<215;uy+=5) {
    if (mouseY <= 210) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (ux,uy,ux+5,uy+5);
    strokeWeight(2);
    line (ux+5,uy+5,ux+213,uy+5);
    strokeWeight(1.5);
    line (ux+213,uy+5,ux+218,uy);
    strokeWeight(0.5);
    line (0,uy,ux,uy);
    line (ux+218,uy,480,uy);
  }   else {
      stroke(#006600);
    strokeWeight(1.5);
    line (ux,uy,ux+5,uy+5);
    strokeWeight(2);
    line (ux+5,uy+5,ux+213,uy+5);
    strokeWeight(1.5);
    line (ux+213,uy+5,ux+218,uy);
    strokeWeight(0.5);
    line (0,uy,ux,uy);
    line (ux+218,uy,480,uy);
  }
  }

  int vx=29;
  for (int vy=215;vy<225;vy+=5) {
     if (mouseY <= 215) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (vx,vy,vx+5,vy+5);
    strokeWeight(2);
    line (vx+5,vy+5,vx+212,vy+5);
    strokeWeight(1.5);
    line (vx+212,vy+5,vx+217,vy);
    strokeWeight(0.5);
    line (0,vy,vx,vy);
    line (vx+217,vy,480,vy);
  }   else {
stroke(#006600);
    strokeWeight(1.5);
    line (vx,vy,vx+5,vy+5);
    strokeWeight(2);
    line (vx+5,vy+5,vx+212,vy+5);
    strokeWeight(1.5);
    line (vx+212,vy+5,vx+217,vy);
    strokeWeight(0.5);
    line (0,vy,vx,vy);
    line (vx+217,vy,480,vy);
  }
}
  int wx=25;
  for (int wy=225;wy<240;wy+=5) {
    if (mouseY <= 225) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (wx,wy,wx+5,wy+5);
    strokeWeight(2);
    line (wx+5,wy+5,wx+216,wy+5);
    strokeWeight(1.5);
    line (wx+216,wy+5,wx+222,wy);
    strokeWeight(0.5);
    line (0,wy,wx,wy);
    line (wx+222,wy,480,wy);
  }   else {
        stroke(#006600);
    strokeWeight(1.5);
    line (wx,wy,wx+5,wy+5);
    strokeWeight(2);
    line (wx+5,wy+5,wx+216,wy+5);
    strokeWeight(1.5);
    line (wx+216,wy+5,wx+222,wy);
    strokeWeight(0.5);
    line (0,wy,wx,wy);
    line (wx+222,wy,480,wy);
  }
  }
  int xx=26;
  for (int xy=240;xy<245;xy+=5) {
    if (mouseY <=240) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (xx,xy,xx+5,xy+5);
    strokeWeight(2);
    line (xx+5,xy+5,xx+212,xy+5);
    strokeWeight(1.5);
    line (xx+212,xy+5,xx+218,xy);
    strokeWeight(0.5);
    line (0,xy,xx,xy);
    line (xx+218,xy,480,xy);
  }   else {
    stroke(#006600);
    strokeWeight(1.5);
    line (xx,xy,xx+5,xy+5);
    strokeWeight(2);
    line (xx+5,xy+5,xx+212,xy+5);
    strokeWeight(1.5);
    line (xx+212,xy+5,xx+218,xy);
    strokeWeight(0.5);
    line (0,xy,xx,xy);
    line (xx+218,xy,480,xy);
  }
  }
  int yx=28;
  for (int yy=245;yy<250;yy+=5) {
    if (mouseY <=245){
      stroke(197,291,183,51);
    strokeWeight(1.5);
    line (yx,yy,yx+5,yy+5);
    strokeWeight(2);
    line (yx+5,yy+5,yx+209,yy+5);
    strokeWeight(1.5);
    line (yx+209,yy+5,yx+214,yy);
    strokeWeight(0.5);
    line (0,yy,yx,yy);
    line (yx+214,yy,480,yy);
  } else {
   stroke(#006600);
    strokeWeight(1.5);
    line (yx,yy,yx+5,yy+5);
    strokeWeight(2);
    line (yx+5,yy+5,yx+209,yy+5);
    strokeWeight(1.5);
    line (yx+209,yy+5,yx+214,yy);
    strokeWeight(0.5);
    line (0,yy,yx,yy);
    line (yx+214,yy,480,yy);
  }
  }  
  int zx=31;
  for (int zy=250;zy<255;zy+=5) {
     if (mouseY < 250) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (zx,zy,zx+5,zy+5);
    strokeWeight(2);
    line (zx+5,zy+5,zx+206,zy+5);
    strokeWeight(1.5);
    line (zx+206,zy+5,zx+211,zy);
    strokeWeight(0.5);
    line (0,zy,zx,zy);
    line (zx+211,zy,480,zy);
  } else {
      stroke(#006600);
    strokeWeight(1.5);
    line (zx,zy,zx+5,zy+5);
    strokeWeight(2);
    line (zx+5,zy+5,zx+206,zy+5);
    strokeWeight(1.5);
    line (zx+206,zy+5,zx+211,zy);
    strokeWeight(0.5);
    line (0,zy,zx,zy);
    line (zx+211,zy,480,zy);
  }
  }  
  int aax=48;
  for (int aay=250;aay<270;aay+=5) {
    if (mouseY <=250){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (aax,aay,aax+5,aay+5);
    strokeWeight(2);
    line (aax+5,aay+5,aax+153,aay+5);
    strokeWeight(1.5);
    line (aax+153,aay+5,aax+158,aay);
    strokeWeight(0.5);
    line (0,aay,aax,aay);
    line (aax+158,aay,480,aay);
  }   else {
     stroke(#006600);
    strokeWeight(1.5);
    line (aax,aay,aax+5,aay+5);
    strokeWeight(2);
    line (aax+5,aay+5,aax+153,aay+5);
    strokeWeight(1.5);
    line (aax+153,aay+5,aax+158,aay);
    strokeWeight(0.5);
    line (0,aay,aax,aay);
    line (aax+158,aay,480,aay);
  }
  }
  
  // took out bbx and bby because it was redundant

  int ccx=46;
  for (int ccy=270;ccy<280;ccy+=5) {
       if (mouseY <=270) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (ccx,ccy,ccx+5,ccy+5);
    strokeWeight(2);
    line (ccx+5,ccy+5,ccx+160,ccy+5);
    strokeWeight(1.5);
    line (ccx+160,ccy+5,ccx+165,ccy);
    strokeWeight(0.5);
    line (0,ccy,ccx,ccy);
    line (ccx+165,ccy,480,ccy);
  } else {
  stroke(#006600);
    strokeWeight(1.5);
    line (ccx,ccy,ccx+5,ccy+5);
    strokeWeight(2);
    line (ccx+5,ccy+5,ccx+160,ccy+5);
    strokeWeight(1.5);
    line (ccx+160,ccy+5,ccx+165,ccy);
    strokeWeight(0.5);
    line (0,ccy,ccx,ccy);
    line (ccx+165,ccy,480,ccy);
  }
  }
  int ddx=47;
  for (int ddy=280;ddy<285;ddy+=5) {
    if (mouseY <=280) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (ddx,ddy,ddx+5,ddy+5);
    strokeWeight(2);
    line (ddx+5,ddy+5,ddx+161,ddy+5);
    strokeWeight(1.5);
    line (ddx+161,ddy+5,ddx+166,ddy);
    strokeWeight(0.5);
    line (0,ddy,ddx,ddy);
    line (ddx+166,ddy,480,ddy);
  }else{
 stroke(#006600);
    strokeWeight(1.5);
    line (ddx,ddy,ddx+5,ddy+5);
    strokeWeight(2);
    line (ddx+5,ddy+5,ddx+161,ddy+5);
    strokeWeight(1.5);
    line (ddx+161,ddy+5,ddx+166,ddy);
    strokeWeight(0.5);
    line (0,ddy,ddx,ddy);
    line (ddx+166,ddy,480,ddy);
  }
  }
  int eex=45;
  for (int eey=285;eey<290;eey+=5) {
    if (mouseY <=285) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (eex,eey,eex+5,eey+5);
    strokeWeight(2);
    line (eex+5,eey+5,eex+164,eey+5);	
    strokeWeight(1.5);
    line (eex+164,eey+5,eex+169,eey);
    strokeWeight(0.5);
    line (0,eey,eex,eey);
    line (eex+169,eey,480,eey);
  } else {
    stroke(#006600);
    strokeWeight(1.5);
    line (eex,eey,eex+5,eey+5);
    strokeWeight(2);
    line (eex+5,eey+5,eex+164,eey+5);	
    strokeWeight(1.5);
    line (eex+164,eey+5,eex+169,eey);
    strokeWeight(0.5);
    line (0,eey,eex,eey);
    line (eex+169,eey,480,eey);
  }
}
  int ffx=42;
  for (int ffy=290;ffy<295;ffy+=5) {
    if (mouseY <=290){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (ffx,ffy,ffx+5,ffy+5);
    strokeWeight(2);
    line (ffx+5,ffy+5,ffx+167,ffy+5);	
    strokeWeight(1.5);
    line (ffx+167,ffy+5,ffx+172,ffy);
    strokeWeight(0.5);
    line (0,ffy,ffx,ffy);
    line (ffx+172,ffy,480,ffy);
  } else {
  stroke(#006600);
    strokeWeight(1.5);
    line (ffx,ffy,ffx+5,ffy+5);
    strokeWeight(2);
    line (ffx+5,ffy+5,ffx+167,ffy+5);	
    strokeWeight(1.5);
    line (ffx+167,ffy+5,ffx+172,ffy);
    strokeWeight(0.5);
    line (0,ffy,ffx,ffy);
    line (ffx+172,ffy,480,ffy);
  }
  }
  int ggx=40;
  for (int ggy=295;ggy<300;ggy+=5) {
    if (mouseY <=295) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (ggx,ggy,ggx+5,ggy+5);
    strokeWeight(2);
    line (ggx+5,ggy+5,ggx+169,ggy+5);	
    strokeWeight(1.5);
    line (ggx+169,ggy+5,ggx+174,ggy);
    strokeWeight(0.5);
    line (0,ggy,ggx,ggy);
    line (ggx+174,ggy,480,ggy);
  }else{
  stroke(#006600);
    strokeWeight(1.5);
    line (ggx,ggy,ggx+5,ggy+5);
    strokeWeight(2);
    line (ggx+5,ggy+5,ggx+169,ggy+5);	
    strokeWeight(1.5);
    line (ggx+169,ggy+5,ggx+174,ggy);
    strokeWeight(0.5);
    line (0,ggy,ggx,ggy);
    line (ggx+174,ggy,480,ggy);
  }
  }
  int hhx=38;
  for (int hhy=300;hhy<305;hhy+=5) {
    if (mouseY <= 300) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (hhx,hhy,hhx+5,hhy+5);
    strokeWeight(2);
    line (hhx+5,hhy+5,hhx+174,hhy+5);	
    strokeWeight(1.5);
    line (hhx+174,hhy+5,hhx+179,hhy);
    strokeWeight(0.5);
    line (0,hhy,hhx,hhy);
    line (hhx+179,hhy,480,hhy);
  }else{
      stroke(#006600);
    strokeWeight(1.5);
    line (hhx,hhy,hhx+5,hhy+5);
    strokeWeight(2);
    line (hhx+5,hhy+5,hhx+174,hhy+5);	
    strokeWeight(1.5);
    line (hhx+174,hhy+5,hhx+179,hhy);
    strokeWeight(0.5);
    line (0,hhy,hhx,hhy);
    line (hhx+179,hhy,480,hhy);
  
  }
  }
  int iix=35;
  for (int iiy=305;iiy<310;iiy+=5) {
    if (mouseY <= 305){
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (iix,iiy,iix+5,iiy+5);
    strokeWeight(2);
    line (iix+5,iiy+5,iix+181,iiy+5);	
    strokeWeight(1.5);
    line (iix+181,iiy+5,iix+184,iiy);
    strokeWeight(0.5);
    line (0,iiy,iix,iiy);
    line (iix+184,iiy,480,iiy);
  }else{
        stroke(#006600);
    strokeWeight(1.5);
    line (iix,iiy,iix+5,iiy+5);
    strokeWeight(2);
    line (iix+5,iiy+5,iix+181,iiy+5);	
    strokeWeight(1.5);
    line (iix+181,iiy+5,iix+184,iiy);
    strokeWeight(0.5);
    line (0,iiy,iix,iiy);
    line (iix+184,iiy,480,iiy);
  }
  }
  int jjx=31;
  for (int jjy=310;jjy<315;jjy+=5) {
    if (mouseY <= 310) {
      stroke(197,291,183,51);
    strokeWeight(1.5);
    line (jjx,jjy,jjx+5,jjy+5);
    strokeWeight(2);
    line (jjx+5,jjy+5,jjx+188,jjy+5);	
    strokeWeight(1.5);
    line (jjx+188,jjy+5,jjx+191,jjy);
    strokeWeight(0.5);
    line (0,jjy,jjx,jjy);
    line (jjx+191,jjy,480,jjy);
  } else{
     stroke(#006600);
    strokeWeight(1.5);
    line (jjx,jjy,jjx+5,jjy+5);
    strokeWeight(2);
    line (jjx+5,jjy+5,jjx+188,jjy+5);	
    strokeWeight(1.5);
    line (jjx+188,jjy+5,jjx+191,jjy);
    strokeWeight(0.5);
    line (0,jjy,jjx,jjy);
    line (jjx+191,jjy,480,jjy);
  }
  }
  int kkx=29;
  for (int kky=315;kky<320;kky+=5) {
    if (mouseY <=310) {
    stroke(197,291,183,51);
    strokeWeight(1.5);
    line (kkx,kky,kkx+5,kky+5);
    strokeWeight(2);
    line (kkx+5,kky+5,kkx+190,kky+5);	
    strokeWeight(1.5);
    line (kkx+190,kky+5,kkx+194,kky);
    strokeWeight(0.5);
    line (0,kky,kkx,kky);
    line (kkx+194,kky,480,kky);
  } else {
  stroke(#006600);
    strokeWeight(1.5);
    line (kkx,kky,kkx+5,kky+5);
    strokeWeight(2);
    line (kkx+5,kky+5,kkx+190,kky+5);	
    strokeWeight(1.5);
    line (kkx+190,kky+5,kkx+194,kky);
    strokeWeight(0.5);
    line (0,kky,kkx,kky);
    line (kkx+194,kky,480,kky);
  }
  }
}














