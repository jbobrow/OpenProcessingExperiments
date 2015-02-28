
int cubierta;
int mastil;
int vela1;
int vela2;
float tib;

void setup () {
  size (700, 700);
  smooth();
  cubierta=50;
  mastil=130;
  vela1=125;
  vela2=135;
  tib=0;
}

void draw() {
  noStroke();
  background(200,240, 240);
  fill (0, 0, 50);
  rect (0, 400, 700, 700);
  
  fill (139, 70, 20);
  quad (cubierta, 380, cubierta+170, 370, cubierta+100, 400, cubierta+20, 400);
  fill(255,255,255);
  stroke (255, 255, 255);
  strokeWeight (2);
  line (mastil, 150, mastil, 374);
  noStroke ();
  fill (200, 200, 200);
  triangle (vela1, 150, vela1, 370, vela1-70, 370);
  triangle (vela2, 150, vela2, 370, vela2+75, 370);
  fill (50, 50, 50);
  triangle (tib, 400, tib+35, 400, tib, 375);
  
  cubierta=cubierta+1;
  mastil=mastil+1;
  vela1=vela1+1;
  vela2=vela2+1;
  tib=tib+.9;
}

