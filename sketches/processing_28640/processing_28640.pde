
PImage derpderp;
PImage [] raidani;

Raidens [] raiden;


void setup(){
  

  
  size(700,464);
  derpderp = loadImage("stage.jpg");
  raidani = new PImage [6];
  //times the raiden class is called
  raiden = new Raidens[50];
  //amount of raidens called into the for loop
  for(int f = 0; f < raiden.length; f++) {
  raiden[f] = new Raidens(random(100, 600), random(100, 364));
  }
  //animation
  for(int i = 0; i< raidani.length; i ++) {
  raidani[i]= loadImage("a" + (i+1) + ".png"); 
  }
}

void draw(){
  
  image(derpderp,0,0);
  
  //update the raiden class for each raiden spawned
  for(int a = 0; a<raiden.length; a++) {
     
  raiden[a].update();
  
  }
}

class Raidens {
  //variables for the class
  float x;
  float y;
  float velY;
  float velX;
  float destinY;
  float destinX;
  int counter;
  int frame;
  int speedFrame;
  int reverbx;
  int reverby;

   //the function
  Raidens (float xpos, float ypos) { 
    x = xpos;
    y = ypos;
    //speed of rotation
    speedFrame = 4;
    destinX = x;
    destinY = y;
    reverbx = 1;
    reverby = 1;

  }
  void update() {
     
    pushMatrix();
    translate(x, y);
     
     
     
     x += reverbx;
     y += reverby;
     
     
 if (x >= 700){ reverbx =-reverbx;}
          if (x <= 10){ reverbx =1;}
               if (y >= 300){ reverby =-reverby;}
                    if (y<= 10){ reverby =1;}
 
 
   /* if(counter%100 ==0) {
      destinX =int(random(-100, 600));
    }
    if(counter%60 ==0) {
      destinY =int(random(-100, 600));
    }
    x += (destinX-x)*0.01;
    y += (destinY-y)*0.01;
    
    */
    
    if(counter%speedFrame==0) {
      frame++;
    }
    if(frame > 5) frame= 0;
    
      image(raidani[frame], -50, -50, 100, 100);
    
    popMatrix();
    counter++;
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
  



