
int posX, posY, velX, velY;  // Es defineixen les variables
int ionX, vel;

PImage img;  //Es defineixen les imatges
PImage img2;


void setup()
{
  
   
  size (900,660);  // Canvi del tamany de la pantalla
  img = loadImage("http://universitam.com/academicos/wp-content/uploads/2012/06/asteroides.jpg");  // S'introdueixen les imatges de fons a través de l'enllaç
  img2 = loadImage("http://2.bp.blogspot.com/-p_Vh_oPDgDQ/T-efgrJNzWI/AAAAAAAAAYw/PHPOLuJzZ-Y/s1600/millenium-falcon.jpg");
  
  posX = width/2;  // Es donen valors al moviment de l'astronauta
  posY = height/2;
  velX = 4;
  velY = 4;
  
 ionX = 500;
 vel = 50;
 
}

void draw()
{

  image (img,0,0,1000,700);  // Es col·locan les imatges
  image (img2,-75,450,300,200);
  
  posX = posX+velX;  // Es condicionen les restriccions de l'astronauta amb els limits de la finestra
  posY = posY+velY;
  
  if((posX<50)||(posX>width-30)){    
    velX = -velX;
  } 
  
    
  if((posY<40)||(posY>height-90)){
    velY = -velY;
  } 
  
     
  
    strokeWeight(3); // Dibuix de l'astronauta
    fill (5,5,5);
    stroke (250,250,250);
    line(50,525,posX,posY+35);
      
    strokeWeight(1);
    stroke (1);
    fill (250,250,250);
    rect(posX-15, posY+10, 30, 50);
    rect(posX-15, posY+60, 10, 35);
    rect(posX+5, posY+60, 10, 35);
    rect(posX+15, posY+20, 20, 10);
    rect(posX-35, posY+20, 20, 10);
    ellipse (posX, posY, 50, 50);
    fill (171,250,250);
    ellipse (posX, posY-5, 35, 25);
    
    fill (250,250,250);
    
    if(posX<width/2){  // Definim la condició de que quan l'astronauta estigui a la meitat esquerra de la finestra hi hagi un canvi
    
    fill (250,250,250);
    ellipse (posX, posY-25, 100, 100);  // Apliquem un augment del cap de l'astronauta
    fill (171,250,250);
    ellipse (posX, posY-30, 85, 60);
    
   
  }
  
    if(posY<height/2){  // Definim la condició de que quan l'astronauta estigui a la meitat superior de la finestra hi hagi un canvi
 
    noStroke ();
    fill (250,250,250);
    ellipse (posX, posY+50, 50, 70); // S'engreixa l'astronauta
    
    }

  
}


void mousePressed() {
  if (mouseButton == LEFT) {    // S'aplica la funció la qual es activada al premer el botó del mouse esquerra
    
    ionX = ionX + vel;
 
  }
    noStroke ();  // Dibuix del coet
    fill(250,250,250);
    ellipse(ionX-width/2-15,height/2,150,120);
    rect(ionX-width/2-125,height/2-50,125,100);
    
    fill(75,140,180);
    ellipse(ionX-width/2-30,height/2,30,30);
    ellipse(ionX-width/2+20,height/2,30,30);
   
    fill(250,0,0);
    ellipse(ionX-width/2-175,height/2-20,75,30);
    ellipse(ionX-width/2-175,height/2+20,75,30);
    fill(250,250,0);
    ellipse(ionX-width/2-160,height/2-20,50,15);
    ellipse(ionX-width/2-160,height/2+20,50,15);
    
    
     
}



