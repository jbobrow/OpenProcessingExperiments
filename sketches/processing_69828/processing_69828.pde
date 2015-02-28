
void setup() {
  size (800, 800);
  background (0);
  smooth();
  strokeWeight(0);
  
  
}


void draw () {
  int r = #ca0000;
  int b = #0052ce;
  int y = #fed01e;
  fill(r); BOXES(0,0);
  fill(r); BOXES(0,660);
  fill(r); BOXES(440,560);
  fill(255); BOXES(0,140);
  fill(255); BOXES(0,250);
  fill(255); HORZ (220,360);
  fill(r); HORZ (0,340);
  fill(y); HORZ (0,300);
  fill(y); HORZ (0,260);
  fill(b); VERT(0,380);
  fill(b); VERT(-110,500);
  fill(255); VERT(-10,500);
  fill(y); VERT(-40,500);
  fill(120); VERT(520,500);
  fill(y); VERT(205,500);
  fill(b); VERT(0,0);
  fill(y); HORZ (0,0);
  fill(y); BIGBOX (450,20);
  fill(b); BOXES (400,390);
  fill(255); BOXES (670,450);
  fill(255); BOXES (200,200);
  fill(255); LINEV (110,10); 
  fill(b); LINEV (310,-370); 
  fill(y); LINEH (150,760); 
  fill(r); BOXES (150,0);
  fill(y); HORZ (180,60);
}
void BOXES (int x, int y) {
  quad(x+10,y+10,x+10,y+110,x+110,y+110,x+110,y+10);
}
void VERT (int x, int y) {
  quad(x+120,y+10,x+120,y+110,x+130,y+110,x+130,y+10);
}
void HORZ (int x, int y) {
  quad(x+10,y+120,x+10,y+130,x+110,y+130,x+110,y+120);
}
void LINEV (int x, int y) {
  quad(x+30,y+10,x+30,y+730,x+40,y+730,x+40,y+10);
}
void LINEH (int x, int y) {
  quad(x+30,y+10,x+30,y+20,x+740,y+20,x+740,y+10);
}
void BIGBOX (int x, int y) {
  quad(x,y,x,y+350,x+350,y+350,x+350,y);
}
//void CLRBOX (int x, int y) {
//  quad(x,y+10,x,y+110,x+150,y+110,x+150,y+10);
//}
//void REDBOX (int x, int y) {
//  quad(x+30,y+90,x+30,y+30,x+50,y+30,x+50,y+90);
//}

