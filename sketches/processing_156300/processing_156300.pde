
//int redX, redY;
//int redS = 200;
//int orangeX, orangeY;
//int yellowX, yellowY;
//int greenX, greenY;
//int blueX, blueY;
//int indigoX, indigoY;
//int violetX, violetY;

int colorR;
int colorO;
int colorE;
int colorN;
int colorL;
int colorD;
int colorV;

float c;
int t=255;

boolean mouseR;
boolean mouseO;
boolean mouseE;
boolean mouseN;
boolean mouseL;
boolean mouseD;
boolean mouseV;

PFont font;

PImage lucky;

void setup(){
  size(1400, 700);
  background(0);
  
//  redX = width/7;
//  redY = height;
    colorR = 0;
    mouseR = false;
//  orangeX = 
//  orangeY = 
    colorO = 0;
    mouseO = false;
//  yellowX = 
//  yellowY = 
    colorE = 0;
    mouseE = false;
//  greenX = 
//  greenY = 
    colorN = 0;
    mouseN = false;
//  blueX = 
//  blueY = 
    colorL = 0;
    mouseL = false;
//  indigoX = 
//  indigoY = 
    colorD = 0;
    mouseD = false;
//  violetX = 
//  violetY = 
    colorV = 0;
    mouseV = false;
    
    lucky = loadImage("lucky.jpg");
    
    font = loadFont("AGaramondPro-Bold-48.vlw");
  
    fill(0, 0, 0);
    rect(1000, 0, 200, 700);
    
    fill(0, 0, 0);
    ellipse(600, 700, 100, 100);
  
    fill(0, 0, 0);
    ellipse(300, 900, 100, 100);
  
    fill(0, 0, 0);
    ellipse(100, 200, 100, 100);
    
    fill(0, 0, 0);
    ellipse(955, 800, 100, 100);
  
    fill(0, 0, 0);
    ellipse(500, 500, 100, 100);
  
    fill(0, 0, 0);
    ellipse(800, 100, 100, 100);
}

void draw(){
  
  colorMode(HSB);
    if (c>=255){
        c=0;
      } else {
        c++;
    fill(c, 255, 255);
    textFont(font, 50);
    textAlign(CENTER);
    text("Follow the rainbow...", 900, 550);
     }   
      
  colorMode(RGB);
  
  int m = millis();
  
  if (m >=5000 && colorR <= 1){    
    fill(255);
    textFont(font, 30);
    textAlign(CENTER);
    text("Try clicking -_-", 1102, 600);
  }

    if (m >= 8000 && colorR <= 1){
      t--;
    fill(t, t, t);
    textFont(font, 100);
    text("T_T", 1100, 300);
    }
 
 if (m >= 12000){
        fill(0);
        rect(1000, 0, 200, 400);
 }
    
//    fill(random(255), random);
//    textFont(font, 30);
//    textAlign(CENTER);
//    text("Try clicking -_-", 1102, 600);
  
  if (mouseX >= 1000 && mouseX <=1200 && mouseR == false){
//    if(mouseY >= 0 && mouseY <=700){
    if (mousePressed == true){
      fill(255, 0, 0);
      rect(1000, 0, 200, 700);
      colorR += 255;
//  } else {
//    fill(0, 0, 0);
//    rect(1000, 0, 200, 700);
    }
  }
//  }

  if (mouseX >= 0 && mouseX <= 200 && mouseO == false){
    if (mousePressed == true){
      if(colorR >= 1){
      fill(255, 127, 0);
      rect(0, 0, 200, 700);
      colorO += 255;
    }
  }
}
  if (mouseX >=400 && mouseX <=600 && mouseE == false){
    if(mousePressed == true){
      if(colorO >= 1){        
      fill(255, 255, 0);
      rect(400, 0, 200, 700);
      colorE += 255;
      }
    }
  }
  if(mouseX >=600 && mouseX <=800 && mouseN == false){
    if(mousePressed == true){
      if(colorE >= 1){
      fill(0, 255, 0);
      rect(600, 0, 200, 700);
      colorN += 255;
      }
    }
  }
  if(mouseX >=1200 && mouseX <=1400 & mouseL == false){
    if(mousePressed == true){
      if(colorN >= 1){  
      fill(0, 0, 255);
      rect(1200, 0, 200, 700);
      colorL += 255;
      }
    }
  }
  if(mouseX >= 800 && mouseX <= 1000 && mouseD == false){
    if(mousePressed == true){
      if(colorL >=1){
      fill(75, 0, 130);
      rect(800, 0, 200, 700);
      colorD += 255;
      }
    }
  }
  if(mouseX >= 200 && mouseX <= 400 && mouseV == false){
    if(mousePressed == true){
      if(colorD >=1){ 
      fill(143, 0, 255);
      rect(200, 0, 200, 700);
      colorV += 255;
      }
    }
  }
  
  if(colorV >=1){
    
    fill(random(255),random(255),random(255));
    rect(0, 0, 1400, 700);
    
    float sinOfTime=sin(millis() *0.007);
    float sinMappedX=map(sinOfTime, -1.0, 1.0, 500, 1600);
    float sinMappedY=map(sinOfTime, -1.0, 1.0, 700, 2000);
    
      imageMode(CENTER);
      image(lucky, width/2, height/2, sinMappedX, sinMappedY);    
    
    float sinOfTime2=sin(millis() *0.01);
    float sinMappedX2=map(sinOfTime2, -1.0, 1.0, 50, 123);
    
      fill(random(255), random(255), random(255));
      textFont(font, sinMappedX2);
      textAlign(CENTER);
      text("TASTE THE RAINBOW!!!", width/2, height/2);
  }
  println();
}




