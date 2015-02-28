
int cresce;
int crescex;

void setup () {
  size (400,400);
  smooth ();
  background (#8358FF);
}

void draw () {

background (#8358FF);
exibeMostro ();  
   
}

void exibeMostro () {
  int posx = mouseX;
int posy = mouseY;
int py = mouseY;
int cresce = py-60;
int crescex = posx;
int r = mouseX;
int g = mouseY;
int b = 255;
r = constrain (r,g,255);
fill (r,g,b);//cor do corpo
  ellipse (posx,posy, 100,100);//corpo
  line (posx+10,posy+50, posx+10, posy+100);//perna1
  fill (0);//cor pé
  ellipse (posx+13, posy+98,10,10);//pé1
  line (posx-5,posy+50, posx-5, posy+100);//perna2 
  ellipse (posx-8,posy+98,10,10); //pé2
  fill (0); //cor olho
  ellipse (posx-25, posy-10, 20,20);//olho1
  ellipse (posx+25, posy-10,20,20);//olho2
  line (posx, posy+20,posx+10, posy+20);//boca
  line (posx+50, posy, posx+75, posy);//braço1
  line (posx-50, posy, posx-75,posy);//braço2
  ellipse (posx+75, posy, 10, 10);//mão1
  ellipse (posx-75, posy, 10,10);//mão2
  line (posx, posy-50, crescex, cresce);//cabelo1
  line (posx-10, posy-50, crescex-10, cresce);//cabelo2
  line (posx+10, posy-50, crescex+10, cresce);//cabelo3

if (mousePressed) {
  cresce = cresce+10;
  crescex = crescex+10;
}
}


