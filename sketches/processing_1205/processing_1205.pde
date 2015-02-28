
class Eye
{
    float eyeSize;
    float pupilSize;
    float eyeDistance;
    float eyeX;
    float eyeY;
    float pupilX;
    float pupilY;
    float contadorX  = 0;
    float contadorY  = 0;
    Eye(float x, float y, float e)
    {
        eyeSize = 50;
        pupilSize = 20;
        eyeX = x;
        eyeY = y;
        eyeDistance = e;
        
        pupilX = eyeX;
        pupilY = eyeY;
    }
    float  addContadorX(int numero){
       contadorX= contadorX + TWO_PI/100; 
      float oscilacionX = sin(contadorX) * numero ;
     
      return oscilacionX;
    }
      float  addContadorY(int numero){
       contadorY= contadorY + TWO_PI/100; 
      float oscilacionY = sin(contadorY) * numero ;
     
      return oscilacionY;
    }
    
    void update()
    {
        float mY = map(mouseY, 0, height, -eyeSize/4, eyeSize/4);
        pupilY = eyeY + mY;

        float mX = map(mouseX, 0, height, -eyeSize/4, eyeSize/4);
        pupilX = eyeX + mX;
    }
    
    void draw()
    {
        // stroke around eyeball
        fill(255);
        ellipse(eyeX, eyeY, eyeSize + 10, eyeSize + 10);
        
        // eyeball
        fill(0);
        ellipse(eyeX, eyeY, eyeSize, eyeSize);
        
        
       for (int i=0;i<10;i ++){
         // pupil
        fill(map(i,0,10,100,255),0,0);
        ellipse(pupilX, pupilY, pupilSize-(i*10), pupilSize-(i*10));   
       }
    }
}

