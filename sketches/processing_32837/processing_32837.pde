
PFont myFont;
PFont tryFont;

void setup(){
  size(550,400);
  noStroke();
 
}

void draw(){
  
  background(255);
  for(int i=0; i<width; i+=10) {
    for(int j=0; j<height; j+=10){
      fill(random(0,255),600,600);
      ellipse(i,j,10,10);
      
 myFont = createFont("Times-Roman",60,true);
  textFont(myFont);
  fill(0);
  textSize(20);
  text("I may even get some sleep tonight",0, 20);
  text("Goodnight",450,375);
    }
  }
}

