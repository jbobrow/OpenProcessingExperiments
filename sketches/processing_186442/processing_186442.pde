

//control del pollito
float pollox =map (minute(),0,60,30,width);
float huevoy =map (second(),0,59,0,height);
float polloy = 440;
float mpollo = 40;
float minuts = map (minute(),0,60,30,width);

//control tronco
float xarbre = 700;
float yarbre = -10;
float mida = 550;

//control gallina
float xgall = 550;
float ygall= 110;
float mgall= 100;

//control estrellas
int totalest = 24;
float [] estx = new float [totalest];
float [] esty = new float [totalest];
float [] estm = new float [totalest];

//control hijos
int totalhi = 24;
float [] hix = new float [totalhi];
float [] hiy = new float [totalhi];
float [] him = new float [totalhi];
color [] colorhi = new color [totalhi];

//control hierba
float herbax = 200;
float herbay = 520;
float herbam= 300;

void setup() {
  size (800, 500);
  
  
 //condicio estrelles 
for (int i = 0; i< totalest; i++) {
    estx[i] = int(random(width-100));
    esty[i] = int(random(0, height));
    estm[i] = int(4);
    
  }

//condicio pollitos
for (int i = 0; i< totalhi; i++) {
    hix[i] = int(random(width));
    hiy[i] = int(random(420, height-50));
    him[i] = int(40);
    colorhi [i] = color (random(0-255), random(0-251),random(0-139));
 
}

}



void draw() {
  
  
 
  fons();
  dibuixa();
  estrelles();
  hijos();
  hierba();
  solete();
 
  
  
}
  

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////// FUNCIONS/////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

void dibuixa (){
  fill(255, 251, 139);
  noStroke(); 
  
   float pollox =map (minute(),0,60,30,width);
  
  
  //boca cutre
  noFill();
  stroke(2);
  
   
   
 float huevoy =map (second(),0,59,80,height-50);
 
//huevo
fill(255);
noStroke();
ellipse(550,huevoy,30,50);   
    
    
    //tronco
     fill(155, 116, 78);
  noStroke();
  rect(xarbre, yarbre, mida/4, mida);
  ellipse(xarbre+20, yarbre, mida/10, mida/10);
  rect(xarbre-200, yarbre+150,200,30);
  ellipse (xarbre-200,yarbre+165,30,30);
  
  //gallina
   fill(255, 251, 139);
  //stroke(2);
  ellipse(xgall,ygall,mgall,mgall); //cos gall
  ellipse(xgall,ygall-50,mgall/1.5,mgall/1.5); //capgall
  noStroke();
  fill(255);
  ellipse(xgall-12,ygall-60,mgall/8,mgall/8); //ull blanc
  ellipse(xgall+12,ygall-60,mgall/8,mgall/8);
 fill(5);
 ellipse(xgall-12,ygall-60,mgall/18,mgall/18); //ull negre
 ellipse(xgall+12,ygall-60,mgall/20,mgall/20);
 fill(237,12,12);
 noStroke();
  triangle(545,65,560,65,555,75); //pico
  fill(237,211,158);
  triangle(545,12,560,12,550,45); //cresta
  ellipse(552,12,15,15);  //cresta
 triangle(570,19,560,10,550,45); //cresta
 ellipse(563,18,15,15);  //cresta
 //fill(242,137,7);
 
 
 
 //huevon
 noStroke();
 ellipse(550, height-30,pollox/4,pollox/3);
    
}
  
 void estrelles(){
   fill(7,138,242);
    float h= hour();
  for (int i = 0; i< h; i++) {
    
    ellipse(estx[i], esty[i], estm[i], estm[i]);
  }
}

void hijos(){
 
    float h= hour();
  for (int i = 0; i< h; i++) {
    fill(colorhi[i]);
     fill(255, 251, 139);
    ellipse(hix[i], hiy[i], him[i], him[i]);
    ellipse(hix[i], hiy[i], him[i], him[i]+15);
  ellipse(hix[i], hiy[i]+25, him[i]+15, him[i]+15);
  fill(255, 34, 56);
  triangle(hix[i]-5, hiy[i], hix[i]+5, hiy[i], hix[i], hiy[i]+5);
  fill(255);
  ellipse(hix[i]-6, hiy[i]-10, him[i]/4, him[i]/4);
  ellipse(hix[i]+6, hiy[i]-10, him[i]/4, him[i]/4);
  fill(5);
  ellipse(hix[i]-6, hiy[i]-10, him[i]/8, him[i]/8);
  ellipse(hix[i]+6, hiy[i]-10, him[i]/8, him[i]/8);
  }
}
   
   
   void hierba(){
     
     fill (106,160,84);
     ellipse (herbax+80,herbay-25,herbam+100,herbam-200);
     
     fill (100,209,55);
     ellipse (herbax,herbay,herbam,herbam-200);
     ellipse (herbax+300,herbay,herbam,herbam-200);
     ellipse (herbax+500,herbay,herbam,herbam-200);
     
     fill (145,188,127);
     ellipse (herbax+200,herbay,herbam,herbam-200);
     ellipse (herbax-200,herbay,herbam,herbam-200);
   
   }
   
   void solete(){
     
     ellipse (100,100,100,100);
     if (hour() <= 5 && minute() <=59 && second() <= 59)//matí
  {
   fill(252,165,33);
  }
  else if (hour() <= 11 && minute() <= 59 && second() <= 59)//tarda
  {
   fill(247,240,10);
  }
  else if (hour() <= 17 && minute() <= 59 && second() <= 59)//vespre
  {
   fill(229,117,12);
  }
  else //nit
  {
   fill(193,188,183);
  }
     
   }


void fons(){
 
 if (hour() <= 5 && minute() <=59 && second() <= 59)//matinada
  {
   background(225,164,250);
  }
  else if (hour() <= 11 && minute() <= 59 && second() <= 59)//mati
  {
   background(89,205,227);
  }
  else if (hour() <= 17 && minute() <= 59 && second() <= 59)//tarda
  {
   background(247,183,80);
  }
  else //nit
  {
   background(47,70,147);
  } 
}
