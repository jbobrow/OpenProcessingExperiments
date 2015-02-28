

 
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage p;
PImage q;
PImage r;
PImage s;
PImage t;
PImage u;
PImage v;
PImage w;
PImage x;
  
float y = 0.0;
 
 
void setup(){
  size(300,300);
  
 a = loadImage("a_01.jpg");
 b = loadImage("a_02.jpg");
 c = loadImage("a_03.jpg");
 d = loadImage("a_04.jpg");
 e = loadImage("a_05.jpg");
 f = loadImage("a_06.jpg");
 g = loadImage("b_01.jpg");
 h =loadImage("b_02.jpg");
 i = loadImage("b_03.jpg");
 j = loadImage("b_04.jpg");
 k = loadImage("b_05.jpg");
 l = loadImage("b_06.jpg");
 m = loadImage("c_01.jpg");
 n = loadImage("c_02.jpg");
 o = loadImage("c_03.jpg");
 p =loadImage("c_04.jpg");
 q = loadImage("c_05.jpg");
 r = loadImage("c_06.jpg");
 s = loadImage("d_01.jpg");
 t = loadImage("d_02.jpg");
 u = loadImage("d_03.jpg");
 v =loadImage("d_04.jpg");
 w = loadImage("d_05.jpg");
 x = loadImage("d_06.jpg");
}

void draw(){

  if((keyPressed == true) && ((key == 'i') || (key == 'I')))
  {
PImage settings[]={a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x};
PImage setting=settings[int(random(0,settings.length))];
image(setting,0,0,300,300);
  tint (random(255),random(255),random(255), random (255));
  }
  else
  {
PImage settings[]={a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x};
PImage setting=settings[int(random(0,settings.length))];
image(setting,0,0,300,300);
 tint (random(255),random(255),random(255), random (255)); 
  }
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

void keyReleased(){
  if (key=='s'){ saveFrame("A_O3_##.ext.jpg"); }
}

