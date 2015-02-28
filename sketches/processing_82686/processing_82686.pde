
//Hackpact 2012 DIA UNO boxwar_ alexRz.rdsm!!!!!!
int angl = -100; 
float war = 0.00059;
float rdsm;
float flow;
//3456789987654567887654345678987654345788765432
void setup() {
  size(800, 600, P3D);
  smooth();
}
//456789098765432346780098765434567890'09876543
void draw() {
  flow = noise(rdsm)*width;
  rdsm += war;
  ins();
  boxx();
}
//erertyuiooitrerrtyuuytreretrtyuioiuytrttrhk
void ins() {
  translate(mouseX,flow,mouseY);
  rotate( radians(random(angl))); 
  angl++;
}
void boxx() {
  fill(random(100), random(150), random(200), random(255));
  stroke(50, 50, 50, random(255));
  box (flow/24);
  fill(random(50), random(60), random(70), random(255));
  stroke(random(255));
  box(rdsm);
  fill(random(100), random(150), random(200), random(255));
  stroke(random(150));
  box(flow/15);
}
void mousePressed() {
  save(random(20)+".jpg");
}
//INS_RDSM_H4CK_THE_WORLD_IMAGINA_MAYHEM_XPCTUS...


