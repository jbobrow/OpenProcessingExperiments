

  
PImage cream;
PImage cupline;
PImage lip1;
PImage lip2;
PImage starbucks;
PImage straw;
  
float pmillis = 0;
float angle, inc;


void setup(){
   size(500,700);
   smooth();
   noStroke();
   imageMode(CENTER);
  

  
  cream = loadImage("cream.png");
  cupline = loadImage("cupline.png");
  lip1 = loadImage("lip1.png");
  lip2 = loadImage("lip2.png");
  starbucks = loadImage("starbucks.png");
  straw = loadImage("straw.png");
  }
    
void draw(){
    image(starbucks,250,350);
    image(cupline,80,300);


 if (millis() - pmillis >= 1000) {
     inc = random(-0.07, 0.07); 
     pmillis = millis();
  }
   
  angle += inc;

  pushMatrix();
  translate(287,146);
  rotate(-angle*2);
  image(lip1,0,0);
  popMatrix();
  image(straw,321,220);
  image(straw,300,180);
 
  pushMatrix();
  translate(173,410);
  rotate(angle);
  image(lip2,0,0);
  popMatrix();
  image(cream,100,580);
  
  fill(0, random(70));
  rect(0, 0, 500, 700);

}

  
  //image(lip1,293,155);


  
  




