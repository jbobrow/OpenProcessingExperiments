
int fons = 0;
int casc = #1800FF;
int tcasc = #1800FF;
int ccasc = #7AD0FC;
int cdcasc = #7AD0FC;
int oreja = #7AD0FC;
int orejad = #7AD0FC;
void setup(){
  size(500,500);
  smooth();
}
void draw() {
  background(fons);
//casco
fill(casc);
ellipse(250,250,370,400);

//decoracion casco
fill(ccasc);
ellipse(250,80,50,50);
fill(cdcasc);
ellipse(250,140,50,50);
//cara
fill(#F7C566);
stroke(#000000);
strokeWeight(2);
ellipse(250,320,270,270);
//triangulo casco
fill(tcasc);
noStroke();
triangle(220,180,280,180,250,300);
//ojos
fill(255,255,255);
ellipse(310,280,80,120);
fill(255,255,255);
ellipse(190,280,80,120);
fill(0);
ellipse(200,280,50,80);
fill(255,255,255);
ellipse(200,260,mouseY/30,30);
fill(0);
ellipse(300,280,50,80);
fill(255,255,255);
ellipse(300,260,mouseY/30,30);


//nariz
fill(0);
rect(240,350,30,10);
//boca
fill(#000000);
arc(250,400,70,50,100,mouseY/300);
fill(#D3155B);
ellipse(250,407,70,mouseY/35);
//orejas
fill(oreja);
ellipse(95,250,60,100);
fill(orejad);
ellipse(405,250,60,100);
fill(#F7C566);
rect(235,240,30,100);
}
void mousePressed(){
  fons = 255;
  casc = 0;
  tcasc = 0;
  ccasc = #FFA600;
  cdcasc = #FFA600;
  oreja = #FFA600;
  orejad = #FFA600;
}
void mouseReleased(){
  fons = 0;
  casc = #1800FF;
  tcasc = #1800FF;
  ccasc = #7AD0FC;
  cdcasc = #7AD0FC;
  oreja = #7AD0FC;
  orejad = #7AD0FC;
}


