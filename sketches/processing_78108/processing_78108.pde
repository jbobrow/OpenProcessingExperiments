
int tamany = 10;
void setup(){
 size(600,600);
 background(190);
}
void draw (){
  //cantonades.
  if(key == 'a'){
   fill (random(255), random(255), random(255)); 
   triangle (600,600,mouseY,600,600,550);
   triangle (0,0,mouseX,0,0,50);
   triangle (600,0,600,50,mouseY,0);
   triangle (0,600,mouseY,600,0,550); 
  } 
  //rodona negra.
  if (mousePressed){
   fill (0,0,0);
   ellipse (mouseX,mouseY,tamany,tamany);
  }
  //contorn.
  if (key == 'z'){
   strokeWeight(3);
  }
  //treure contorn.
  if (key == 'x'){
   strokeWeight(0);
  }
  //triangle blanc.
  if (mousePressed && key == 'c'){
   fill (225,225,225); 
   triangle(mouseX, mouseY-40, mouseX-20, mouseY+20, mouseX+20, mouseY+20);
  }
  //quadrat blanc.
  if (mousePressed && key == 'v'){
   fill (225,225,225); 
   rect(-5 +mouseX,-5 +mouseY,tamany,tamany); 
  }
  //corves multicolors.
  if (mousePressed && key == 'b'){
   fill (random(255), random(255), random(255)); 
   bezier (mouseX,mouseY,286,94,379,171,316,284);
  }
  //rodona multicolor.
  if (key == 'n'){
   fill(random(mouseX),random(mouseY),random(mouseX),random(mouseY));   
   ellipse (mouseX,mouseY,tamany,tamany);
  }
  //rodona doble.
  if (key == '2'){
   fill (0,0,0); 
   ellipse (width-mouseX,mouseY,tamany,tamany);
  }
 }
 void keyPressed(){
 //fons aleatori.
 if (key == 'q'){
  background(random(225),random(225),random(225));   
 }
 //fons blanc.
 if (key == 'w'){
  background(#FFFFFF);   
 }
 //fon negre.
 if (key == 'e'){
  background(0,0,0);   
 }
 //augmentar.
 if (key == '+' ){
  tamany = tamany +5;
 }
 //reduir.
 if (key == '-' ){
  tamany = tamany -5; 
 }
}

 




