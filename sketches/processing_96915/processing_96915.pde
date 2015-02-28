
//Monyse Takaki
//Anoitecer

float angle = 0;

void setup (){
size (400, 400);
background (#2FC1E8);
noStroke ();
fill (#1E7412);
rect (0, 300, 400, 400);
fill (#F2E3DA);
triangle(100, 300, 200, 100, 300, 300);
stroke (#62402A);
strokeWeight (5);
smooth ();
line (200, 100, 100, 300);
line (200, 100, 300, 300);
fill (#2A5262);
rect (175, 200, 50, 50);
}
 
void draw (){
  int x = mouseX;
  int y= mouseY;
  background (#2FC1E8);
noStroke ();
smooth ();
fill (#FFEC17);
ellipse (70, 70, 70, 70);
{
  if (x>=70 && x<=140 && y>=70 && y<=140)
  background (#11034B);
  if (x>=70 && x<=140 && y>=70 && y<=140)
  fill (255);
  ellipse (70, 70, 70, 70);
  noStroke ();
fill (#1E7412);
rect (0, 300, 400, 400);
fill (#F2E3DA);
triangle(100, 300, 200, 100, 300, 300);
stroke (#62402A);
strokeWeight (5);
smooth ();
line (200, 100, 100, 300);
line (200, 100, 300, 300);
fill (#2A5262);
rect (175, 200, 50, 50);
translate(width/2, height/2);
  //vagalumes 
  int counter =0 ;
  
  while(counter<1000) {
      
   
    stroke(255);
    point(width/2, height/2);
    // Rotaciona as coordenadas do sistema num
    // ângulo determinado por uma variavel
    rotate(radians(angle));
    scale(0.900,0.900);
      
    counter++;
  }
  
  // Criação da animação
  angle += 0.10;

}
}

