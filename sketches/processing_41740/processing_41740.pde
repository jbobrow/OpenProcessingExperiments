
int col = 0;
int a = 100;
int b = 200;
int c = 300;

void setup () {
  size (800,800);
  smooth ();
  ellipseMode (CENTER);
}

void draw (){
  background (255,3,3 + col);
  strokeWeight (1);
  fill (col);
 rect (250,450,c,c+50);
 fill (col);
 rect (c,250,200,150);
 fill (col);
 rect (c+50,400,100,50);
 fill (189);
 rect (325,300,50,50);
 rect (425,300,50,50);
 fill (0);
 rect (337,312,25,25);
 rect (437,312,25,25);
 rect (375,375,50,10);
 fill (255,87,0 +col);
 rect (300,500,200,150);
 strokeWeight (3);
 line (325,500,325,650);
 line (350,500,350,650);
 line (375,500,375,650);
 line (400,500,400,650);
 line (425,500,425,650);
 line (450,500,450,650);
 line (475,500,475,650);
 line (300,525,500,525);
 line (300,550,500,550);
 line (300,575,500,575);
 line (300,600,500,600);
 line (300,625,500,625);
 strokeWeight (60);

 line (575,475,mouseY,mouseX);
 line (225,475,mouseX,mouseY);
}

    
void mouseDragged () {
 col = col +5 ;
 if (col> 200) {
 col = 0;
 }
 }
 

