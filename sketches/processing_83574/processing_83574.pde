
Player player= new Player(); 
boolean gameOver = false; 

float[] landHeights = new float[0]; 
float landSegmentWidth = 5; 
float currentHeight = 500; 



void setup() { 
  size(600, 400);
}

void draw() { 
  background(0); 

  

  if (gameOver) { 
    text("GAME OVER", 100, 100);
  } 
  else { 
    
    if(landHeights.length>0) { 
      landHeights = subset(landHeights, 1);  
      
    }
    while(landHeights.length<width/landSegmentWidth) {
      landHeights = append(landHeights, currentHeight); 
      currentHeight+=random(-6,6); 
      if(currentHeight>height) {
        currentHeight = height;
      } else if(currentHeight<200) { 
       currentHeight = 200; 
      } 
    }
    
    // control player with the mouse : 
    //player.x = mouseX; 
    player.yVel *=0.96; 
    if ((keyPressed) && (key==' ')) { 

      player.yVel-=0.5;
    } 
    else { 

      player.yVel+=0.1;
    }

    player.y+=player.yVel; 

    if (player.y>400) { 
      gameOver = true;
    }
  }  
  player.draw();
  noStroke(); 
  for(int i = 0; i< landHeights.length; i++) { 
    rect(i*landSegmentWidth, landHeights[i], landSegmentWidth, height); 
    rect(i*landSegmentWidth, 0, landSegmentWidth, height-landHeights[i]); 
    
  }
} 

void mousePressed() { 
  if(gameOver) { 
   // reset 
   // here's where you would add the code to reset the game
  } 
  
  
}

class Player {
  float x; 
  float y;  
  float yVel; 

  Player() { 
    x = 60; 
    y = 150;
    yVel = 0;
  }

  void draw() { 
    ellipse(x, y, 30, 20);
  }
}
