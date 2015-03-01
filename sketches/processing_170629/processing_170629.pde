
//Music stuff
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context


//variables
int quantity = 10;
int constraints = 100;
int minSize = 30;
int maxSize = 60;
int rValue = 150;
int gValue = 200;
int bValue = 210;
boolean blueOrRed = true;

//arrays
float [] xEllipse1 = new float[quantity];
float [] yEllipse1 = new float[quantity];
float [] xEllipseD1 = new float[quantity];
float [] yEllipseD1 = new float[quantity];
float [] ellipseSize = new float[quantity];

void setup () {
 size(1440, 900);
 frameRate(30);
 smooth(); 
 
 //setup
 for(int i = 0; i < quantity; i++) {
    xEllipse1[i] = random(200, width - 200);
    yEllipse1[i] = random(200, height - 200);
    xEllipseD1[i] = (random(-0.8, 0.8));
    yEllipseD1[i] = (random(-0.8, 0.8));
    ellipseSize[i] = round(random(minSize, maxSize));
  }
 
 //More music stuff
 minim = new Minim(this);
  player = minim.loadFile("Music for Manatees.mp3", 2048);
  player.play();
 
}

void draw () {
 
  background(255);
  
    fill(rValue, gValue+30, bValue+30, 100); 
    stroke(rValue, gValue, bValue);
  
   //for loop that draws the ellipses
   for(int i = 0; i < quantity; i++) {
     
     
    //Ellipses 
    strokeWeight(1);
    
    //Mouse input
    if(!(mousePressed &&(mouseButton == RIGHT))) {
       ellipse( xEllipse1[i], yEllipse1[i], ellipseSize[i], ellipseSize[i]);
    }
    
    
    //changing the ellipses position
    xEllipse1[i] += xEllipseD1[i];
    yEllipse1[i] += yEllipseD1[i];
  
    
    
    //If collides with the side then bounce
    if(xEllipse1[i] <= constraints || xEllipse1[i] >= width - constraints) {
      xEllipseD1[i] = -xEllipseD1[i];
    }
    if(yEllipse1[i] <= constraints || yEllipse1[i] >= height - constraints) {
      yEllipseD1[i] = -yEllipseD1[i];
    }
    
    
    
    //Drawing the lines
    
    line( xEllipse1[i], yEllipse1[i], xEllipse1[0], yEllipse1[0]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[1], yEllipse1[1]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[2], yEllipse1[2]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[3], yEllipse1[3]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[4], yEllipse1[4]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[5], yEllipse1[5]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[6], yEllipse1[6]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[7], yEllipse1[7]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[8], yEllipse1[8]);
    line( xEllipse1[i], yEllipse1[i], xEllipse1[9], yEllipse1[9]);



   //Changing colors
   if(mousePressed && abs(mouseX-xEllipse1[i]) <= ellipseSize[i]/2 && abs(mouseY-yEllipse1[i]) <= ellipseSize[i]/2 && blueOrRed == true) {
      rValue = 210;
      gValue = 150;
      bValue = 150;
      blueOrRed = false;
      delay(75);
    } else if (mousePressed && abs(mouseX-xEllipse1[i]) <= ellipseSize[i]/2 && abs(mouseY-yEllipse1[i]) <= ellipseSize[i]/2 && blueOrRed == false) {
      rValue = 150;
      gValue = 200;
      bValue = 210;
      blueOrRed = true;
      delay(75);
    }
    
    
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}


