
Scrollbar bar1, bar2, bar3, bar4, bar5, bar6, bar7, bar8, 
bar9, bar10,
bar11,bar12,bar13,bar14,bar15, bar16, bar17, bar18;
PFont font;

void setup() {
  size(310,500);
  bar1 = new Scrollbar(55,320,80,10,10,100);
  bar2 = new Scrollbar(55,340,80,10,10,100);
  bar3 = new Scrollbar(55,360,80,10,10,100);
  bar4 = new Scrollbar(55,380,80,10,110,200);
  bar5 = new Scrollbar(55,400,80,10,10,100);
  bar6 = new Scrollbar(55,420,80,10,210,300);
  bar7 = new Scrollbar(55,440,80,10,110,200);
  bar8 = new Scrollbar(55,460,80,10,10,100);
  bar9 = new Scrollbar(55,480,80,10,110,200);
  bar10 = new Scrollbar(155,320,80,10,110,200);
  bar11 = new Scrollbar(155,340,80,10,110,200);
  bar12 = new Scrollbar(155,360,80,10,210,300);
  bar13 = new Scrollbar(155,380,80,10,210,300);
  bar14 = new Scrollbar(155,400,80,10,10,100);
  bar15 = new Scrollbar(155,420,80,10,210,300);
  bar16 = new Scrollbar(155,440,80,10,110,200);
  bar17 = new Scrollbar(155,460,80,10,210,300);
  bar18 = new Scrollbar(155,480,80,10,210,300);
  font = loadFont("Cambria-20.vlw");
  textFont(font);
}

void draw() {
background(204);
bar1.update(mouseX, mouseY);
bar1.display();
bar2.update(mouseX, mouseY);
bar2.display();
bar3.update(mouseX,mouseY);
bar3.display();
bar4.update(mouseX,mouseY);
bar4.display();
bar5.update(mouseX,mouseY);
bar5.display();
bar6.update(mouseX,mouseY);
bar6.display();
bar7.update(mouseX,mouseY);
bar7.display();
bar8.update(mouseX,mouseY);
bar8.display();
bar9.update(mouseX,mouseY);
bar9.display();
bar10.update(mouseX,mouseY);
bar10.display();
bar11.update(mouseX,mouseY);
bar11.display();
bar12.update(mouseX,mouseY);
bar12.display();
bar13.update(mouseX,mouseY);
bar13.display();
bar14.update(mouseX,mouseY);
bar14.display();
bar15.update(mouseX,mouseY);
bar15.display();
bar16.update(mouseX,mouseY);
bar16.display();
bar17.update(mouseX,mouseY);
bar17.display();
bar18.update(mouseX,mouseY);
bar18.display();
int a = int(bar1.getPos());
int b = int(bar2.getPos());
int c = int(bar3.getPos());
int d = int(bar4.getPos());
int e = int(bar5.getPos());
int f = int(bar6.getPos());
int g = int(bar7.getPos());
int h = int(bar8.getPos());
int i = int(bar9.getPos());
int j = int(bar10.getPos());
int k = int(bar11.getPos());
int l = int(bar12.getPos());
int m = int(bar13.getPos());
int n = int(bar14.getPos());
int o = int(bar15.getPos());
int p = int(bar16.getPos());
int q = int(bar17.getPos());
int r = int(bar18.getPos());
line(a,b,c,d); //Down Line1
line(c,d,e,f);

line(g,h,i,j); //Down Line2
line(i,j,k,l);

line(m,n,o,p); //Down Line3
line(o,p,q,r);

line(a,b,g,h); // S
line(g,h,m,n);

line(c,d,i,j); //W
line(i,j,o,p); 

line(e,f,k,l); // C
line(k,l,q,r);

ellipse(a,b,5,5);
ellipse(c,d,5,5);
ellipse(e,f,5,5);
ellipse(g,h,5,5);
ellipse(i,j,5,5);
ellipse(k,l,5,5);
ellipse(m,n,5,5);
ellipse(o,p,5,5);
ellipse(q,r,5,5);
}

void mousePressed() {
  bar1.press(mouseX,mouseY);
  bar2.press(mouseX,mouseY);
  bar3.press(mouseX,mouseY);
  bar4.press(mouseX,mouseY);
  bar5.press(mouseX,mouseY);
  bar6.press(mouseX,mouseY);
  bar7.press(mouseX,mouseY);
  bar8.press(mouseX,mouseY);
  bar9.press(mouseX,mouseY);
  bar10.press(mouseX,mouseY);
  bar11.press(mouseX,mouseY);
  bar12.press(mouseX,mouseY);
  bar13.press(mouseX,mouseY);
  bar14.press(mouseX,mouseY);
  bar15.press(mouseX,mouseY);
  bar16.press(mouseX,mouseY);
  bar17.press(mouseX,mouseY);
  bar18.press(mouseX,mouseY);
}

void mouseReleased() {
  bar1.release();
  bar2.release();
  bar3.release();
  bar4.release();
  bar5.release();
  bar6.release();
  bar7.release();
  bar8.release();
  bar9.release();
  bar10.release();
  bar11.release();
  bar12.release();
  bar13.release();
  bar14.release();
  bar15.release();
  bar16.release();
  bar17.release();
  bar18.release();
}

