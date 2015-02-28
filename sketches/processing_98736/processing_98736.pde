
 
  PImage afoto;//imatge del fons
  PImage lluna; //imatge de la lluna
int estrelles =10 ; // nombre d estrelles
int PosX, PosY, VelX, VelY; // velocitats i desplaçament de les estrelles
float[] posX = new float[estrelles];float[] posY = new float[estrelles];
 
float[] velX = new float[estrelles]; float[] velY = new float[estrelles];
 
var audioElement1 = document.createElement("audio");
var audioElement2 = document.createElement("audio");

//efecte de les estrelles rebotant i el tro del mouse sobre la lluna

 
void setup () {
   noCursor();
  frameRate (7);
   
  size (700,670); // tamany
  background (0); // color de fons
   
  audioElement1.setAttribute("src", "efecte.mp3");
  audioElement2.setAttribute("src", "thunder.mp3");

   
 
//so de les estrelles rebotant
//so del tro amb el mouse sobre la lluna
 
 

   afoto = loadImage ("foto.jpg");
   image(afoto,0,0);
    
   lluna = loadImage ("lluna.png");
   image(lluna,mouseX,mouseY);
    
 for(int i=0; i<estrelles; i++) //velocitat i posicions a l inici de les estrelles
 {
  posX[i] = width/2; posY[i] = height/2;
  velX[i] = random (-10,40); velY[i] = random (-50,40);
    }     
}
     
void draw () {  
  background (0);
   image(afoto,0,0);
 

   image(lluna,mouseX-130,mouseY-130);
    
    for(int x=width/5;      x<width;x=x+200)  {    //posicions del nuvols
    for(int y=height/5;     y<height;y=y+200) {
               
        // forma dels nuvols    
      fill(209,202,202);
      ellipse(x,y,130,70);
      ellipse(x,y,150,60);
      ellipse(x,y,130,70);
      ellipse(x,y,130,70);
      fill(255);
      noStroke();
      ellipse(x,y,120,40);
      ellipse(x,y,130,30);
      ellipse(x,y,110,40);
      ellipse(x,y,110,40);                
   }
  }
    
 for(int i=0; i<estrelles; i++) { 
  posX[i] += velX[i];
  posY[i] += velY[i];
  
if((posX[i]<50)||(posX[i]>width-50)){   // limits de les estrelles amb la finestra
    velX[i] = -velX[i];
    audioElement1.setAttribute("src", "efecte.mp3");
    audioElement1.play();
  }
       
  if((posY[i]<40)||(posY[i]>height-40)){
    velY[i] = -velY[i];
    audioElement1.setAttribute("src", "efecte.mp3");
    audioElement1.play();
  }
        
    fill (19,55,116);  // estrelles
      noStroke ();
      ellipse( posX[i],posY[i],20,20);
      triangle (posX[i],posY[i]-40,posX[i]-20,posY[i],posX[i]+20,posY[i]); 
      triangle (posX[i],posY[i]-15,posX[i]-40,posY[i]-15,posX[i],posY[i]+20);
      triangle (posX[i],posY[i]-15,posX[i]+40,posY[i]-15,posX[i],posY[i]+20);
      triangle (posX[i],posY[i]+20,posX[i]-20,posY[i],posX[i]-30,posY[i]+40);
      triangle (posX[i],posY[i]+20,posX[i]+20,posY[i],posX[i]+30,posY[i]+40); 
 }    
 
}
 
void mousePressed(){//so del tro  quan cliques amb el mouse
    audioElement2.setAttribute("src", "thunder.mp3");
    audioElement2.play();

}



