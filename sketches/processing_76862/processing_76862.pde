
//Autor: Roger Pineda 
void setup(){ 
size (200, 200);
smooth();
}
void draw (){
  background (0);
  fill (250, 100, 60);
//coll
rect (77, 160, 50, 60);
//cap
ellipse (100, 100, 130, 150);
//nas
arc ( 100 ,  97 , mouseY/5, mouseX/5, 3.14, 6.30);
noStroke();
//orelles
ellipse (170, 90, mouseY/5,mouseX/5);
ellipse (30, 90, mouseY/5, mouseX/5);
fill (0);
//boca
arc (100, 140,100,55, 3.14,6.30);
fill (255, 0, 0);
//llengua
arc (100, 140, 50, 30, 3.14, 6.30);
stroke (0);
//campaneta
ellipse(100, 117, 4, 7);
//ralla llengua
line (100, 140, 100, 130);
fill (255, 255, 255);
//ulls
ellipse (75, 73, 25, 25);
ellipse (120, 73, 25, 25);
fill (20, 90, 40);
//nineta ulls
ellipse (74, 73, 8, 8);
ellipse (119, 73, 8, 8);
fill (200, 200, 255);
//llagrimes esquerra
ellipse ( 64, 83, 7, 4);
ellipse (58, 92, 7 , 4);
ellipse (52, 105, 7, 4);
//llagrimes dreta
ellipse ( 135, 84, 7, 4);
ellipse ( 142, 97, 7, 4);
ellipse ( 149, 109, 7, 4);
fill (240,200,100);
//cabell
arc ( 100 ,  56 , 105, 60, 3.14, 6.30);
if (mousePressed){
 fill (255,0,0);
 //llagrimes esquerra
ellipse ( 64, 83, 7, 4);
fill (0,0,255);
ellipse (58, 92, 7 , 4);
 fill (255,0,0);
ellipse (52, 105, 7, 4);
//llagrimes dreta
fill (0,0,255);
ellipse ( 135, 84, 7, 4);
fill (255,0,0);
ellipse ( 142, 97, 7, 4);
fill (0,0,255);
ellipse ( 149, 109, 7, 4);
fill (0,0,255);
//ulls
ellipse (75, 73, 25, 25);
fill (255,0,0);
ellipse (120, 73, 25, 25);
 fill (255,255,255);
 ellipse (74, 73, 8, 8);
ellipse (119, 73, 8, 8);
fill (255,255,255);
arc ( 100 ,  56 , 105, 60, 3.14, 6.30);
}
}



