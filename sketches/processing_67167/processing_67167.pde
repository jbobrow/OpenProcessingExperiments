
//source code based on in-class sample, instructor: noa dolberg

int numLetters = 500;

float[] expX = new float[numLetters];
float[] expY = new float[numLetters];
float[] speedX = new float[numLetters];
float[] speedY = new float[numLetters];

color[] explode = new color[numLetters];

PFont boom;

float gravity;

void setup (){
  size (500, 500);
  smooth ();
  
  boom = loadFont("Ziggurat-HTF-Black-70.vlw");
  
  gravity = 0.1;

}

void draw (){
  background (0);

  for (int i = 0; i < expX.length; i++){
  
    expX[i] += speedX[i];
    expY[i] += speedY[i];
    
    speedY[i] += gravity;

      if (expX[i] < 0 || expX[i] > width){
        speedX[i] *= -1;  
      }
      
      if (expY[i] > height){
        speedY[i] *= -1;  
      }
       
    
  }
  for (int i = 0; i < expX.length; i++){
        fill (255, 0, 0);
        text("BOOM", expX[i], expY[i]);  
      }
}


 void mouseReleased (){
   
   for (int i=0; i < expX.length; i++){
     expX[i] = mouseX;
     expY[i] = mouseY;
     
     speedX[i] = random (-2, 2);
     speedY[i] = random (-100, -5);
     
     explode[i] = color (255, 0, 0, 0);
   }  
   
 }

