
int tamany=10;
int colorPint=0;
int rojo=#FA0000;
int azul=#0900FF;
int verde=#1AFF00;
int amarillo=#EFFF00;
int negro=#000000;
int fondo1=#FFFFFF;

void setup(){
  size(800,600);
  background(fondo1);

}

void draw()
{
  //Menu de colors
  fill(rojo);
  rect (0,0,30,30);
  fill(azul);
  rect (0,30,30,30);
  fill(verde);
  rect (0,60,30,30);
  fill (amarillo);
  rect (0,90,30,30);
  fill (negro);
  rect (0,120,30,30);
  //Linea
  if(key == 'z'){
    line(pmouseX,pmouseY,mouseX,mouseY);
    stroke(colorPint);
  }
  //Quadrat
  if(key == 'w' || key== 'q' || key== 'e'){
    fill(colorPint);
    noStroke();
    rect(mouseX,mouseY,tamany,tamany);
  }
  
  //Cercle
  if (key =='s' || key== 'a' || key== 'd'){
    fill(colorPint);
    noStroke();
    ellipse(mouseX,mouseY,tamany,tamany);
  }
    //Simetria amb lineas
    if(key=='x'){
    line(pmouseX,pmouseY,mouseX,mouseY);
    line(width-pmouseX,pmouseY,mouseX,mouseY);
    stroke(colorPint);
  }
  //Simetria amb quadrats
    if(key=='t' || key=='r' || key=='y'){
  fill(colorPint);
    noStroke();
    rect(mouseX,mouseY,tamany,tamany);
    rect(width-mouseX,mouseY,tamany,tamany);  
  }
  //Simetria amb cercles
   if(key=='g'|| key=='f' || key=='h'){
  fill(colorPint);
    fill(colorPint);
    noStroke();
    ellipse(mouseX,mouseY,tamany,tamany);
    ellipse(width-mouseX,mouseY,tamany,tamany);  
  }
  
   //Condicions per canviar color
    if (mouseX <= 30 && mouseY <= 30){
      colorPint=rojo;
    }
    if (mouseX <=30 && mouseY > 30 && mouseY <= 60){
      colorPint=azul; 
    }
    if (mouseX <=30 && mouseY > 60 && mouseY <= 90){
      colorPint=verde; 
    }
    if (mouseX <=30 && mouseY > 90 && mouseY <= 120){
      colorPint=amarillo;
    }
    if (mouseX <=30 && mouseY > 120 && mouseY <= 150){
      colorPint=negro;
    }
 
 
}          
void keyPressed(){
  //Per netejar la pantalla
  if (key == 'l'){
    background(fondo1);
                 }
  //Per aumentar la mida de les figures
    if (key =='e'|| key =='d'){
  tamany=tamany+1;
  } 
  //Per disminuir la mida de les figures
    if(tamany<0){
      tamany=1;
    }else if (key =='q' || key=='a'){
  tamany=tamany-1;
  }
  //Per aumentar les figures en la simetria
    if (key =='y' || key=='h'){
  tamany=tamany+1;
  } 
  //Per disminuir les figures en la simetria
    if(tamany<0){
      tamany=1;
    }else if (key =='r' || key=='f'){
  tamany=tamany-1;
  }
}


