

 void setup(){ 
size(400,300); //tamaño en pixeles de la reproducción
smooth(); //suavizado
fill(mouseX, 17);//color de relleno, degradación
stroke(255);//color
  strokeWeight(3/2); //grosor de los bordes de línea
loop();
} 
 
void draw() 
{ 
  
  for (int k=0;k<100;k++) //para que se cumplan los enunciados de abajo y poder formar los círculos
  {      
   ellipse (frameCount*cos(k), 150,frameCount*sin(k),height);  
      ellipse (frameCount*sin(k), width* height,frameCount*cos(k),width);
    ellipse (frameCount*tan(k), 150,frameCount*tan(k),height);  
      ellipse (frameCount*sin(k)/2, width* height,frameCount*cos(k)/2,width);
      
     ellipse (frameCount*cos(k)*10, 0,frameCount*tan(k)*5, 0);  
      ellipse (frameCount*sin(k), height* height,frameCount*cos(k),width*width);
   
  } 
    for (int j=0;j<100;j++) //para las líneas que se van estirando 
  {     
  
    line (frameCount*tan(j)/sin(j),0,frameCount*cos(j)/sin(j),height); 
    line (frameCount*sin(j)/tan(j),0,frameCount*cos(j)*sin(j),width);line (frameCount*tan(j)/sin(j),0,frameCount*cos(j)/sin(j),height);//líneas que forman la telaraña
 
} 
}

