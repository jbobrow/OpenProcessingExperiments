
//Júlia Molins Saura
//Pràctica 4: tortuga ninja amb matriu i random walker
 
int i;
int numTortugues = 4;

//Matriu de posicio
float[] posx = new float[numTortugues];
float[] posy = new float[numTortugues];

//Colors
int color1= color (120,20,140,200);
int color2= color(random(0),random(142),random(255));
int color3= color (120,20,140,200);

 

void setup(){
  size(800,800);
  noCursor();
  //Determinem la posició inicial,velocitat i color
  for (int i = 0; i<numTortugues; i++)  {
  posx[i] = (posx[i]+width/2)+(int)random(-20,20);
  posy[i] = (posy[i]+height/2)+(int)random(-20,20);
     
}
  
}

 
void draw(){

  //dibuix de fons 
  background(250,195,200);
  noStroke();
    
  //inimiciem BUCLE 
  for (int i = 0; i<numTortugues; i++) {

  //REdeterminem les posicions inicials  
  posx[i] +=random(-20,20);
  posy[i] +=random(-20,20);

  //LIMITS
    //posicio X
    if(posx[i]>height-90){
      posx[i]=height-90;
    }
    if(posx[i]<90){
    posx[i]=90;
    }
    //posicio Y
    if(posy[i]>height-90){ 
    posy[i] = height-90;
    }
    if(posy[i]<110){ 
    posy[i] = 110;
    }

  //DIBUIX (l'he reduit a 1/3)
    //Closca
    fill(20,100,4,200);
    ellipse(posx[i],posy[i],width/6,height*2/9);
    //Panxa
    fill(100,200,4,120);
    ellipse(posx[i],posy[i],width*3/21,height*4/21);
    //Pit
    fill(235,255,113);
    rect(posx[i]-width/24,posy[i]-height/30,width/12,height/15);
    ellipse(posx[i],posy[i]+height/30,width/12,height/12);
    //Cap
    fill(100,200,4);
    ellipse(posx[i],posy[i]-height/9,width/12,height/12);
    ellipse(posx[i],posy[i]-height/12,width/9,height/15);
    //Mans
    fill(100,200,4);
    ellipse(posx[i]-width/11,posy[i]+height/30,width/30,height/30);
    ellipse(posx[i]+width/11,posy[i]+height/30,width/30,height/30);
    //Cinta-cap:
    fill(color1);
    rect(posx[i]-width*7/144,posy[i]-height/9,width*7/72,height/45);
    //Pal
    fill(200,100,3);
    rect(posx[i]-width*6/42,posy[i]+height/36,width*6/21,height/66);
    fill(100,80,40);
    rect(posx[i]-width*2/42,posy[i]+height/36,width*4/42,height/66);
    }
}
 
//AL CLICAR AMB EL MOUSE
void mousePressed(){
  
    //Retorna al centre
    for (int i = 0; i<numTortugues; i++) {
    posx[i]=mouseX;
    posy[i]=mouseY;
  }
  
  //Cambia de color
    color1= color2;
    color2= color3;
    color3= color1;  
 
  
}  
    




