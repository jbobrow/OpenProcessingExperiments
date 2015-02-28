
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound; 


int num = 3000;  //number of particles in the scene
float[] x = new float[num];  // make an array to store their x coordinates
float[] y = new float[num];  // and one for their y coordinates


void setup(){
  size(300,300);
   minim = new Minim(this);
   mySound = minim.loadFile("09 Rebellion (Lies).mp3");
 mySound.play();     
 smooth();
 colorMode(RGB, 50);
  

  for (int i = 0; i < num; i++){  
    x[i] = random(width);
    y[i] = random(height)+mySound.left.level()*300;
  }

 noStroke();
 fill(random(10,50),50);
}

void draw(){
  float B = mySound.right.level() * 200;
  
  background(0);
  for (int i = 0; i < num; i++){
    float speed = pow(B,2)/100*random(1,4) + 0.05;            // let speed be equal to b squared plus 0.05
    x[i] += speed;                            // move the particles using speed (the current x position + speed = new x position)
    
    if (x[i] > width) {                       // if the particles leave the window
      x[i] = 0;                               // start them over on the left side...
      y[i] = random(height)+mySound.left.level()*500;                  // ...at a new, random height
    loop(); 
    
  }
     fill(mySound.mix.level()*500,10);
    rect(x[i], y[i],6,6);                        // draw the point to the screen
  }
}
  

