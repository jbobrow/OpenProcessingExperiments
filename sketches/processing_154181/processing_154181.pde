
/*
 * movingScreen
 * created by @nomadiccreature (/twitter)
 * Moving the balls giving a moving screen effect, press the right and left arrow to change the speed
 * Exploring processing #Sketch4
 *
 */


float p=500;


void setup(){
    size(600,600);    
    background(255);
}

void draw(){
    rotatingCircle();
}

void rotatingCircle(){
    background(255);
    float s=20;
    
    for(int i=0;i<width/s;i++){
      for(int j=0;j<height/s;j++){
      
        float x=s;
        float y=s;
        
        float tempX=x/2+s*i;
        float tempY=y/2+s*j;
        noFill();
        noStroke();
        float m=millis();
        float rate=m/p;
        ellipse(tempX,tempY,s,s);
        float X= tempX+s/2*sin(rate);
        float Y= tempY+s/2*cos(rate);
        noFill();
        stroke(255);
        line(tempX,tempY,X,Y);
        fill(0);
        ellipse(X,Y,5,5);
      }
   }
}

void keyPressed(){
    if (keyCode == RIGHT){
    p=100;
    }

    if (keyCode == LEFT){
    p=1000;
    }
}
