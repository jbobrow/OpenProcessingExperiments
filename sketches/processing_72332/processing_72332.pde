
//Matt Porter  
//Introduction to Digital Media Fall 2012 - Assignment 1B
//Section B
//Sep 13 2012

//draw shapes  by clicking within the area of a certain square


boolean one1 = false;
boolean two2 = false;
boolean three = false;
boolean four = false;
boolean five = false;
boolean six = false;
boolean seven = false;
boolean eight = false;
boolean nine = false;
boolean zero = false;
boolean a = false;
boolean b = false;
boolean c = false;
boolean d = false;
boolean e = false;
boolean f = false;
boolean g = false;
boolean h = false;
boolean i = false;
boolean j = false;
boolean k = false;
boolean l = false;
boolean m = false;
boolean n = false;
boolean o = false;
boolean p = false;
boolean q = false;
boolean r = false;
boolean s = false;
boolean t = false;
boolean u = false;
boolean v = false;
boolean w = false;
boolean x = false;
boolean y = false;
boolean z = false;
boolean aa = false;
boolean ab = false;
boolean ac = false;
boolean ad = false;
boolean ae = false;
boolean af = false;
boolean ag = false;
boolean ah = false;
boolean ai = false;
boolean aj = false;
boolean ak = false;
boolean al = false;
boolean am = false;
boolean an = false;
boolean ao = false;
boolean ap = false;
boolean aq = false;
boolean ar = false;
boolean as = false;
boolean at = false;
boolean au = false;
boolean av = false;
boolean aw = false;
boolean ax = false;
boolean ay = false;
boolean az = false;
boolean ba = false;
boolean bb = false;
boolean bc = false;
boolean bd = false;
boolean be = false;
boolean bf = false;
boolean bg = false;
boolean bh = false;
boolean bi = false;
boolean bj = false;
boolean bk = false;
boolean bl = false;
boolean bm = false;
boolean bn = false;
boolean bo = false;
boolean bp = false;
boolean bq = false;
boolean br = false;
boolean bs = false;
boolean bt = false;
boolean bu = false;
boolean bv = false;
boolean bw = false;
boolean bx = false;
boolean by = false;
boolean bz = false;
boolean ca = false;
boolean cb = false;
boolean cc = false;
boolean cd = false;
boolean ce = false;
boolean cf = false;
boolean cg = false;
boolean ch = false;
boolean ci = false;
boolean cj = false;
boolean ck = false;
boolean cl = false;
boolean cm = false;
boolean cn = false;
boolean co = false;
boolean cp = false;
boolean cq = false;
boolean cr = false;
boolean cs = false;
boolean ct = false;
boolean cu = false;
boolean cv = false;
boolean cw = false;
boolean cx = false;
boolean cy = false;
boolean cz = false;
boolean da = false;
boolean db = false;
boolean dc = false;
boolean dd = false;
boolean de = false;
boolean df = false;
boolean dg = false;
boolean dh = false;
boolean di = false;
boolean dj = false;
boolean dk = false;
boolean dl = false;
boolean dm = false;
boolean dn = false;
boolean ddo = false;
boolean dp = false;
boolean dq = false;
boolean dr = false;
boolean ds = false;
boolean dt = false;
boolean du = false;
boolean dv = false;
boolean dw = false;
boolean dx = false;
boolean dy = false;
boolean dz = false;
boolean ea = false;
boolean eb = false;
boolean ec = false;
boolean ed = false;
boolean ee = false;
boolean ef = false;
boolean eg = false;
boolean eh = false;
boolean ei = false;
boolean ej = false;
boolean ek = false;
boolean el = false;
boolean em = false;
boolean en = false;
boolean eo = false;
boolean ep = false;
boolean eq = false;
boolean er = false;
boolean es = false;
boolean et = false;
boolean eu = false;
boolean ev = false;
boolean ew = false;
boolean ex = false;
boolean ey = false;
boolean ez = false;
boolean fa = false;
boolean fb = false;
boolean fc = false;
boolean fd = false;
boolean fe = false;
boolean ff = false;
boolean fg = false;
boolean fh = false;
boolean fi = false;
boolean fj = false;
boolean fk = false;
boolean fl = false;
boolean fm = false;
boolean fn = false;
boolean fo = false;
boolean fp = false;
boolean fq = false;
boolean fr = false;
boolean fs = false;
boolean ft = false;
boolean fu = false;
boolean fv = false;
boolean fw = false;
boolean fx = false;
boolean fy = false;
boolean fz = false;
boolean ga = false;
boolean gb = false;
boolean gc = false;
boolean gd = false;
boolean ge = false;
boolean gf = false;
boolean gg = false;
boolean gh = false;
boolean gi = false;
boolean gj = false;
boolean gk = false;
boolean gl = false;
boolean gm = false;
boolean gn = false;
boolean go = false;
boolean gp = false;
boolean gq = false;
boolean gr = false;
boolean gs = false;
boolean gt = false;
boolean gu = false;
boolean gv = false;
boolean gw = false;
boolean gx = false;
boolean gy = false;
boolean gz = false;


float value = 0; 

void setup() {
  size(1200, 600);
}

void draw() {
  background(255);

  if (((mouseX<60) && (mouseX>0)) && ((0<mouseY) && (mouseY<60))) {
    // stroke(230);
    //    fill(230);
    //    rect(0, 0, 60, 60);
  }
  if (mousePressed==true && ((mouseX<60) && (mouseX>0)) && ((0<mouseY) && (mouseY<60))) {
    
  }
  if (one1) {
    stroke(0);
    fill(0);
    rect(0, 0, 60, 60);
  }
 
 
  if (((mouseX<120) && (mouseX>60)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      two2=!two2;
    }
  }
  if (two2) {
    stroke(0);
    fill(0);
    rect(60, 0, 60, 60);
  }


 if (((mouseX<180) && (mouseX>120)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      three=!three;
    }
  }
  if (three) {
    stroke(0);
    fill(0);
    rect(120, 0, 60, 60);
  }


if (((mouseX<240) && (mouseX>180)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      four=!four;
    }
  }
  if (four) {
    stroke(0);
    fill(0);
    rect(180, 0, 60, 60);
  }
  
  
  if (((mouseX<300) && (mouseX>240)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      five=!five;
    }
  }
  if (five) {
    stroke(0);
    fill(0);
    rect(240, 0, 60, 60);
  }


if (((mouseX<360) && (mouseX>300)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      six=!six;
    }
  }
  if (six) {
    stroke(0);
    fill(0);
    rect(300, 0, 60, 60);
  }
  
  if (((mouseX<420) && (mouseX>360)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      seven=!seven;
    }
  }
  if (seven) {
    stroke(0);
    fill(0);
    rect(360, 0, 60, 60);
  }
  
  if (((mouseX<480) && (mouseX>420)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      eight=!eight;
    }
  }
  if (eight) {
    stroke(0);
    fill(0);
    rect(420, 0, 60, 60);
  }
  
  
  if (((mouseX<540) && (mouseX>480)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      nine=!nine;
    }
  }
  if (nine) {
    stroke(0);
    fill(0);
    rect(480, 0, 60, 60);
  }
  
  if (((mouseX<600) && (mouseX>540)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      zero=!zero;
    }
  }
  if (zero) {
    stroke(0);
    fill(0);
    rect(540, 0, 60, 60);
  }
  
   if (((mouseX<660) && (mouseX>600)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      a=!a;
    }
  }
  if (a) {
    stroke(0);
    fill(0);
    rect(600, 0, 60, 60);
  }
  
  if (((mouseX<720) && (mouseX>660)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      b=!b;
    }
  }
  if (b) {
    stroke(0);
    fill(0);
    rect(660, 0, 60, 60);
  }
  
   if (((mouseX<780) && (mouseX>720)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      c=!c;
    }
  }
  if (c) {
    stroke(0);
    fill(0);
    rect(720, 0, 60, 60);
  }
  
   if (((mouseX<840) && (mouseX>780)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      d=!d;
    }
  }
  if (d) {
    stroke(0);
    fill(0);
    rect(780, 0, 60, 60);
  }
  
   if (((mouseX<900) && (mouseX>840)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      e=!e;
    }
  }
  if (e) {
    stroke(0);
    fill(0);
    rect(840, 0, 60, 60);
  }
  
   if (((mouseX<960) && (mouseX>900)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      f=!f;
    }
  }
  if (f) {
    stroke(0);
    fill(0);
    rect(900, 0, 60, 60);
  }
  
  if (((mouseX<1020) && (mouseX>960)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      g=!g;
    }
  }
  if (g) {
    stroke(0);
    fill(0);
    rect(960, 0, 60, 60);
  }
   if (((mouseX<1080) && (mouseX>1020)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      h=!h;
    }
  }
  if (h) {
    stroke(0);
    fill(0);
    rect(1020, 0, 60, 60);
  }
  
   if (((mouseX<1140) && (mouseX>1080)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      i=!i;
    }
  }
  if (i) {
    stroke(0);
    fill(0);
    rect(1080, 0, 60, 60);
  }
  
    if (((mouseX<1200) && (mouseX>1140)) && ((0<mouseY) && (mouseY<60))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      j=!j;
    }
  }
  if (j) {
    stroke(0);
    fill(0);
    rect(1140, 0, 60, 60);
  }
  
   if (((mouseX<60) && (mouseX>0)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      k=!k;
    }
  }
  if (k) {
    stroke(0);
    fill(0);
    rect(0, 60, 60, 60);
  }
 
   if (((mouseX<120) && (mouseX>60)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      l=!l;
    }
  }
  if (l) {
    stroke(0);
    fill(0);
    rect(60, 60, 60, 60);
  }
  
   if (((mouseX<180) && (mouseX>120)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      m=!m;
    }
  }
  if (m) {
    stroke(0);
    fill(0);
    rect(120, 60, 60, 60);
  }
  
    if (((mouseX<240) && (mouseX>180)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      n=!n;
    }
  }
  if (n) {
    stroke(0);
    fill(0);
    rect(180, 60, 60, 60);
  }
  
   if (((mouseX<300) && (mouseX>240)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      o=!o;
    }
  }
  if (o) {
    stroke(0);
    fill(0);
    rect(240, 60, 60, 60);
  }
  
    if (((mouseX<360) && (mouseX>300)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      p=!p;
    }
  }
  if (p) {
    stroke(0);
    fill(0);
    rect(300, 60, 60, 60);
  }
  
   if (((mouseX<420) && (mouseX>360)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      q=!q;
    }
  }
  if (q) {
    stroke(0);
    fill(0);
    rect(360, 60, 60, 60);
  }
  
  if (((mouseX<480) && (mouseX>420)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      r=!r;
    }
  }
  if (r) {
    stroke(0);
    fill(0);
    rect(420, 60, 60, 60);
  }
  
  if (((mouseX<540) && (mouseX>480)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      s=!s;
    }
  }
  if (s) {
    stroke(0);
    fill(0);
    rect(480, 60, 60, 60);
  }
  
   if (((mouseX<600) && (mouseX>540)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      t=!t;
    }
  }
  if (t) {
    stroke(0);
    fill(0);
    rect(540, 60, 60, 60);
  }
  
  
  if (((mouseX<660) && (mouseX>600)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      u=!u;
    }
  }
  if (u) {
    stroke(0);
    fill(0);
    rect(600, 60, 60, 60);
  }
  
   if (((mouseX<720) && (mouseX>660)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      v=!v;
    }
  }
  if (v) {
    stroke(0);
    fill(0);
    rect(660, 60, 60, 60);
  }
  
  if (((mouseX<780) && (mouseX>720)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      w=!w;
    }
  }
  if (w) {
    stroke(0);
    fill(0);
    rect(720, 60, 60, 60);
  }
  
   if (((mouseX<840) && (mouseX>780)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      x=!x;
    }
  }
  if (x) {
    stroke(0);
    fill(0);
    rect(780, 60, 60, 60);
  }
  
   if (((mouseX<900) && (mouseX>840)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      y=!y;
    }
  }
  if (y) {
    stroke(0);
    fill(0);
    rect(840, 60, 60, 60);
  }
  
   if (((mouseX<960) && (mouseX>900)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      z=!z;
    }
  }
  if (z) {
    stroke(0);
    fill(0);
    rect(900, 60, 60, 60);
  }
  
  if (((mouseX<1020) && (mouseX>960)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ab=!ab;
    }
  }
  if (ab) {
    stroke(0);
    fill(0);
    rect(960, 60, 60, 60);
  }
  
  if (((mouseX<1080) && (mouseX>1020)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ac=!ac;
    }
  }
  if (ac) {
    stroke(0);
    fill(0);
    rect(1020, 60, 60, 60);
  }
  
   if (((mouseX<1140) && (mouseX>1080)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ad=!ad;
    }
  }
  if (ad) {
    stroke(0);
    fill(0);
    rect(1080, 60, 60, 60);
  }
  if (((mouseX<1200) && (mouseX>1140)) && ((60<mouseY) && (mouseY<120))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ae=!ae;
    }
  }
  if (ae) {
    stroke(0);
    fill(0);
    rect(1140, 60, 60, 60);
  }
  
  if (((mouseX<60) && (mouseX>0)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      af=!af;
    }
  }
  if (af) {
    stroke(0);
    fill(0);
    rect(0, 120, 60, 60);
  }
  
   if (((mouseX<120) && (mouseX>60)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ag=!ag;
    }
  }
  if (ag) {
    stroke(0);
    fill(0);
    rect(60, 120, 60, 60);
  }
  
   if (((mouseX<180) && (mouseX>120)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ah=!ah;
    }
  }
  if (ah) {
    stroke(0);
    fill(0);
    rect(120, 120, 60, 60);
  }
  
    if (((mouseX<240) && (mouseX>180)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ai=!ai;
    }
  }
  if (ai) {
    stroke(0);
    fill(0);
    rect(180, 120, 60, 60);
  }
  
   if (((mouseX<300) && (mouseX>240)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      aj=!aj;
    }
  }
  if (aj) {
    stroke(0);
    fill(0);
    rect(240, 120, 60, 60);
  }
  
  if (((mouseX<360) && (mouseX>300)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ak=!ak;
    }
  }
  if (ak) {
    stroke(0);
    fill(0);
    rect(300, 120, 60, 60);
  }
 
  if (((mouseX<420) && (mouseX>360)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      al=!al;
    }
  }
  if (al) {
    stroke(0);
    fill(0);
    rect(360, 120, 60, 60);
  }
  
   if (((mouseX<480) && (mouseX>420)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      am=!am;
    }
  }
  if (am) {
    stroke(0);
    fill(0);
    rect(420, 120, 60, 60);
  }
  
   if (((mouseX<540) && (mouseX>480)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      an=!an;
    }
  }
  if (an) {
    stroke(0);
    fill(0);
    rect(480, 120, 60, 60);
  }
  
  if (((mouseX<600) && (mouseX>540)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ao=!ao;
    }
  }
  if (ao) {
    stroke(0);
    fill(0);
    rect(540, 120, 60, 60);
  }
  
   if (((mouseX<660) && (mouseX>600)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ap=!ap;
    }
  }
  if (ap) {
    stroke(0);
    fill(0);
    rect(600, 120, 60, 60);
  }
  
    if (((mouseX<720) && (mouseX>660)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      aq=!aq;
    }
  }
  if (aq) {
    stroke(0);
    fill(0);
    rect(660, 120, 60, 60);
  }
  
  if (((mouseX<780) && (mouseX>720)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ar=!ar;
    }
  }
  if (ar) {
    stroke(0);
    fill(0);
    rect(720, 120, 60, 60);
  }
  
  if (((mouseX<840) && (mouseX>780)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      as=!as;
    }
  }
  if (as) {
    stroke(0);
    fill(0);
    rect(780, 120, 60, 60);
  }
  
   if (((mouseX<900) && (mouseX>840)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      at=!at;
    }
  }
  if (at) {
    stroke(0);
    fill(0);
    rect(840, 120, 60, 60);
  }
  
   if (((mouseX<960) && (mouseX>900)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      au=!au;
    }
  }
  if (au) {
    stroke(0);
    fill(0);
    rect(900, 120, 60, 60);
  }
  
   if (((mouseX<1020) && (mouseX>960)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      av=!av;
    }
  }
  if (av) {
    stroke(0);
    fill(0);
    rect(960, 120, 60, 60);
  }
  
   if (((mouseX<1080) && (mouseX>1020)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      aw=!aw;
    }
  }
  if (aw) {
    stroke(0);
    fill(0);
    rect(1020, 120, 60, 60);
  }
  
  if (((mouseX<1140) && (mouseX>1080)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ax=!ax;
    }
  }
  if (ax) {
    stroke(0);
    fill(0);
    rect(1080, 120, 60, 60);
  }
  
  if (((mouseX<1200) && (mouseX>1140)) && ((120<mouseY) && (mouseY<180))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ay=!ay;
    }
  }
  if (ay) {
    stroke(0);
    fill(0);
    rect(1140, 120, 60, 60);
  }
  
   if (((mouseX<60) && (mouseX>0)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      az=!az;
    }
  }
  if (az) {
    stroke(0);
    fill(0);
    rect(0, 180, 60, 60);
  }
  
  if (((mouseX<120) && (mouseX>60)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ba=!ba;
    }
  }
  if (ba) {
    stroke(0);
    fill(0);
    rect(60, 180, 60, 60);
  }
  
   if (((mouseX<180) && (mouseX>120)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bb=!bb;
    }
  }
  if (bb) {
    stroke(0);
    fill(0);
    rect(120, 180, 60, 60);
  }
  
  if (((mouseX<240) && (mouseX>180)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bc=!bc;
    }
  }
  if (bc) {
    stroke(0);
    fill(0);
    rect(180, 180, 60, 60);
  }
   if (((mouseX<300) && (mouseX>240)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bd=!bd;
    }
  }
  if (bd) {
    stroke(0);
    fill(0);
    rect(240, 180, 60, 60);
  }
  
  if (((mouseX<360) && (mouseX>300)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      be=!be;
    }
  }
  if (be) {
    stroke(0);
    fill(0);
    rect(300, 180, 60, 60);
  }
  
   if (((mouseX<480) && (mouseX>360)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bf=!bf;
    }
  }
  if (bf) {
    stroke(0);
    fill(0);
    rect(360, 180, 60, 60);
  }
  
  if (((mouseX<540) && (mouseX>480)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bg=!bg;
    }
  }
  if (bg) {
    stroke(0);
    fill(0);
    rect(480, 180, 60, 60);
  }
  
   if (((mouseX<600) && (mouseX>540)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bh=!bh;
    }
  }
  if (bh) {
    stroke(0);
    fill(0);
    rect(540, 180, 60, 60);
  }
  if (((mouseX<660) && (mouseX>600)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bi=!bi;
    }
  }
  if (bi) {
    stroke(0);
    fill(0);
    rect(600, 180, 60, 60);
  }
  
  if (((mouseX<720) && (mouseX>660)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bj=!bj;
    }
  }
  if (bj) {
    stroke(0);
    fill(0);
    rect(660, 180, 60, 60);
  }
  
   if (((mouseX<780) && (mouseX>720)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bk=!bk;
    }
  }
  if (bk) {
    stroke(0);
    fill(0);
    rect(720, 180, 60, 60);
  }
  
  
   if (((mouseX<840) && (mouseX>780)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bl=!bl;
    }
  }
  if (bl) {
    stroke(0);
    fill(0);
    rect(780, 180, 60, 60);
  }
  
  if (((mouseX<900) && (mouseX>840)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bm=!bm;
    }
  }
  if (bm) {
    stroke(0);
    fill(0);
    rect(840, 180, 60, 60);
  }
  
   if (((mouseX<960) && (mouseX>900)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bn=!bn;
    }
  }
  if (bn) {
    stroke(0);
    fill(0);
    rect(900, 180, 60, 60);
  }
  
  if (((mouseX<1020) && (mouseX>960)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bo=!bo;
    }
  }
  if (bo) {
    stroke(0);
    fill(0);
    rect(960, 180, 60, 60);
  }
  
  if (((mouseX<1080) && (mouseX>1020)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bp=!bp;
    }
  }
  if (bp) {
    stroke(0);
    fill(0);
    rect(1020, 180, 60, 60);
  }
  
   if (((mouseX<1140) && (mouseX>1080)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bq=!bq;
    }
  }
  if (bq) {
    stroke(0);
    fill(0);
    rect(1080, 180, 60, 60);
  }
  
  if (((mouseX<1200) && (mouseX>1140)) && ((180<mouseY) && (mouseY<240))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      br=!br;
    }
  }
  if (br) {
    stroke(0);
    fill(0);
    rect(1140, 180, 60, 60);
  }
  
  if (((mouseX<60) && (mouseX>0)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bs=!bs;
    }
  }
  if (bs) {
    stroke(0);
    fill(0);
    rect(0, 240, 60, 60);
  }
  
   if (((mouseX<120) && (mouseX>60)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bt=!bt;
    }
  }
  if (bt) {
    stroke(0);
    fill(0);
    rect(60, 240, 60, 60);
  }
  
  if (((mouseX<180) && (mouseX>120)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bu=!bu;
    }
  }
  if (bu) {
    stroke(0);
    fill(0);
    rect(120, 240, 60, 60);
  }
  
  
   if (((mouseX<240) && (mouseX>180)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bv=!bv;
    }
  }
  if (bv) {
    stroke(0);
    fill(0);
    rect(180, 240, 60, 60);
  }
  
   if (((mouseX<300) && (mouseX>240)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bw=!bw;
    }
  }
  if (bw) {
    stroke(0);
    fill(0);
    rect(240, 240, 60, 60);
  }
  
   if (((mouseX<360) && (mouseX>300)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bx=!bx;
    }
  }
  if (bx) {
    stroke(0);
    fill(0);
    rect(300, 240, 60, 60);
  }
  
   if (((mouseX<420) && (mouseX>360)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      by=!by;
    }
  }
  if (by) {
    stroke(0);
    fill(0);
    rect(360, 240, 60, 60);
  }
  
   if (((mouseX<480) && (mouseX>420)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      bz=!bz;
    }
  }
  if (bz) {
    stroke(0);
    fill(0);
    rect(420, 240, 60, 60);
  }
  
   if (((mouseX<540) && (mouseX>480)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ca=!ca;
    }
  }
  if (ca) {
    stroke(0);
    fill(0);
    rect(480, 240, 60, 60);
  }
  
   if (((mouseX<600) && (mouseX>540)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cb=!cb;
    }
  }
  if (cb) {
    stroke(0);
    fill(0);
    rect(540, 240, 60, 60);
  }

   if (((mouseX<660) && (mouseX>600)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cc=!cc;
    }
  }
  if (cc) {
    stroke(0);
    fill(0);
    rect(600, 240, 60, 60);
  }
  
  if (((mouseX<720) && (mouseX>660)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cd=!cd;
    }
  }
  if (cd) {
    stroke(0);
    fill(0);
    rect(660, 240, 60, 60);
  }
  
    if (((mouseX<780) && (mouseX>720)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ce=!ce;
    }
  }
  if (ce) {
    stroke(0);
    fill(0);
    rect(720, 240, 60, 60);
  }
 
  if (((mouseX<840) && (mouseX>780)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cf=!cf;
    }
  }
  if (cf) {
    stroke(0);
    fill(0);
    rect(780, 240, 60, 60);
  } 
  
   if (((mouseX<900) && (mouseX>840)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cg=!cg;
    }
  }
  if (cg) {
    stroke(0);
    fill(0);
    rect(840, 240, 60, 60);
  } 
  
   if (((mouseX<960) && (mouseX>900)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ch=!ch;
    }
  }
  if (ch) {
    stroke(0);
    fill(0);
    rect(900, 240, 60, 60);
  } 
  
   if (((mouseX<1020) && (mouseX>960)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ci=!ci;
    }
  }
  if (ci) {
    stroke(0);
    fill(0);
    rect(960, 240, 60, 60);
  } 
  
   if (((mouseX<1080) && (mouseX>1020)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cj=!cj;
    }
  }
  if (cj) {
    stroke(0);
    fill(0);
    rect(1020, 240, 60, 60);
  } 
  
   if (((mouseX<1140) && (mouseX>1080)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ck=!ck;
    }
  }
  if (ck) {
    stroke(0);
    fill(0);
    rect(1080, 240, 60, 60);
  }
  
   if (((mouseX<1200) && (mouseX>1140)) && ((240<mouseY) && (mouseY<300))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cl=!cl;
    }
  }
  if (cl) {
    stroke(0);
    fill(0);
    rect(1140, 240, 60, 60);
  }
  
   if (((mouseX<60) && (mouseX>0)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cm=!cm;
    }
  }
  if (cm) {
    stroke(0);
    fill(0);
    rect(0, 300, 60, 60);
  }
  
  if (((mouseX<120) && (mouseX>60)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cn=!cn;
    }
  }
  if (cn) {
    stroke(0);
    fill(0);
    rect(60, 300, 60, 60);
  }
  
  if (((mouseX<180) && (mouseX>120)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      co=!co;
    }
  }
  if (co) {
    stroke(0);
    fill(0);
    rect(120, 300, 60, 60);
  }
  
  if (((mouseX<240) && (mouseX>180)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cp=!cp;
    }
  }
  if (cp) {
    stroke(0);
    fill(0);
    rect(180, 300, 60, 60);
  }
  
  if (((mouseX<300) && (mouseX>240)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cq=!cq;
    }
  }
  if (cq) {
    stroke(0);
    fill(0);
    rect(240, 300, 60, 60);
  }
  
   if (((mouseX<360) && (mouseX>300)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cr=!cr;
    }
  }
  if (cr) {
    stroke(0);
    fill(0);
    rect(300, 300, 60, 60);
  }
  
   if (((mouseX<480) && (mouseX>420)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cs=!cs;
    }
  }
  if (cs) {
    stroke(0);
    fill(0);
    rect(420, 300, 60, 60);
  }
  
  if (((mouseX<540) && (mouseX>480)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ct=!ct;
    }
  }
  if (ct) {
    stroke(0);
    fill(0);
    rect(480, 300, 60, 60);
  }
  
  if (((mouseX<600) && (mouseX>540)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cu=!cu;
    }
  }
  if (cu) {
    stroke(0);
    fill(0);
    rect(540, 300, 60, 60);
  }
  
  if (((mouseX<660) && (mouseX>600)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cv=!cv;
    }
  }
  if (cv) {
    stroke(0);
    fill(0);
    rect(600, 300, 60, 60);
  }
  
  if (((mouseX<720) && (mouseX>660)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cw=!cw;
    }
  }
  if (cw) {
    stroke(0);
    fill(0);
    rect(660, 300, 60, 60);
  }
  
   if (((mouseX<780) && (mouseX>720)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cx=!cx;
    }
  }
  if (cx) {
    stroke(0);
    fill(0);
    rect(720, 300, 60, 60);
  }
  
   if (((mouseX<840) && (mouseX>780)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cy=!cy;
    }
  }
  if (cy) {
    stroke(0);
    fill(0);
    rect(780, 300, 60, 60);
  }
  
  if (((mouseX<900) && (mouseX>840)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      cz=!cz;
    }
  }
  if (cz) {
    stroke(0);
    fill(0);
    rect(840, 300, 60, 60);
  }
  
   if (((mouseX<420) && (mouseX>360)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      da=!da;
    }
  }
  if (da) {
    stroke(0);
    fill(0);
    rect(360, 300, 60, 60);
  }
  
  if (((mouseX<960) && (mouseX>900)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      db=!db;
    }
  }
  if (db) {
    stroke(0);
    fill(0);
    rect(900, 300, 60, 60);
  }
  
  if (((mouseX<1020) && (mouseX>960)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dc=!dc;
    }
  }
  if (dc) {
    stroke(0);
    fill(0);
    rect(960, 300, 60, 60);
  }
  
  if (((mouseX<1080) && (mouseX>1020)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dd=!dd;
    }
  }
  if (dd) {
    stroke(0);
    fill(0);
    rect(1020, 300, 60, 60);
  }
  
  if (((mouseX<1140) && (mouseX>1080)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      de=!de;
    }
  }
  if (de) {
    stroke(0);
    fill(0);
    rect(1080, 300, 60, 60);
  }
  
  if (((mouseX<1200) && (mouseX>1140)) && ((300<mouseY) && (mouseY<360))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      df=!df;
    }
  }
  if (df) {
    stroke(0);
    fill(0);
    rect(1140, 300, 60, 60);
  }
  
  if (((mouseX<60) && (mouseX>0)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dg=!dg;
    }
  }
  if (dg) {
    stroke(0);
    fill(0);
    rect(0, 360, 60, 60);
  }
  
  if (((mouseX<120) && (mouseX>60)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dh=!dh;
    }
  }
  if (dh) {
    stroke(0);
    fill(0);
    rect(60, 360, 60, 60);
  }
  
  if (((mouseX<180) && (mouseX>120)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      di=!di;
    }
  }
  if (di) {
    stroke(0);
    fill(0);
    rect(120, 360, 60, 60);
  }
  
   if (((mouseX<240) && (mouseX>180)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dj=!dj;
    }
  }
  if (dj) {
    stroke(0);
    fill(0);
    rect(180, 360, 60, 60);
  }
  
   if (((mouseX<300) && (mouseX>240)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dk=!dk;
    }
  }
  if (dk) {
    stroke(0);
    fill(0);
    rect(240, 360, 60, 60);
  }
  
   if (((mouseX<360) && (mouseX>300)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dl=!dl;
    }
  }
  if (dl) {
    stroke(0);
    fill(0);
    rect(300, 360, 60, 60);
  }
  
   if (((mouseX<420) && (mouseX>360)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dm=!dm;
    }
  }
  if (dm) {
    stroke(0);
    fill(0);
    rect(360, 360, 60, 60);
  }
  
   if (((mouseX<480) && (mouseX>420)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ds=!ds;
    }
  }
  if (ds) {
    stroke(0);
    fill(0);
    rect(420, 360, 60, 60);
  }
  
  
   if (((mouseX<540) && (mouseX>480)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dn=!dn;
    }
  }
  if (dn) {
    stroke(0);
    fill(0);
    rect(480, 360, 60, 60);
  }
  
  if (((mouseX<600) && (mouseX>540)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ddo=!ddo;
    }
  }
  if (ddo) {
    stroke(0);
    fill(0);
    rect(540, 360, 60, 60);
  }
  
   if (((mouseX<660) && (mouseX>600)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dp=!dp;
    }
  }
  if (dp) {
    stroke(0);
    fill(0);
    rect(600, 360, 60, 60);
  }
  
   if (((mouseX<720) && (mouseX>660)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dq=!dq;
    }
  }
  if (dq) {
    stroke(0);
    fill(0);
    rect(660, 360, 60, 60);
  }
  
  if (((mouseX<780) && (mouseX>720)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dr=!dr;
    }
  }
  if (dr) {
    stroke(0);
    fill(0);
    rect(720, 360, 60, 60);
  }
  
  if (((mouseX<840) && (mouseX>780)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dt=!dt;
    }
  }
  if (dt) {
    stroke(0);
    fill(0);
    rect(780, 360, 60, 60);
  }
   if (((mouseX<900) && (mouseX>840)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      du=!du;
    }
  }
  if (du) {
    stroke(0);
    fill(0);
    rect(840, 360, 60, 60);
  }
  
  if (((mouseX<960) && (mouseX>900)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dv=!dv;
    }
  }
  if (dv) {
    stroke(0);
    fill(0);
    rect(900, 360, 60, 60);
  }
  
  if (((mouseX<1020) && (mouseX>960)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dw=!dw;
    }
  }
  if (dw) {
    stroke(0);
    fill(0);
    rect(960, 360, 60, 60);
  }
  
  if (((mouseX<1080) && (mouseX>1020)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dx=!dx;
    }
  }
  if (dx) {
    stroke(0);
    fill(0);
    rect(1020, 360, 60, 60);
  }
  
   if (((mouseX<1140) && (mouseX>1080)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dy=!dy;
    }
  }
  if (dy) {
    stroke(0);
    fill(0);
    rect(1080, 360, 60, 60);
  }
  
  if (((mouseX<1200) && (mouseX>1140)) && ((360<mouseY) && (mouseY<420))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      dz=!dz;
    }
  }
  if (dz) {
    stroke(0);
    fill(0);
    rect(1140, 360, 60, 60);
  }
   if (((mouseX<60) && (mouseX>0)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ea=!ea;
    }
  }
  if (ea) {
    stroke(0);
    fill(0);
    rect(0, 420, 60, 60);
  }
  
  if (((mouseX<120) && (mouseX>60)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      eb=!eb;
    }
  }
  if (eb) {
    stroke(0);
    fill(0);
    rect(60, 420, 60, 60);
  }
  
   if (((mouseX<180) && (mouseX>120)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ec=!ec;
    }
  }
  if (ec) {
    stroke(0);
    fill(0);
    rect(120, 420, 60, 60);
  }
  
   if (((mouseX<240) && (mouseX>180)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ed=!ed;
    }
  }
  if (ed) {
    stroke(0);
    fill(0);
    rect(180, 420, 60, 60);
  }
  
   if (((mouseX<300) && (mouseX>240)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ee=!ee;
    }
  }
  if (ee) {
    stroke(0);
    fill(0);
    rect(240, 420, 60, 60);
  }
  
  if (((mouseX<360) && (mouseX>300)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ef=!ef;
    }
  }
  if (ef) {
    stroke(0);
    fill(0);
    rect(300, 420, 60, 60);
  }
  
  if (((mouseX<420) && (mouseX>360)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      eg=!eg;
    }
  }
  if (eg) {
    stroke(0);
    fill(0);
    rect(360, 420, 60, 60);
  }
   if (((mouseX<480) && (mouseX>420)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      eh=!eh;
    }
  }
  if (eh) {
    stroke(0);
    fill(0);
    rect(420, 420, 60, 60);
  }
  
   if (((mouseX<540) && (mouseX>480)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ei=!ei;
    }
  }
  if (ei) {
    stroke(0);
    fill(0);
    rect(480, 420, 60, 60);
  }
  
  if (((mouseX<600) && (mouseX>540)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ej=!ej;
    }
  }
  if (ej) {
    stroke(0);
    fill(0);
    rect(540, 420, 60, 60);
  }
    if (((mouseX<660) && (mouseX>600)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ek=!ek;
    }
  }
  if (ek) {
    stroke(0);
    fill(0);
    rect(600, 420, 60, 60);
  }
  
  if (((mouseX<720) && (mouseX>660)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      el=!el;
    }
  }
  if (el) {
    stroke(0);
    fill(0);
    rect(660, 420, 60, 60);
  }
  
  if (((mouseX<780) && (mouseX>720)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      em=!em;
    }
  }
  if (em) {
    stroke(0);
    fill(0);
    rect(720, 420, 60, 60);
  }
  
  if (((mouseX<840) && (mouseX>780)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      en=!en;
    }
  }
  if (en) {
    stroke(0);
    fill(0);
    rect(780, 420, 60, 60);
  }
  
  if (((mouseX<900) && (mouseX>840)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      eo=!eo;
    }
  }
  if (eo) {
    stroke(0);
    fill(0);
    rect(840, 420, 60, 60);
  }
  
   if (((mouseX<960) && (mouseX>900)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ep=!ep;
    }
  }
  if (ep) {
    stroke(0);
    fill(0);
    rect(900, 420, 60, 60);
  }
  
   if (((mouseX<1020) && (mouseX>960)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      eq=!eq;
    }
  }
  if (eq) {
    stroke(0);
    fill(0);
    rect(960, 420, 60, 60);
  }
  
   if (((mouseX<1080) && (mouseX>1020)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      er=!er;
    }
  }
  if (er) {
    stroke(0);
    fill(0);
    rect(1020, 420, 60, 60);
  }
  
   if (((mouseX<1140) && (mouseX>1080)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      es=!es;
    }
  }
  if (es) {
    stroke(0);
    fill(0);
    rect(1080, 420, 60, 60);
  }
  
   if (((mouseX<1200) && (mouseX>1140)) && ((420<mouseY) && (mouseY<480))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      et=!et;
    }
  }
  if (et) {
    stroke(0);
    fill(0);
    rect(1140, 420, 60, 60);
  }
  
   if (((mouseX<60) && (mouseX>0)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      eu=!eu;
    }
  }
  if (eu) {
    stroke(0);
    fill(0);
    rect(0, 480, 60, 60);
  }
  
   if (((mouseX<120) && (mouseX>60)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ev=!ev;
    }
  }
  if (ev) {
    stroke(0);
    fill(0);
    rect(60, 480, 60, 60);
  }
  
  if (((mouseX<180) && (mouseX>120)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ew=!ew;
    }
  }
  if (ew) {
    stroke(0);
    fill(0);
    rect(120, 480, 60, 60);
  }
  
  if (((mouseX<240) && (mouseX>180)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ex=!ex;
    }
  }
  if (ex) {
    stroke(0);
    fill(0);
    rect(180, 480, 60, 60);
  }
  
  if (((mouseX<300) && (mouseX>240)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ey=!ey;
    }
  }
  if (ey) {
    stroke(0);
    fill(0);
    rect(240, 480, 60, 60);
  }
  
   if (((mouseX<360) && (mouseX>300)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ez=!ez;
    }
  }
  if (ez) {
    stroke(0);
    fill(0);
    rect(300, 480, 60, 60);
  }
  
   if (((mouseX<420) && (mouseX>360)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fa=!fa;
    }
  }
  if (fa) {
    stroke(0);
    fill(0);
    rect(360, 480, 60, 60);
  }
  
  if (((mouseX<480) && (mouseX>420)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fb=!fb;
    }
  }
  if (fb) {
    stroke(0);
    fill(0);
    rect(420, 480, 60, 60);
  }
  
  if (((mouseX<540) && (mouseX>480)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fc=!fc;
    }
  }
  if (fc) {
    stroke(0);
    fill(0);
    rect(480, 480, 60, 60);
  }
  
    if (((mouseX<600) && (mouseX>540)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fd=!fd;
    }
  }
  if (fd) {
    stroke(0);
    fill(0);
    rect(540, 480, 60, 60);
  }
  
      if (((mouseX<660) && (mouseX>600)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fe=!fe;
    }
  }
  if (fe) {
    stroke(0);
    fill(0);
    rect(600, 480, 60, 60);
  }
  
   if (((mouseX<720) && (mouseX>660)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ff=!ff;
    }
  }
  if (ff) {
    stroke(0);
    fill(0);
    rect(660, 480, 60, 60);
  }
  
  if (((mouseX<780) && (mouseX>720)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fg=!fg;
    }
  }
  if (fg) {
    stroke(0);
    fill(0);
    rect(720, 480, 60, 60);
  }
  
  if (((mouseX<840) && (mouseX>780)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fh=!fh;
    }
  }
  if (fh) {
    stroke(0);
    fill(0);
    rect(780, 480, 60, 60);
  }
  
   if (((mouseX<900) && (mouseX>840)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fi=!fi;
    }
  }
  if (fi) {
    stroke(0);
    fill(0);
    rect(840, 480, 60, 60);
  }
  
  if (((mouseX<960) && (mouseX>900)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fj=!fj;
    }
  }
  if (fj) {
    stroke(0);
    fill(0);
    rect(900, 480, 60, 60);
  }
  
   if (((mouseX<1020) && (mouseX>960)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fk=!fk;
    }
  }
  if (fk) {
    stroke(0);
    fill(0);
    rect(960, 480, 60, 60);
  }
  
   if (((mouseX<1080) && (mouseX>1020)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fl=!fl;
    }
  }
  if (fl) {
    stroke(0);
    fill(0);
    rect(1020, 480, 60, 60);
  }
  
  if (((mouseX<1140) && (mouseX>1080)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fm=!fm;
    }
  }
  if (fm) {
    stroke(0);
    fill(0);
    rect(1080, 480, 60, 60);
  }
  
  if (((mouseX<1200) && (mouseX>1140)) && ((480<mouseY) && (mouseY<540))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fn=!fn;
    }
  }
  if (fn) {
    stroke(0);
    fill(0);
    rect(1140, 480, 60, 60);
  }
  
   if (((mouseX<60) && (mouseX>0)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fo=!fo;
    }
  }
  if (fo) {
    stroke(0);
    fill(0);
    rect(0, 540, 60, 60);
  }
 
 if (((mouseX<120) && (mouseX>60)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fp=!fp;
    }
  }
  if (fp) {
    stroke(0);
    fill(0);
    rect(60, 540, 60, 60);
  }
 
 if (((mouseX<180) && (mouseX>120)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fq=!fq;
    }
  }
  if (fq) {
    stroke(0);
    fill(0);
    rect(120, 540, 60, 60);
  }
 
 if (((mouseX<240) && (mouseX>180)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fr=!fr;
    }
  }
  if (fr) {
    stroke(0);
    fill(0);
    rect(180, 540, 60, 60);
  }
 
 if (((mouseX<300) && (mouseX>240)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fs=!fs;
    }
  }
  if (fs) {
    stroke(0);
    fill(0);
    rect(240, 540, 60, 60);
  }
  
  if (((mouseX<360) && (mouseX>300)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ft=!ft;
    }
  }
  if (ft) {
    stroke(0);
    fill(0);
    rect(300, 540, 60, 60);
  }
  if (((mouseX<420) && (mouseX>360)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fu=!fu;
    }
  }
  if (fu) {
    stroke(0);
    fill(0);
    rect(360, 540, 60, 60);
  }
  
  if (((mouseX<480) && (mouseX>420)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fv=!fv;
    }
  }
  if (fv) {
    stroke(0);
    fill(0);
    rect(420, 540, 60, 60);
  }
  
   if (((mouseX<540) && (mouseX>480)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fw=!fw;
    }
  }
  if (fw) {
    stroke(0);
    fill(0);
    rect(480, 540, 60, 60);
  }
  
   if (((mouseX<600) && (mouseX>540)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fx=!fx;
    }
  }
  if (fx) {
    stroke(0);
    fill(0);
    rect(540, 540, 60, 60);
  }
  
   if (((mouseX<660) && (mouseX>600)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fy=!fy;
    }
  }
  if (fy) {
    stroke(0);
    fill(0);
    rect(600, 540, 60, 60);
  }
  
  if (((mouseX<720) && (mouseX>660)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      fz=!fz;
    }
  }
  if (fz) {
    stroke(0);
    fill(0);
    rect(660, 540, 60, 60);
  }
   if (((mouseX<780) && (mouseX>720)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ga=!ga;
    }
  }
  if (ga) {
    stroke(0);
    fill(0);
    rect(720, 540, 60, 60);
  }
  if (((mouseX<840) && (mouseX>780)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      gb=!gb;
    }
  }
  if (gb) {
    stroke(0);
    fill(0);
    rect(780, 540, 60, 60);
  }

  if (((mouseX<900) && (mouseX>840)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      gc=!gc;
    }
  }
  if (gc) {
    stroke(0);
    fill(0);
    rect(840, 540, 60, 60);
  }
  
   if (((mouseX<960) && (mouseX>900)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      gd=!gd;
    }
  }
  if (gd) {
    stroke(0);
    fill(0);
    rect(900, 540, 60, 60);
  }
  
   if (((mouseX<1020) && (mouseX>960)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      ge=!ge;
    }
  }
  if (ge) {
    stroke(0);
    fill(0);
    rect(960, 540, 60, 60);
  }
  
   if (((mouseX<1080) && (mouseX>1020)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      gf=!gf;
    }
  }
  if (gf) {
    stroke(0);
    fill(0);
    rect(1020, 540, 60, 60);
  }
  
    if (((mouseX<1140) && (mouseX>1080)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      gg=!gg;
    }
  }
  if (gg) {
    stroke(0);
    fill(0);
    rect(1080, 540, 60, 60);
  }
   if (((mouseX<1200) && (mouseX>1140)) && ((540<mouseY) && (mouseY<600))) {
    //    stroke(230);
    //    fill(230);
    //    rect(60, 0, 60, 60);

    if (mousePressed==true) {
      gh=!gh;
    }
  }
  if (gh) {
    stroke(0);
    fill(0);
    rect(1140, 540, 60, 60);
  }
  
}
//Don't worry about this stuff!
void keyPressed() {
  if (key == 's') {
    save("mattPorter.png");
  }}
