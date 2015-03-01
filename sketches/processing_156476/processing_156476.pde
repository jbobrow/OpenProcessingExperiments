
int xPos;
int yPos;

PFont font;

void setup()
 {
   
  size (425,425);
  smooth();
  background(0);
  
  font = createFont("arial", 16);
  textFont(font);
  
  xPos = 38;
  yPos = 385;
  fill(255,0,0);
  ellipse (xPos,yPos,10,10);
  
}


void draw()
{
  if(frameCount > 200){
    fill(255);
    text("FIND YOUR CENTER", 30, 18);
    }
  
  //MAZE - FRAME
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(25,25,375,375);
  
  if(frameCount > 500){
    fill(0);
    stroke(0);
    rect(0,0,300, 22);
    }
  
  
  if(frameCount > 600){
 
    fill(255);
    stroke(255);
    strokeWeight(2);
    
    //MAZE - HORIZONTAL LINES
    line(50,50,100,50);
    line(125,50,375,50);
    
    line(150,75,200,75);
    line(350,75,375,75);
    
    line(50,100,75,100);
    line(175,100,225,100);
    
    line(25,125,50,125);
    line(125,125,150,125);
    line(175,125,275,125);
    line(300,125,350,125);
    
    line(50,150,75,150);
    line(100,150,125,150);
    line(175,150,250,150);
    line(275,150,325,150);
    line(350,150,375,150);
    
    line(25,175,50,175);
    line(75,175,150,175);
    line(175,175,200,175);
    line(300,175,350,175);
    line(375,175,400,175);
    
    line(50,200,75,200);
    line(100,200,125,200);
    line(150,200,200,200);
    line(250,200,325,200);
    line(350,200,375,200);
    
    line(225,225,250,225);
    line(325,225,350,225);
    
    line(125,250,175,250);
    line(275,250,350,250);
    line(375,250,400,250);
    
    line(125,275,150,275);
    line(200,275,250,275);
    line(300,275,325,275);
    
    line(150,300,175,300);
    line(200,300,225,300);
    line(300,300,325,300);
    line(375,300,400,300);
    
    line(50,325,125,325);
    line(150,325,225,325);
    line(50,325,125,325);
    
    line(75,350,100,350);
    line(125,350,150,350);
    line(225,350,275,350);
    line(325,350,400,350);
    
    line(125,375,175,375);
    line(275,375,300,375);
  }
  
  if(frameCount > 700){

    //MAZE - VERTICAL LINES
    
    line(50,75,50,100);
    line(50,225,50,400);
    
    line(75,50,75,100);
    line(75,125,75,150);
    line(75,200,75,300);
    line(75,350,75,375);
    
    line(100,50,100,125);
    line(100,150,100,175);
    line(100,200,100,225);
    line(100,250,100,275);
    line(100,300,100,325);
    line(100,350,100,400);
    
    line(125,50,125,125);
    line(125,200,125,250);
    line(125,275,125,300);
    
    line(150,75,150,200);
    line(150,225,150,250);
    line(150,275,150,300);
    
    line(175,100,175,125);
    line(175,175,175,350);
    line(175,375,175,400);
  
    line(200,225,200,275);
    line(200,325,200,375);
    
    line(225,75,225,100);
    line(225,150,225,225);
    line(225,275,225,300);
    line(225,325,225,350);
    line(225,375,225,400);
    
    line(250,75,250,125);
    line(250,150,250,175);
    line(250,225,250,275);
    line(250,300,250,375);
  
    line(275,50,275,100);
    line(275,150,275,175);
    line(275,225,275,325);
    line(275,375,275,400);
    
    line(300,50,300,150);
    line(300,225,300,250);
    line(300,275,300,350);
    
    line(325,75,325,125);
    line(325,200,325,225);
    line(325,250,325,275);
    line(325,300,325,325);
    line(325,350,325,375);
    
    line(350,75,350,100);
    line(350,150,350,175);
    line(350,200,350,225);
    line(350,250,350,300);
    line(350,325,350,350);
    line(350,375,350,400);
    
    line(375,50,375,125);
    line(375,150,375,175);
    line(375,225,375,250);
    line(375,275,375,325);
    line(375,375,375,400);
  }
  
  if(frameCount > 750) {
    stroke(0);
    strokeWeight(5);
    fill(255,0,0);
    ellipse (225,250,42,42);
    fill(255,0,0);
    ellipse(225,250,23,23);
    fill(0);
    strokeWeight(0);
    ellipse (225,250,10,10);
  }
  
  if(xPos == 225 && yPos == 250){
    background(255);
    fill(0);
    textSize(40);
    text("YOU DID IT!",width/2,height/2);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      fill(255,0,0);
      stroke(0);
      strokeWeight(2);
      ellipse (xPos,yPos-=5,10,10);
      
    }  
    if (keyCode == DOWN) {
      fill(255,0,0);
      stroke(0);
      strokeWeight(2);
      ellipse (xPos,yPos+=5,10,10);
      
    }
     if (keyCode == LEFT) {
      fill(255,0,0);
      stroke(0);
      strokeWeight(2);
      ellipse (xPos-=5,yPos,10,10);
      
    }  
    if (keyCode == RIGHT) {
      fill(255,0,0);
      stroke(0);
      strokeWeight(2);
      ellipse (xPos+=5,yPos,10,10);
      
    }
}
}
