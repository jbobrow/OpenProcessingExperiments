
/* @pjs preload="cloud.png"; */

PImage cloud;

float rainDropY1;
float rainDropY2;
float rainDropY3;

float thunderY1;
float thunderY2;
float thunderY3;

// Setups program
void setup()
{
  cloud = loadImage("cloud.png");
  rainDropY1 = 150;
  rainDropY2 = 150;
  rainDropY3 = 150;
  
  thunderY1 = 170;
  thunderY2 = 150;
  thunderY3 = 200;
  
  size(500,500); 
}

// Draw
void draw()
{  
  background(50);
  image(cloud,150,0);

  // Draws raindrops
  fill(0,0,random(200,250));   
  ellipse(200,rainDropY1,15,15); 
  ellipse(250,rainDropY2,15,15);
  ellipse(300,rainDropY3,15,15); 
  
  // Raindrop moves down
  rainDropY1 += random(0,5);
  rainDropY2 += random(0,5);
  rainDropY3 += random(0,5); 
  
  // Reset raindrops once they fall off screen
  if (rainDropY1 >= 500 && rainDropY2 >= 500 && rainDropY3 >=500)
  {
    rainDropY1 = 150;
    rainDropY2 = 150;
    rainDropY3 = 150;
  }  
  
  // If mouse is inside the cloud and the left mouse button is held, create the thunder
  if ((mouseX >= 173 && mouseX <= 337) && (mouseY >= 44 & mouseY <= 136) && mousePressed)  
  {
    fill(255,255,0);
    triangle(239, thunderY1, 243, thunderY2, 247, thunderY3);
    
    thunderY1 += 2;
    thunderY2 += 2;
    thunderY3 += 2;
        
    // Resets thunder once it falls off screen
    if (thunderY1 >= 500 && thunderY2 >= 500 && thunderY3 >=500)
    {    
      thunderY1 = 170;
      thunderY2 = 150;
      thunderY3 = 200;
    }    
  }      
}


