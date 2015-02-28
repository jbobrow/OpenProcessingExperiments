
void setup(){
 size (720,450);
}

void draw () {
  smooth ();
 fill (255,255,255);
 stroke (200,0,0);
 background (0,0,200);
 ellipse (300,200,200,300);
 stroke (100,100,100);
 fill (255,255,255);
 ellipse (250,150,50,50);
 ellipse (350,150,50,50);
 fill (1,1,1);
 ellipse (250,150,10,10);
 ellipse (350,150,5,5);
 fill (255,0,0);
 ellipse (300,200,50,50);
 //LINEA VOCA
 fill (250,240,255);
 ellipse (300,300,250,30);
 line (200,300,400,300);
 //CUERPO
 fill (0,240,0);
 rect(250, 350, 120, 120);
 rect(150, 350, 100, 20);
 rect(350, 350, 100, 20);
 //GORRO
 fill (100,240,255);
 triangle(180, 100, 300, 10, 436, 100);
 fill (255,240,0);
 triangle(230, 100, 300, 10, 200, 100);
 fill (50,240,20);
 triangle(330, 100, 300, 10, 400, 100);
  fill (255,40,50);
 triangle(300, 100, 300, 10, 250, 100);
 fill (255,180,50);
 ellipse (300,10,20,20);
 
 
 }
