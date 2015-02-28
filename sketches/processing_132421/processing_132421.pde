
boolean flipFlop = false;
String keyPrompt = "press any key";
int hairColorR;
int hairColorG;
int hairColorB;
int bgColor;
int mouthSize;
int pupilSize;

void setup(){
    size(300,300);
    background(100,200,300);
    textSize(12);
}
void draw(){
  if (flipFlop == false){
     hairColorR = 10;
     hairColorG = 10;
     hairColorB = 20;
     bgColor = 200;
     mouthSize = 20;
     pupilSize = 10;
  }
  if (flipFlop == true){ 
     hairColorR = 242;
     hairColorG = 44;
     hairColorB = 113;
     bgColor = 335;
     mouthSize = 30;
     pupilSize = 20;
  }
    makeFace();
  smooth();
  text(keyPrompt,-145,125);

}

 void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}
  
void makeFace(){
  size(300,300);
  background(100,bgColor,300);
  translate(150,150);
  
  
  //face
  rectMode(CENTER);
  fill(300,200,100);
  noStroke();
  ellipse(0,0,150,200);
  fill(255);
  
  //nose
  fill(188,70,39);
  triangle(0, 30, -10, 50, 15, 50);
  
  //mouth
  fill(188,70,39); 
    ellipse(0, 75, mouthSize, 25);
    stroke(0);
    stroke(244,176,132); 
    line(-25, 75, 25, 75);  
    
   
  //eyes
   ellipse(-40,-25,50,30);
  ellipse(40,-25,50,30);
  ellipse(-40,-15,40,40);
  ellipse(40,-15,40,40);
  
   
  
  //hair color
   fill(hairColorR,hairColorG,hairColorB);
     ellipse(-40,-15,pupilSize,30);
     ellipse(40,-15,pupilSize,30);
     
     //hair
     stroke(0);
      ellipse(65,-65,50,50);
     ellipse(80,-20,50,50);
     ellipse(85,27,50,50);
  stroke(0);
       ellipse(35,-95,50,50);
       ellipse(-5,-105,50,50);
       ellipse(-45,-90,50,50);   
       ellipse(85,65,50,50);
        stroke(0);
   ellipse(-65,-65,50,50);
     ellipse(-80,-20,50,50);
     ellipse(-85,27,50,50);
     ellipse(-85,65,50,50);
    ellipse(-40,-15,pupilSize,30);
     ellipse(40,-15,pupilSize,30);
  }
boolean flipFlop = false;
String keyPrompt = "press any key";
int hairColorR;
int hairColorG;
int hairColorB;
int bgColor;
int mouthSize;
int pupilSize;

void setup(){
    size(300,300);
    background(100,200,300);
    textSize(12);
}
void draw(){
  if (flipFlop == false){
     hairColorR = 10;
     hairColorG = 10;
     hairColorB = 20;
     bgColor = 200;
     mouthSize = 20;
     pupilSize = 10;
  }
  if (flipFlop == true){ 
     hairColorR = 242;
     hairColorG = 44;
     hairColorB = 113;
     bgColor = 335;
     mouthSize = 30;
     pupilSize = 20;
  }
    makeFace();
  smooth();
  text(keyPrompt,-145,125);

}

 void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}
  
void makeFace(){
  size(300,300);
  background(100,bgColor,300);
  translate(150,150);
  
  
  //face
  rectMode(CENTER);
  fill(300,200,100);
  noStroke();
  ellipse(0,0,150,200);
  fill(255);
  
  //nose
  fill(188,70,39);
  triangle(0, 30, -10, 50, 15, 50);
  
  //mouth
  fill(188,70,39); 
    ellipse(0, 75, mouthSize, 25);
    stroke(0);
    stroke(244,176,132); 
    line(-25, 75, 25, 75);  
    
   
  //eyes
   ellipse(-40,-25,50,30);
  ellipse(40,-25,50,30);
  ellipse(-40,-15,40,40);
  ellipse(40,-15,40,40);
  
   
  
  //hair color
   fill(hairColorR,hairColorG,hairColorB);
     ellipse(-40,-15,pupilSize,30);
     ellipse(40,-15,pupilSize,30);
     
     //hair
     stroke(0);
      ellipse(65,-65,50,50);
     ellipse(80,-20,50,50);
     ellipse(85,27,50,50);
  stroke(0);
       ellipse(35,-95,50,50);
       ellipse(-5,-105,50,50);
       ellipse(-45,-90,50,50);   
       ellipse(85,65,50,50);
        stroke(0);
   ellipse(-65,-65,50,50);
     ellipse(-80,-20,50,50);
     ellipse(-85,27,50,50);
     ellipse(-85,65,50,50);
    ellipse(-40,-15,pupilSize,30);
     ellipse(40,-15,pupilSize,30);
  }

