

int wlo;
int a=1;
int r;
int g;
int b;
void setup(){
  size(400,600);
  background(255,255,255);
}

void por(){
 smooth();
  strokeWeight(5);
    fill(r,g,b);
  ellipse(180, 30, 50, 50);
  fill(0);
  text("por", 170, 40);
  
  if (mouseY<=50 && mouseX<=200 
  && mouseButton == LEFT && mousePressed)
  {
  a=a-1;
} if (a<=-1){
 a=1;} 
}
  
  
  



void wlocznik(){
if (a==1){  
background(255,255,255);
wlo=mouseX;
}
}


void linia_glowna(){
line(50,500,350,500);
for (int i=50; i<=350;i+=100){
  smooth();
  if (a<=0)
  {
    r=228;
    g=245;
    b=7;
  } else {
    r=235;
    g=33;
    b=24;
  }
  
  fill(r,g,b);
ellipse(i, 500, 20, 20);
} 
}

void kule_danych1(){

   if (a==0 || wlo<=60){
String[] dane = loadStrings( "Teoria Kultury Ocena zespołu V gr III 6.XII - Sheet1.csv" );
float[] z = new float[ dane.length ];

for (int i=0; i<dane.length; i +=1){
String[] cols=dane[i].split(";");
  
z[i]=float( cols[0]);

fill(255,0,0);
fill(50*i, 20*i,10*i);
ellipse(50, 150+ (50*i), 5*z[i], 5*z[i]);
  fill(r,g,b);
text(z[i],30,150+(50*i));
 }
}
}

void kule_danych2(){

   if (a==0 || (wlo>=140 && wlo<=160)){
String[] dane = loadStrings( "Teoria Kultury Ocena zespołu V gr III 6.XII - Sheet1.csv" );
float[] b = new float[ dane.length ];

for (int i=0; i<dane.length; i +=1){
String[] cols=dane[i].split(";");
  
b[i]=float( cols[1]);
 
fill(255,0,0);
fill(50*i, 20*i,10*i);
ellipse(150, 150+ (50*i), 5*b[i], 5*b[i]);
fill(255,255,255);
text(b[i],130,150+(50*i));
 }
}
}

void kule_danych3(){

   if (a==0 || (wlo>=240 && wlo<=260)){
String[] dane = loadStrings( "Teoria Kultury Ocena zespołu V gr III 6.XII - Sheet1.csv" );
float[] c = new float[ dane.length ];

for (int i=0; i<dane.length; i +=1){
String[] cols=dane[i].split(";");
  
c[i]=float( cols[2]);
 
fill(255,0,0);
fill(50*i, 20*i,10*i);
ellipse(250, 150+ (50*i), 5*c[i], 5*c[i]);
fill(r,g,b);
text(c[i],230,150+(50*i));
 }
}
}

void kule_danych4(){

   if (a==0 || (wlo>=340 && wlo<=360)){
String[] dane = loadStrings( "Teoria Kultury Ocena zespołu V gr III 6.XII - Sheet1.csv" );
float[] d = new float[ dane.length ];

for (int i=0; i<dane.length; i +=1){
String[] cols=dane[i].split(";");
  
d[i]=float( cols[3]);
 
fill(255,0,0);
fill(50*i, 20*i,10*i);
ellipse(350, 150+ (50*i), 5*d[i], 5*d[i]);
fill(r,g,b);
text(d[i],330,150+(50*i));
 }
}
}


void draw(){
       wlocznik();
     linia_glowna();
  por();
   

 
   
  kule_danych1();
   kule_danych2();
   kule_danych3();
   kule_danych4();
}

