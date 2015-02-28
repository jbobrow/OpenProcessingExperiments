
int rectColor = color (176,140,24); //color cara
int t=0;

int ojoColor = color (86,198,253); //color ojos


float ceja1 = random (110,110);
float ceja2 = random (100,100);

float ceja3 = random (181,181);
float ceja4 = random (96,96);



void setup(){
  size (300,300);
  background(#5A3C3C);
}
//ADAN BACHIR 1R ASIX
void draw () {

  //cara
  
  fill (#FA1E0A);
  triangle (205,299,105,299,154,200);
  stroke(#B08C18);
 
  fill(rectColor);
    ellipse(150,150,200,220);
  
  //pelo
  stroke(#000000);
  line (202,20,229,75);
  fill (#8A360C);
  triangle(251,87,49,69,213,6);
  stroke(#000000);
  line (202,20,229,75);
  line (204,25,93,64);
  line (212,40,145,65);
  line (216,52,180,67); 
  line (225,66,192,75);
  //ojo derecho
  stroke(#ffffff);
  fill (#ffffff);
  ellipse(190,130,70,50);
  //pupila
  stroke (#000000);
  fill (#000000);
  ellipse(190,130,35,25);
  //iris
  stroke (ojoColor);
  fill (ojoColor);
  ellipse(190,130, random(10,20), random(10,20));
  
   //ojo izquierdo
   stroke(#ffffff);
  fill (#ffffff);
  ellipse(100,130,70,50);
    //pupila
  stroke (#000000);
  fill (#000000);
  ellipse(100,130,35,25);
  //iris
  stroke (ojoColor);
  fill (ojoColor);
  ellipse(100,130, random(10,20), random(10,20));
  
  //ceja izquierda
  stroke(#000000);
  fill (#000000);
  triangle(141,124,65,100,105,96);
  triangle (141,124,65,100,ceja1,ceja2);
    //ceja derecha
  stroke(#000000);
  fill (#000000);
  triangle(151,124,225,100,ceja3,ceja4);
  
    //boca
  curve (131,257,104,199,185,178,150,228);
 
  //nariz
  line (154,132,164,161);
  line (138,132,132,159);
  line (164,161,132,159);
  fill (#5B2003);
  ellipse (155,152,10,10);
  ellipse (140,152,10,10);
  
  
  
  println(mouseX+","+mouseY);
}

void mousePressed(){
  //textos
      textSize(20);
      fill (#F70E21);
      if(t==0){
       text("Estoy cableao!!!",10,20);
         t=t+1;
        }else if(t==1){
         text("#!@%?*",20,260);
         t=t+1;
        }else if(t==2){
         text("I Kill YOU!",202,260);
         t=t+1;
        }else if(t==3){
          text("WTF!",240,47);
           t=t+1;
              
              }

 //color cara
  rectColor = color (#DD2626);
  //movimiento cejas
  ceja1 = random (90,90);
  ceja2 = random (80,80);
  ojoColor = color (#DD2626); //color ojos
  ceja3 = random (198,198);
  ceja4 = random (83,83);

}

void mouseReleased(){

  
ojoColor = color (86,198,253);
  
  rectColor = color (#B08C18);
  ceja1 = random (110,110); //cejas
  ceja2 = random (100,100);
  
  ceja3 = random (181,181);
  ceja4 = random (96,96);
}



