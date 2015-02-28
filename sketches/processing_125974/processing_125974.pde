
/*  Alexandre F. S. Junior  Turma: S73  Trabalho 02  */

float y, x;
int w = 250;

void setup(){
  size(600,500);
  noStroke();
}

void draw(){
  background(#1B39DE);
  fill(#CDD117);
  rectMode(CENTER);
  for( x = 15; x < 600; x += 570)
    rect( x, 250, 30, 500);//rect. vertical_borda
  for( y = 15; y < 500; y += 470)
    rect( 300, y, 600, 30);//rect. horizontal_borda
  triangle( w-50, 55, w+50, 55, w, 120);//trig. sup.
  rect( w, w, 65, 350);//rect. vertical
  triangle( w-100, w+175, w, w+175, w-30, w+135);//trig. inf esq.
  rect( w+110, w+145, 200, 60);//rect. horizontal
  triangle( w+170, w+115, w+210, w+175, w+255, w+85);//trig. inf. dir.
}
