
//Se introducen variables, y definen posiciones.
int i, numcara=50;
float[] posX = new float[numcara];
float[] posY = new float[numcara];
color[] colorcara = new color[numcara];

 
void setup()//Se definen la medida de la pantalla, la posiciÃ³n inicial y el color de cada cara.
{
  size(600,600);
  for(int i=0; i<numcara; i++){ 
    posX[i] = (posX[i]+width/2)+(int)random(-width/25,width/250);
    posY[i] = (posY[i]+height/2)+(int)random(-width/25,width/250);
    colorcara[i] = color(random(250),(200),(30));
  }
}
 
void draw(){
    background(mouseY-22,0,mouseX);//Color del fondo en funciÃ³n de la posiciÃ³n del ratÃ³n.
  for(int i=0; i<numcara; i++){
    posX[i] += random(-4,4);
    posY[i] += random(-4,4);
 
//Rebotes en ambos lados de la pantalla
    if(posX[i]<20){
      posX[i] = 20;
    }
    if(posX[i]>width-18){
      posX[i] = width-18;
    }
    if(posY[i]<height/25){
      posY[i] = height/15;
    }
    if(posY[i]>height-20){
      posY[i] = height-20;
    }
   
   //caras:
    stroke(255);
    strokeWeight(0.25);
    fill(colorcara[i]);
    ellipse(posX[i],posY[i],width/12,width/12);
    //sonrisa
    strokeWeight(1.5);
    beginShape();
    curveVertex(posX[i]+10,posY[i]+5);
    curveVertex(posX[i]+10,posY[i]+5);
    curveVertex(posX[i],posY[i]+12);
    curveVertex(posX[i]-10,posY[i]+5);
    curveVertex(posX[i]-10,posY[i]+5);
    endShape();
    //ojoss;
    noStroke();
    fill(255);
    ellipse(posX[i]+10,posY[i]-5,5,5);
    ellipse(posX[i]-10,posY[i]-5,5,5);

  }
}
 
 
void mousePressed(){
//cuando mouse click caritas apareceran donde Ã©ste estÃ©.
   for(int i = 0; i<numcara; i++){
     posX[i] = mouseX;
     posY[i] = mouseY;
   }
}
