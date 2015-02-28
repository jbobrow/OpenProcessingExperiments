


void setup(){
  frameRate(6);
  size(456,262);  

  PImage bg;
  bg = loadImage("pimplechest.gif");
  background(bg);
  
 
}

void draw(){
  
 //sets a cookie wherever you click
 if (mousePressed == true){
  PImage pop;
  pop = loadImage("pop.gif");
  imageMode(CENTER);
  image(pop,mouseX,mouseY);
  
 } 
 
 //resets the pan
 if(keyPressed){
    if(key == 'd' || key == 'D'){
      PImage bg;
      bg = loadImage("thanks.gif");
      background(bg);
       fill(0);
      
      }
    }
}

