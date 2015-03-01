
float counter = 1;
color c;
float posX;
float posY;



void setup(){

  size(500,500);
  smooth();
  //noStroke();
  stroke(255);
  strokeWeight(10);
  c = color (255,128,128);
  background(0);

}




void draw(){
  

if (posX == 0 && posY == 0) { 
  
 posX = width/2;
 posY = height/2; 
  
  
}
  
  

  fill(c);
  arc(posX,posY,100,100,radians(0),radians(counter));


counter*=1.15;

if (counter > 450) {
    
    counter = 1;
    fill(0,0,0,30);
    rect(0,0,width,height);
    posX = random(120,width-120);
    posY = random(120,height-120);
    c = color (random(255),random(255),random(255));  
}

}
