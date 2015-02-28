
// Marta Fernández Turu, Grup 02
 
//Definim variables
float angle;
float distancia;
int posX, posY, velX, velY;
int radi=25;
int numBoles =10;

//creem una matriu de posicionsX con "numBoles" elements:
float[] posicionsX = new float[numBoles];
//el mateix per posicionsY:
float[] posicionsY = new float[numBoles];
//i per velocitatsX:
float[] velocitatsX = new float[numBoles];
//i velocitatsY:
float[] velocitatsY = new float[numBoles];




void setup() {
  
size(500, 700);
stroke(0);
frameRate(30);
  //inicialitzem posicions i velocitats:
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] = int(random(width));
    posicionsY[i] = int(random(height));
    velocitatsX[i] = random(2,10);
    velocitatsY[i] = random(2,10);
  }

background(121,101,94); // Fons gris
 for (int x=5; x<width; x+=width/5){        // Determinem un patró de repetició en l'eix X.
  for (int y=5; y<height; y+=height/14){    // Determinem un patró de repetició en l'eix Y.
    fill(124,58,27); rect(x,y,width/5-10,height/14-10);       // Determinem quina figura volem que es repeteixi segons els patrons establerts amb anterioritat.
    
  }
}  
}



void draw(){
    background(121,101,94); // Fons gris
 for (int x=5; x<width; x+=width/5){        // Determinem un patró de repetició en l'eix X.
  for (int y=5; y<height; y+=height/14){    // Determinem un patró de repetició en l'eix Y.
    fill(124,58,27); rect(x,y,width/5-10,height/14-10);       // Determinem quina figura volem que es repeteixi segons els patrons establerts amb anterioritat.
    
  }
} 

   //iniciem un bucle perquÃ¨ faci les mateixes accions
  //a tots els valors de les matrius
  
  //actualitzem posicions
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];


    //comprobem lÃ­mits X
    if((posicionsX[i]-radi<0)||(posicionsX[i]+radi>width)){
      velocitatsX[i] = -velocitatsX[i];
    } 
    //comprobem lÃ­mits Y
    if((posicionsY[i]-radi<0)||(posicionsY[i]+radi>height)){
      velocitatsY[i]= -velocitatsY[i];
    }
    angle=atan2(posicionsX[i],posicionsY[i]);   // Determinem un angle arbitrari que varia a partir del ratolí (un angle dinàmic).
          
          
    pushMatrix(); // Amb aquesta comanda obrim una nova matriu que acceptarà les diferents accions que definim.
      
    distancia=dist(posicionsX[i],posicionsY[i],0.98*width-65,0.3*height); // Donem valor a la variable "distancia", per mitjà de la posició del mouse i del centre de la cistella.
      
      
    translate(posicionsX[i],posicionsY[i]); // Canviem les referències per tal que l'origen sigui el mouse.
    fill(203+distancia/5,86+distancia/5,34+distancia/5); ellipse(0,0,2*radi,2*radi); // Dibuixem la pilota en l'origen (mouse). El seu color variarà en funció de la posició del mouse, passant gradualment del color blanc a taronja desitjat a mesura que el cursor s'aporopa a la cistella.
    rotate(6*angle);  // Amb aquesta comanda aconseguim rotar el que dibuixem a continuació. Per tal que la rotació sigui apreciable multipliquem per 6 l'angle de rotació.
    fill(0); line(0,-radi,0,radi);
    noFill(); bezier(cos(0.96)*radi,sin(0.96)*radi,radi/5,radi/2.5,radi/5,-radi/2.5,cos(0.96)*radi,-sin(0.96)*radi); // Dibuixem les dues corbes de la pilota utilitzant la funció bezier.
    bezier(-cos(0.96)*radi,sin(0.96)*radi,-radi/5,radi/2.5,-radi/5,-radi/2.5,-cos(0.96)*radi,-sin(0.96)*radi);
      
    popMatrix();  // Amb aquesta comanda tanquem la matriu iniciada amb pushMatrix(). Les comandes definides a continuació no patiran cap de les accions definides en la matriu anterior.
  }
 

fill(0); rect(0.98*width,height,0.5*width,-525);  //Pal de la cistella.
fill(0); rect(0.98*width,0.30*height,-15,5); //Unió cistella.
fill(0); rect(0.98*width-15,0.30*height,-95,10); //Cistella.
  
 
 
fill(0); line(0.98*width-110,0.30*height+10,0.98*width-100,0.30*height+85); //Xarxa cistella E-D.
  
fill(0); line(0.98*width-100,0.30*height+10,0.98*width-90,0.30*height+85);
  
fill(0); line(0.98*width-90,0.30*height+10,0.98*width-80,0.30*height+85);
  
fill(0); line(0.98*width-80,0.30*height+10,0.98*width-70,0.30*height+85);
  
fill(0); line(0.98*width-70,0.30*height+10,0.98*width-60,0.30*height+85);
  
fill(0); line(0.98*width-60,0.30*height+10,0.98*width-50,0.30*height+85);
  
fill(0); line(0.98*width-50,0.30*height+10,0.98*width-40,0.30*height+85);
  
fill(0); line(0.98*width-40,0.30*height+10,0.98*width-30,0.30*height+85);
  
fill(0); line(0.98*width-30,0.30*height+10,0.98*width-20,0.30*height+85);
  
  
  
  
fill(0); line(0.98*width-15,0.30*height+10,0.98*width-25,0.30*height+85); //Xarxa cistella E-D.
  
fill(0); line(0.98*width-25,0.30*height+10,0.98*width-35,0.30*height+85);
  
fill(0); line(0.98*width-35,0.30*height+10,0.98*width-45,0.30*height+85);
  
fill(0); line(0.98*width-45,0.30*height+10,0.98*width-55,0.30*height+85);
  
fill(0); line(0.98*width-55,0.30*height+10,0.98*width-65,0.30*height+85);
  
fill(0); line(0.98*width-65,0.30*height+10,0.98*width-75,0.30*height+85);
  
fill(0); line(0.98*width-75,0.30*height+10,0.98*width-85,0.30*height+85);
  
fill(0); line(0.98*width-85,0.30*height+10,0.98*width-95,0.30*height+85);
  
fill(0); line(0.98*width-95,0.30*height+10,0.98*width-105,0.30*height+85);
  
  
  

    }


