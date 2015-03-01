
void setup(){
size (500,500);
background(255,255,255);
}

//tablete de colores
void draw(){
  println (mouseX + "," + mouseY);
 
  fill(0,0,0);
  rect(0,0,180,70);
  fill(255,0,0);
  rect(20,20,30,30);
  fill(0,255,0);
  rect(70,20,30,30);
  fill(0,0,255);
  rect(120,20,30,30);
  fill(0,0,0);
  rect(415,0,500,70);
  line(440,20,480,50);
  line(480,20,440,50);
  
 
//definir acciones
if(mousePressed ){
  line(mouseX,mouseY,pmouseX,pmouseY);
  //restart el color
  if(mouseX>415 && mouseX<700 && mouseY>0 && mouseY<70){
     background(255,255,255);
  }
  //pintar con colores
  if(mouseX>20 && mouseX<50 && mouseY>20 &&mouseY<50){
   stroke(255,0,0);}
   line(mouseX,mouseY,pmouseX,pmouseY);
  if(mouseX>70 && mouseX<100 && mouseY>20 &&mouseY<50){
   stroke(0,255,0);}
   line(mouseX,mouseY,pmouseX,pmouseY);
  if(mouseX>120 && mouseX<150 && mouseY>20 &&mouseY<50){
   stroke(0,0,255);
   }
   
   }
   }




