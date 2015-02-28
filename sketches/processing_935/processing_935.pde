
/* TO RUN PLEASE HOLD UR FINGER ON ANY KEY UNTIL DRAWING IS FINISHED.(BEGINNER SKILL PROJECT) BY ERDEM KUSKUN,TEYFIK KAYA,ERKIN OZSAHIN,YAGIZ YENICERI>> AMAC:GÖRSELLERIN ASLINMDA GEOMETRIK FORMLARDAN MEYDANA GELDIGINI VE KARE,UCGEN,ELIPS FORMLARIYLA CİZEMEYECEGİMİZ NESNE OLMADIGINI KANITLAMAK + sagda üstte ve solda gördüğüz renk barlari aşağıda gördümüz her rengi tarayan renk barının kesisim kümesidir. ve klavyeye basılı tuttugumuz sürece geometrik sekiller silinecek asıl eserimiz ortaya cikicak (anonim) 
*/



PImage a;  
int k=500;
int b=410;
int c=300;
int d=500;
int e=500;
int f=500; 
int g=250; 
int l=250;
void setup() {
  size(350, 350);
  a = loadImage("erdem.jpg");   
    frameRate(59);
    
noLoop();
}

void draw() {
  stroke(81,135,182);
  image(a, 0, 0); 
  fill(204,102,0,k);
ellipse(130,240,b,b);
fill(114,47,101,k);
ellipse(260,240,b,b);
fill(205,27,15,k);
ellipse(194,122,b,b);
fill(114,155,255,g);
noStroke();
  rect(0,0,350,350);
  fill(169,189,196,l);
ellipse(193,197,360,360);
fill(random(255),random(10),random(10),150);
noStroke();
rect(0,0,350,10);
fill(random(255),random(255),random(255));
noStroke();
rect(0,330,350,20);
fill(104,39,random(255),150);
noStroke();
rect(340,0,10,350);
fill(255,random(100),0,150);
noStroke();
rect(0,0,10,350);
fill(45,128,100,d);
triangle(90,274,184,70,280,240); // 
fill(229,67,3,e);
triangle(117,257,187,72,312,259);
fill(87,47,107,f);
triangle(90,274,184,106,310,258);
l--;
k--; //eksi
b--; //eksi
c--; //eksi
g--;
d--; //+
//if( d>250){ d=100;}
//else {d++;}
e--;
//if( e>250){ e=0;}
//else {e++;}
f--;
//if( f>250){ f=0;}
//else {f++;}

}
void keyPressed()  {
  redraw();
}

