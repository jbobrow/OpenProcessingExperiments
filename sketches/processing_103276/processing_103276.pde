
float depX;
float depY;
float centerX;
float centerY;
float stepX;
float stepY;
float posX;
float posY;
float targetX;
float targetY;
float totargetX;
float totargetY;

boolean keyDown;
boolean showText;

void setup() {
  size(800,800);
  smooth();
  stepX=80;//width/5;
  stepY=80;//height/5;
  depX=0;
  depY=0;
  centerX=width/2;
  centerY=height/2;
  posX=centerX;
  posY=centerY;
  targetX=centerX;
  targetY=centerY;
  totargetX=centerX;
  totargetY=centerY;
  keyDown = false;
  showText = false;
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(60);
}

void draw() {
  background(0);
  noFill();
  
  if(keyPressed) {
    if(!keyDown){
      if(key==CODED){
        switch(keyCode){
          case UP :
            targetY-=stepY;
            break;
          case DOWN :
            targetY+=stepY;
            break;
          case LEFT :
            targetX-=stepX;
            break;
          case RIGHT :
            targetX+=stepX;
            break;
        }
      } else if(key==' '){
        setup();
      } else if(key=='t'){
        showText=!showText;
      }
    }
    keyDown = true;
  } else {
    keyDown = false;
  }
  
  if(mousePressed){
    targetX=mouseX;
    targetY=mouseY;
  }
  
  targetX+=(centerX-posX)/30;
  targetY+=(centerY-posY)/30;
  totargetX+=(centerX-posX)/30;
  totargetY+=(centerY-posY)/30;
  posX=((centerX-posX)/30)+posX;
  posY=((centerY-posY)/30)+posY;
  
  totargetX=((targetX-totargetX)/30)+totargetX;
  totargetY=((targetY-totargetY)/30)+totargetY;
  posX=((totargetX-posX)/30)+posX;
  posY=((totargetY-posY)/30)+posY;
  
  if(posX<centerX-width/6){posX=((centerX-width/6-posX)/100)+posX;}
  if(posX>centerX+width/6){posX=((centerX+width/6-posX)/100)+posX;}
  if(posY<centerY-width/6){posY=((centerY-width/6-posY)/100)+posY;}
  if(posY>centerY+width/6){posY=((centerY+width/6-posY)/100)+posY;}
  
  depX+=(posX-centerX)/30;
  depY+=(posY-centerY)/30;
  
  for(int i=0;i<width*2; i+=stepX) {
    for(int j=0/2;j<height*2; j+=stepY) {
      float x=((i-depX)%(width*2)+(width*2))%(width*2)-width/2;
      float y=((j-depY)%(height*2)+(height*2))%(height*2)-height/2;
      
      for(int k=0;k<4;k++){
        if(abs(posX-x)<k*stepX+stepX/2 && abs(posY-y)<k*stepY+stepY/2){
          noStroke();
          fill(255,2);
          rectMode(CENTER);
          rect(x,y,stepX,stepY);
        }
      }
      
      stroke(255,20);
      strokeWeight(1);
      line(x-5,y,x+5,y);
      line(x,y-5,x,y+5);
      
      if(showText){
        fill(255);
        textAlign(CENTER,CENTER);
        text(int(i/stepX-(width/stepX))+","+int(j/stepY-(height/stepY)),x,y);
      }
      
      for(int k=1;k<24;k+=2){
        noFill();
        //fill(255,round(random(k,k*2)));
        strokeWeight(25-k);
        stroke(255,round(random(k,k*2)));
        rectMode(CENTER);
        int caseX = abs(int(i/stepX-(width/stepX)));
        int caseY = abs(int(j/stepY-(height/stepY)));
        rect(x+((x-posX)/k*16),y+((y-posY)/k*16),120-k*caseX,120-k*caseY);
      }
      
    }
  }
  
  stroke(255,50);
  strokeWeight(1);
  ellipse(posX,posY,5,5);
  line(posX,posY,targetX,targetY);
  
  if(showText){
    fill(255,100);
    textAlign(LEFT,TOP);
    text("position absolue = "+round(depX+(posX-centerX))+","+round(depY+(posY-centerY)),10,10);
    text("position relative = "+round(posX-centerX)+","+round(posY-centerY),10,30);
    text("position case = "+floor(((depX+(posX-centerX))+stepX/2)/stepX)+","+floor(((depY+(posY-centerY))+stepY/2)/stepY),10,50);
    text("step = "+stepX+","+stepY,10,70);
    text("fps = "+round(frameRate),10,90);
  }
  
}

