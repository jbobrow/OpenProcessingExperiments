
int t=#F70F2A;
int e=#F70FB2;
int r=#630FF7;
int s=#0FB7F7;
int a=#0FF7E6;
int g=#0FF720;
int u=#BC764E;
int d=#F7F00F;
int l=#F7800F;
int p=#B14EBC;
float n,y,b;

void setup(){
  size(400,400);
  background(0);
 }

void draw(){
  n=random(0,255);
 y=random(0,255);
  b=random(0,255);
  
   fill(#F70F2A);
  rect(0,0,20,20);
  fill(#F70FB2);
  rect(20,0,20,20);
  fill(#630FF7);
  rect(40,0,20,20);
  fill(#0FB7F7);
  rect(60,0,20,20);
  fill(#0FF7E6);
  rect(80,0,20,20);
  fill(#0FF720);
  rect(100,0,20,20);
  fill(#BC764E);
  rect(120,0,20,20);
  fill(#F7F00F);
  rect(140,0,20,20);
  fill(#F7800F);
  rect(160,0,20,20);
  fill(#B14EBC);
  rect(180,0,20,20);
   fill(n,y,b);
  rect(200,0,20,20);
  
  
     if(mousePressed){
     line(mouseX,mouseY,pmouseX,pmouseY);
   if(mouseX>0 && mouseX<20 && mouseY<20)
   {
   stroke(t);
   }
   if(mouseX>20 && mouseX<40 && mouseY<20)
   {
   stroke(e);
   }
    if(mouseX>40 && mouseX<60 && mouseY<20)
   {
   stroke(r);
   }
    if(mouseX>60 && mouseX<80 && mouseY<20)
   {
   stroke(s);
   }
    if(mouseX>80 && mouseX<100 && mouseY<20)
   {
   stroke(a);
   }
    if(mouseX>100 && mouseX<120 && mouseY<20)
   {
   stroke(g);
   }
    if(mouseX>120 && mouseX<140 && mouseY<20)
   {
   stroke(u);
   }
    if(mouseX>140 && mouseX<160 && mouseY<20)
   {
   stroke(d);
   }
    if(mouseX>160 && mouseX<180 && mouseY<20)
   {
   stroke(l);
   }
    if(mouseX>180 && mouseX<200 && mouseY<20)
   {
   stroke(p);
   }
   if(mouseX>200 && mouseX<220 && mouseY<20)
   {
   stroke(n,y,b);
   }
     
     
     
  }
}
