
// Autor: Lucas Massato Fujiyama
// Licença CC A SA

int x;
int y;
void setup (){
size (400,400);    
  background (255);
  
}
 int l=20;
void draw() {
  //background (255);
   strokeWeight (0);
  fill (124, 252, 0);
  rect (0,390,20,10);
  while (x<80){
    line(10+x,100-10*x/9,20+x,90-10*x/9);
    line(95+x,5+10*x/9,105+x,15+10*x/9);
    x=x+5;

}
size (400,400);
background (#0000CD);//mar profundo
noStroke ();
for ( int b=400; b>0; b=b-1) {
  fill(15,140,b);
  rect(0, 400-b, 200, 1);
}// o degradê divide com o azul, dando a ideia dde um Triângulo das Bermudas onde o navio some
fill (#EEDD82); //areia
ellipse (200,0,700,375);
noStroke ();
fill (#FFA500)
rect (150,50,50,50);//casa no meio da praia
fill (#D3D3D3);
rect (170,100,20,120); //píer 
fill (#228B22);
ellipse (0,0,50,50);
ellipse (20,30, 20,20);
ellipse (50,40, 30,30);
ellipse (360, 100, 30, 30);
ellipse (345, 80, 35,34);
ellipse (240, 70, 30,30);
fill (#006400);
ellipse (100,100,40,40);
ellipse (200,75,20,20);
ellipse (150,78,40,40);
ellipse (130, 70,30,30);
fill (#32CD32);
ellipse (160,100,40,40);
ellipse (200,0,30,30);
ellipse (140,15,30,30);
ellipse (370,10,30,30);
ellipse (340,100,40,40);
ellipse (80,80,30,30);
fill (#8FBC8F);
ellipse (340,30,30,30);
ellipse (300,70,30,30);
ellipse (130,20,30,30);
ellipse (230,85,30,30);
fill (#7FFF00);
ellipse (30,10,20,20);
ellipse (45,10,30,30);
ellipse (325,30,40,40);
ellipse (200,20,30,30);
ellipse (100,75,30,30);
ellipse (100,30,40,40);
ellipse (275,40,30,30);
fill (#98FB98);
ellipse (220, 40, 40, 30);
ellipse (170,10, 30,30);
ellipse (300,30,30,30);
fill (#B3EE3A);
ellipse (245,100,30,30);
fill (#0000CD);
rect (l,270,40,20,8);
  l++;
  }
