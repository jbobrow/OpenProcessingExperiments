
PGraphics g;
int offsetX, offsetY, dst1, dst2, rad1, rad2, w,h;

void setup() {
  dst1=50; dst2=49; rad1=30; rad2=26;
  offsetX=3*dst1;  offsetY=3*dst1;
  size(800,800);
  w=2*width; h=2*height;
  g=createGraphics(w,h,P2D);
  g.beginDraw();
  g.background(102,153,53);
  g.fill(40,30,20);
  g.rect(0,0,w,h);
  g.fill(255,0,102);
  for (int i=1;i<w/dst1;i++)
      for (int j=1;j<h/dst1;j++)
          g.ellipse(i*dst1,j*dst1,rad1,rad1);
  g.endDraw();
}

void draw() {
  background(255);
  drawBG(); 
  int sw,sh;
  int odx, ody;
  int destW,destH;
  sw=min(w-offsetX,width); odx=min(0,offsetX);
  sh=min(h-offsetY,height); ody=min(0,offsetY);
  destW=min(width,w-offsetX);
  destH=min(height,h-offsetY);
  blend(g,offsetX,offsetY,sw,sh,0,0,destW,destH,DARKEST);
}

void drawBG(){
  fill(127);
  rect(0,0,width,height);
  fill(255);
  for (int i=0;i<width/dst2+1;i++)
      for (int j=0;j<height/dst2+1;j++)
          ellipse(i*dst2,j*dst2,rad2,rad2);
}

void mouseDragged() {
  int dx=pmouseX-mouseX;
  int dy=pmouseY-mouseY;
  offsetX+=dx; if (offsetX>4*dst1) offsetX-=dst1; 
          else if (offsetX<2*dst1) offsetX+=dst1; 
  offsetY+=dy; if (offsetY>4*dst1) offsetY-=dst1;
          else if (offsetY<2*dst1) offsetY+=dst1; 
}

