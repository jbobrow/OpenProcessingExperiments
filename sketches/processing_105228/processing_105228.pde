
color col_A = color(100, 100, 100);
color col_B = color(100, 100, 100);
color col_C = color(100, 100, 100);
color col_D = color(100, 100, 100);
void setup (){
  size (400, 400);
}

void draw(){
  int posX = mouseX;
  int posY = mouseY;
  rectMode(CENTER);
  fill (col_A);
  rect(150, 150, 100, 100);
  fill (col_B);
  rect(150, 250, 100, 100);
  fill (col_C);
  rect(250, 150, 100, 100);
  fill (col_D);
  rect(250, 250, 100, 100);

  if(posX <= 200 && posY <=200){
   col_A = color(200, 200, 200);
}
   else{ col_A = color(100, 100, 100);
}

 if(posX <=200 && posY >=200){
  col_B = color(200, 200, 200);
 }
   else{ col_B = color(100, 100, 100);
 }
 
  if(posX >=200 && posY >=200){
  col_C = color(200, 200, 200);
}
   else{ col_C = color(100, 100, 100);
 }
 
if(posX >=200 && posY <=200){
  col_D = color(200, 200, 200);
}
   else {col_D = color(100, 100, 100);
}

}






