

void setup (){
size (400, 400); 
smooth ();
background (250);
}
//lineas horizontales-horizontalines
void draw (){
  strokeWeight (7);
  line (0, 100, 500, 100);
  line (0, 200, 500, 200);
  line (0, 300, 500, 300);

//líneasverticales.verticalines
  strokeWeight (4);
  line (100,0, 100, 500);
  line (200, 0, 200, 500);
  line (300, 0, 300, 500);
  strokeWeight (2);
  line (350,0, 350, 500);
 
 //rectangulos-rectangles 
  strokeWeight (4);
  fill (#91E525);
  rect (0, 100, 100, 100);
  fill (#0ACB83);
  rect (300, 300, 100, 100);
  fill (#FC21CD);
  rect (300,0,50,100);
  


}





