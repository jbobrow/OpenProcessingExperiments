
int ulls=25;
int i;
int z=10;
int y=25;

//Matriu posicions x, y d'ulls:
float[] posX = new float[ulls];
float[] posY = new float[ulls];
 
 
//Matriu colors 
color[] colorNineta = new color[ulls];

void setup(){
  size(400,400);
  //origen posicions i vel:
  for(int i=0; i<ulls; i++){
    posX[i] = (posX[i]+width/2)+(int)random(-10,10);
    posY[i] = (posY[i]+height/2)+(int)random(-10,10);
    colorNineta[i] = color(random(100),random(50),random(150));
  
  }
}
 
void draw(){
   
  background(50,100,posY[i]);
 
  //bucle mateixes accions valors de les matrius:
  for(int i=0; i<ulls; i++){
    //Redeterminem posicions inicial
    posX[i] += random(-5,5);
    posY[i] += random(-5,5);
    
     //Delimitem
  
    if(posX[i]<20){
      posX[i] = 20;
    }
    if(posX[i]>width-20){
      posX[i] = width-20;
    }
    
    
     if(posY[i]<20){
      posY[i] = 20;
    }
    if(posY[i]>height-20){
      posY[i] = height-20;
    }

//dibuix ull
stroke(0);
ellipse(posX[i],posY[i],z*5,z*5);
line(posX[i],posY[i],width/2,height/2);
stroke(80);
strokeWeight(5);
fill(255);
ellipse(posX[i],posY[i],z*4,z*2.5);
strokeWeight(2);
stroke(0);
fill(colorNineta[i]);
ellipse(posX[i],posY[i],z*2,z*2);
fill(0);
ellipse(posX[i],posY[i],z/2,z/2);
}
}
 
void mousePressed(){
    
  //grans per clic
   if(z<y){
     z = z+1;
   }
   //tornen mida original
   if(z>=y){
     z = 10;
   }
}



