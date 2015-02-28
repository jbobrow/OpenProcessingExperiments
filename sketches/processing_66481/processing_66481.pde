
PFont codeFont;
PFont isFont;
PFont funFont;
PFont smileFont;

void setup(){
  size(500, 500);
  noStroke();
}

void draw(){
  background(247, 147, 30);
  frameRate(60);
  smooth();
  
  //left-top
  if(mouseX < width/2 && mouseY < height/2){
    fill(252, 238, 33);
    ellipse(width/4, height/4, width/2, height/2);
  }
  
  if(mouseX > width/8 && mouseX < 3*width/8
    && mouseY > height/8 && mouseY < 3*height/8){
      fill(255);
      rectMode(CENTER);
      rect(width/4, height/4, 100, 100);
      
      codeFont = createFont("Cooper Black", 20, true);
      textFont(codeFont);
      textAlign(CENTER, CENTER);
      fill(0);
      text("CODE", width/4, height/4);
    }
  
  
  //left-bottom
  if(mouseX < width/2 && mouseY > height/2){
    fill(118, 200, 229);
    ellipse(width/4, 3*height/4, width/2, height/2);
  }
  
  if(mouseX > width/8 && mouseX < 3*width/8
    && mouseY > 5*height/8 && mouseY < 7*height/8){
      fill(255);
      rectMode(CENTER);
      rect(width/4, 3*height/4, 100, 100);
      
      funFont = createFont("Times New Roman", 20, true);
      textFont(funFont);
      textAlign(CENTER, CENTER);
      fill(0);
      text("FUN!!", width/4, 3*height/4);
    }
  
  
  //right-top
  if(mouseX > width/2 && mouseY < height/2){
    fill(217, 224, 33);
    ellipse(3*width/4, height/4, width/2, height/2);
  }
  
  if(mouseX > 5*width/8 && mouseX < 7*width/8
    && mouseY > height/8 && mouseY < 3*height/8){
      fill(255);
      rectMode(CENTER);
      rect(3*width/4, height/4, 100, 100);
      
       
      isFont = createFont("Verdana", 20, true);
      textFont(isFont);
      textAlign(CENTER, CENTER);
      fill(0);
      text("IS", 3*width/4, height/4);
    }
    
  
  //right-bottom
  if(mouseX >width/2 && mouseY > height/2){
    fill(237, 69, 86);
    ellipse(3*width/4, 3*height/4, width/2, height/2);
  }
  
  if(mouseX > 5*width/8 && mouseX < 7*width/8
    && mouseY > 5*height/8 && mouseY < 7*height/8){
      fill(255);
      rectMode(CENTER);
      rect(3*width/4, 3*height/4, 100, 100);
      
      smileFont = createFont("Verdana", 20, true);
      textFont(smileFont);
      textAlign(CENTER, CENTER);
      fill(0);
      text(":D", 3*width/4, 3*height/4);
    }
  
  
  //center part
  if(mouseX > 3*width/8 && mouseX < 5*width/8
  && mouseY > 3*height/8 && mouseY < 5*height/8){
    PImage elseimage = loadImage("elseimage.jpg");
    imageMode(CENTER);
    image(elseimage, 250, 250);
    noStroke();
  }
}

