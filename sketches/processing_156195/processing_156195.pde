
PFont font;
//rectangle variables row 1:
float rect1X = 0;
float rect1Y = 100;
float rect2X = 500;
float rect2Y = 100;

//on/off states row 1:
boolean stateY = false;
boolean stateN = false; 
boolean test=false;

//on/off states row 2:
boolean stateY2 = false;
boolean stateN2 = false;

//on/off states row 2B:
boolean stateY3 = false;
boolean stateN3 = false;


void setup(){
  size(1000, 700);
  background(255);
  font = loadFont("Futura-Medium-200.vlw");
  
}

void draw(){
  background(255);
  fill(0);
  text("Are you in the middle of bootcamp right now?", (width/2-150), 50); //question 1
  
  fill(182, 108, 232); //top row YES rectangle 
    noStroke();
    rect(rect1X, rect1Y, 500, 100); 
  
    fill(233, 121, 108); //top row NO rectangle
    noStroke();
    rect(rect2X, rect2Y, 500, 100); 

    fill(0);
    text("YES", (width/4-200), 150); //response 1Y
  
    fill(0);
    text("NO", (width/4+350), 150); //response 1N
    
  
  if (stateY == true){
    text("Are you sleepy?", (width/2-300), 250); //question 2A 
    
    fill(182, 108, 232); //second row YES rectangle A
    noStroke();
    rect(0, 300, 250, 100); 
  
    fill(0);
    text("YES", (width/4-200), 350); //response 2Y A
    
    fill(233, 121, 108); //second row NO rectangle A
    noStroke();
    rect(250, 300, 250, 100);
  
    fill(0);
    text("NO", (width/4+100), 350); //response 2N A
    }
  
  
   if (stateN == true){
    text("Are you jealous?", (width/2+200), 250); //question 2B
    
    fill(182, 108, 232); //second row YES rectangle B
    noStroke();
    rect(500, 300, 750, 100);
    
    fill(0);
    text("YES", (width/2+100), 350); //response 2Y B
    
    fill(233, 121, 108); //second row NO rectangle B
    noStroke();
    rect(750, 300, 1000, 100);
    
    fill(0); 
    text("NO", (width/2+300), 350); //response 2N B
  }

  if (stateY2 == true){
    fill(0);
    text("Get some coffee and keep coding!", (width/4-200), 500);
  }
  if (stateN2 == true){
    fill(0);
    text("Work harder!", (width/4-200), 500);
  }
  if (stateY3 == true){
    fill(0);
    text("Good. You should be. MFADT is the coolest.", (width/2+100), 500);
  }
  if (stateN3 == true){
    fill(0);
    text("Please re-think your life choices.", (width/2+100), 500);
  }
}
  

void mousePressed(){
  
  //ANSWERING QUESTION 1
  if (stateN == false && (mouseX<width/2) && (mouseY>100) && (mouseY<200)){
    stateY=true;
  }
  if (stateY == false && (mouseX>width/2) && (mouseY>100) && (mouseY<200)){
    stateN=true;
  }
  if (stateN2 == false && (mouseX<250) && (mouseY>300) && (mouseY<400)){
    stateY2=true;
  }
  if (stateY2 == false && (mouseX>250) && (mouseX<500) && (mouseY>300) && (mouseY<400)){
    stateN2=true;
  }
  if (stateN3 == false && (mouseX>500) && (mouseX<750) && (mouseY>300) && (mouseY<400)){
    stateY3=true;
  }
  if (stateY3 == false && (mouseX>750) && (mouseX<1000) && (mouseY>300) && (mouseY<400)){
    stateN3=true;
  }
    
  
    if (keyPressed){
    if (key=='s'){
      saveFrame();
    }
    }
    
}



