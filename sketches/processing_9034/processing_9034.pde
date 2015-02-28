
PFont f;
float tx,txh,txm,txs ;
float faktor;
void setup(){
  String[] fontList = PFont.list();
  println(fontList);
faktor=4;
tx=height/5;
 size (500,300);
 //frameRate(1);
txh=txm=txs= height/10;
f = createFont("Times New Roman Fett",height/10);
}
void draw(){
background(0);

int m=minute(),s=second(),h=hour();
textAlign(CENTER);
  textFont (f);

//float hp=2*m,mp=2*s,sp=map(millis()%1000,0,1000,0,120);

//Stunden
float hp=(h+4)*height/30;
if (h<12){textSize (txh+(2*faktor*h));}
else  {textSize(txh+(24*2*faktor)-(2*faktor*h));}
text(h,width/6,hp);

//Minuten
float mp=(m+10)*height/75;
if (m<30){textSize (txm+(faktor*m));}
else  {textSize(txm+(60*faktor)-(faktor*m));}
text(m,width/2,mp);

//Sekunden
float sp=(s+10)*height/75;
if (s<30){textSize (txs+(faktor*s));}
else  {textSize(txs+(60*faktor)-(faktor*s));}
text(s,5*width/6,sp);
} 

