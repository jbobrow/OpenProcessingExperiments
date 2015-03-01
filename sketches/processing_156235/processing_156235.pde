
float blobX = 0;
float blobY;
float blob2X = 150;
float blob2Y;
float blob3X = 400;
float blob3Y;
float xSpeed;
float ySpeed;
PFont font;
boolean start = false;
boolean beatBlob = false;
boolean no = false;
int noTime;
boolean beat2Blobs = false;
float blob1H;
float blob2H;
float xSpeed2;
float ySpeed2;
float xSpeed3;
float ySpeed3;
boolean killDragon = false;
float fireY;
float fireW;
float fireH;
float fireX;
boolean dead = false;

void setup(){
  size(600,600);
  blobY = height/2;
  blob2Y = height/3;
  blob3Y = height/1.25;
  xSpeed = random(-5,10);
  ySpeed = random (-12,6);
  font = loadFont("AppleBraille-Pinpoint6Dot-48.vlw");
  textAlign(CENTER);
  blob1H = 50;
  blob2H = 50;
  xSpeed2 = random(-5,6);
  ySpeed2 = random (-6,6);
  xSpeed3 = random(-5,5);
  ySpeed3 = random(-8, 8);
  fireY = 150;
  fireW = 10;
  fireH = 10;
  fireX = 300;

}

void draw(){
  if(start == false && no == false){
    background(255);
    fill(0);
    triangle(50,300, 300,50, 550, 300);
    textFont(font, 25);
    text("There is a cave here, do you enter?", width/2,30);
    fill(0,150,0);
    rect(50, 325,100,50);
    fill(255);
    textFont(font, 20);
    text("Yes", 100, 360);
    fill(150,0,0);
    rect(450, 325, 100, 50);
    fill(255);
    textFont(font, 20);
    text("No", 500, 360);
  }
  if(mouseX>50 && mouseX < 150 && mouseY > 325 && mouseY<375){
      if(mousePressed){
          start = true;
      }
  }
  if(mouseX>450 && mouseX<550 && mouseY>325 && mouseY<375){
      if(mousePressed){
          no = true;
          background(255);
          fill(0);
          textFont(font, 50);
          text("You are so boring", width/2, height/2);
          if(noTime == 0){
             no = false;
          }
          noTime = (noTime +1)%5;
      }
  }
  
  if(start == true && beatBlob == false){
  blobFight();
  }
  
  if(beatBlob == true && beat2Blobs == false){
  doubleBlob();
  }
  
  if(beat2Blobs == true && killDragon == false){
  slayDragon();
  }
  
  if(killDragon == true){
      background(255);
      fill(random(255),random(255), random(255));
      textFont(font, 60);
      text("YOU WIN!!!!!", width/2, height/2);
  }
  
}

void blobFight(){
    background(255);
    if(blobX>width){
        xSpeed *= -1; 
      }
    if(blobX<0){
        xSpeed *= -1; 
      }
    if(blobY<0){
        ySpeed *= -1; 
      }
    if(blobY>height){
        ySpeed *= -1; 
      }
      
      fill(0,200,0);
      rect(blobX,blobY,50,50);
      blobX += xSpeed;
      blobY += ySpeed; 
      
      if(mouseX>blobX && mouseX<(blobX+50) && mouseY>blobY && mouseY<(blobY+50)){
          if(mousePressed){
              beatBlob = true;
          }
      }
}

void doubleBlob(){
    background(255);
    if(blob2X>width){
        xSpeed2 *= -1; 
      }
    if(blob2X<0){
        xSpeed2 *= -1; 
      }
    if(blob2Y<0){
        ySpeed2 *= -1; 
      }
    if(blob2Y>height){
        ySpeed2 *= -1; 
      }
      
      fill(0,200,0);
      rect(blob2X,blob2Y,50,blob1H);
      blob2X += xSpeed2;
      blob2Y += ySpeed2; 
      
    if(blob3X>width){
        xSpeed3 *= -1; 
      }
    if(blob3X<0){
        xSpeed3 *= -1; 
      }
    if(blob3Y<0){
        ySpeed3 *= -1; 
      }
    if(blob3Y>height){
        ySpeed3 *= -1; 
      }
      
      fill(0,200,0);
      rect(blob3X,blob3Y,50,blob2H);
      blob3X += xSpeed3;
      blob3Y += ySpeed3; 
      
      if(mouseX>blob2X && mouseX<(blob2X+50) && mouseY>blob2Y && mouseY<(blob2Y+50)){
          if(mousePressed){
              blob1H = 0;
          }
      }
      
      if(mouseX>blob3X && mouseX<(blob3X+50) && mouseY>blob3Y && mouseY<(blob3Y+50)){
          if(mousePressed){
              blob2H = 0;
          }
      }
      
      if(blob1H == 0 && blob2H == 0){
          beat2Blobs = true;
      }
}

void slayDragon(){
    background(255);
    fill(0,255,0);
    triangle(150, 0, 300, 150, 450, 0);
    fill(255);
    ellipse(250,50,30,30);
    ellipse(350,50,30,30);
    fill(255,0,0);
    rect(fireX,fireY, fireW, fireH);
    if( (fireY+fireH)< 600){
        fireW+=3;
        fireH+=2;
        fireY++;
        fireX=fireX-1.5;
    }
    if( (fireY+fireH) >599){
        fill(0);
        textFont(font, 60);
        text("YOU DIED!!!",width/2, height/2);
        dead = true;
    }
    
    if(mouseX>250 && mouseX<350 && mouseY>40 && mouseY<60 && dead == false){
        if(mousePressed){
            killDragon = true;
        }
    }
}


