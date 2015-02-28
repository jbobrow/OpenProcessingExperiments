
PFont font;

void setup (){
  size (650, 650);
  font = loadFont ("NightclubBTNCn-40.vlw");
  textFont (font);
}

void draw (){
  background (0);
  int s= second ();
  int m= minute ();
  int h= hour ();
  
  String t= nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
  textAlign (CENTER);
  text (t,340,235);
  
  int d= day ();
  int p= month ();
  int y= year ();
  
  String f= nf(d,2) + "/" + nf(p,2) + "/" + nf(y,2);
  textAlign (CENTER);
  text (f,340,625);


fill (255,240,0, 80);

ellipse (338, 340,50,s);
ellipse (338, 340,80,s);
ellipse (338, 340,30,s);



for(int e=10; e<600; e+=75){

fill (0,185,200,60);
rect (400,e,50,m);

fill (26,185,200,60);
rect (430, e,50,m);

fill (0,185,200,60);
rect (200,e,50,m);

fill (26,185,200,60);
rect (230, e,50,m); 


  }
     

for(int j=10; j<600; j+=70){
noStroke ();
fill (250,127,5);

rect (530, j,100,h);

rect (j, 500,100,h);

rect (j, 50,100,h);

rect (50, j,100,h);

}
}

