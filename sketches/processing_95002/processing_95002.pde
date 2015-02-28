
// Emanuele da S. Reis - Telhado
int x=85;
int y=75;
int dtelhax=12;
int dtelhay=8;
int ptx=9;
int pty=9;

void setup(){
  size (200, 200);
}
  void draw() {
  background(#DAE8E1);
fill (#AEB7AE);// Paredes e janelas
noStroke();
rect(0, 190, 200, 8);
fill(#588155);
rect(40, 120, 90, 90);
fill (250);
stroke(0);
 rect (73,130,25,25);
 stroke  (0);
 strokeWeight (1);
 line (85,132,85,155);
 line (73,142,98,142);  
 
  fill(#F8FF3B); //sol
 stroke (#FFA84B);
ellipse(160, 60, 20, 20);

  fill(250);
  rect(60, 160, 50, 40);
  stroke(#AEB7AE);
  strokeWeight(1);
  stroke(0);
  line(85,160,85,180);
   
    noStroke();//telhado
  fill(#7E4308);
  rect(70,180,30,20);
   triangle(40, 120, 85, 75, 130, 120);
   
  int x=85;
  int y=75;
  int dtelhax=12;
  int dtelhay=8;
  int ptx=9;
  int pty=9;
    for (int i=0; i<6; i++){
    strokeWeight(2);
    stroke(#EABA89);
    line (x, y, x+dtelhax, y+dtelhay);
    x+=ptx;
    y+=pty;
  }
  
  x=85;
  y=75;
  dtelhax=-12;
  dtelhay=8;
  ptx=-9;
  pty=9;
  
  for (int i=0; i<6; i++)
  {
    line (x, y, x+dtelhax, y+dtelhay);
    x+=ptx;
    y+=pty;
  }
}
