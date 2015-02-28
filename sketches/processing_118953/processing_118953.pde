
//Settings for picture of a skeleton for both parts
PImage webImg;
int partNum = 7;
BodyPart[] bodyArray = new BodyPart[partNum];

//variables for 'test me' part
int xDef = 300;
int yDef = 240;
int temp = 0;
int score = 0;
int question = 1;

int[] que = {0, 3, 5, 6, 2, 1, 4}; 

//variables for menu
boolean startTeaching = false;
boolean startTesting = false;

 
void setup() {
  background(255);
  size(475,700);
  String url = "http://science.pppst.com/science_skeleton.gif";
  // Load image from a web server
  webImg = loadImage("http://science.pppst.com/science_skeleton.gif");
  
//head
  bodyArray[0] = new BodyPart( color(255,0,0), 125, 120, 90, 90, "UNE TÊTE", xDef, yDef);
  //foot  
  bodyArray[1] = new BodyPart( color(0,255,0), 100, 650, 110, 85, "UN PIED", xDef, yDef+50);  
  //elbow
  bodyArray[2] = new BodyPart( color(0,0,255), 35, 314, 50, 50, "UN COUDE", xDef, yDef+100);
  //knee
  bodyArray[3] = new BodyPart( color(255,0,0), 135, 510, 55, 55, "UN GENOU", xDef+110, yDef+100);
  //hand
  bodyArray[4] = new BodyPart( color(255,0,0), 430, 135, 85, 85, "UNE MAIN", xDef+110, yDef);
  //hip
  bodyArray[5] = new BodyPart( color(0,255,0), 200, 350, 150, 60, "UNE HANCHE", xDef+110,yDef+50);
  //ribs
  bodyArray[6] = new BodyPart( color(0,0,255), 195, 230, 60, 150, "DES CÔTES", xDef+60, yDef+150);
  
  bodyArray[que[0]].show = true;
 
}

void drawBubble(){
  stroke(0);
  fill(255);
  rect(170, 25, 220, 90, 10);  
}

void swapScreens(int x, int y, String label){
  noStroke();
  fill(255, 100, 100);
  ellipse(x, y, 50, 50);
  if(mousePressed && dist(mouseX, mouseY, x, y) < 25){
    startTeaching = !startTeaching;
    startTesting = !startTesting;
  }
  fill(0);
  textAlign(CENTER);
  textSize(18);
  text("Go to "+label, x, y);
  
}

//TEACH ME FUNCTIONS

void teachMe(){
  image(webImg, 0, 50);
  drawBubble();
  fill(0);
  textSize(22);
  textAlign(CENTER);
  int xPos = 280;
  int yPos = 45;
  text("Hi, I'm Pierre!", xPos, yPos);
  text("Click within circles", xPos, yPos+20);
  text("to learn body parts", xPos, yPos+40);
  text("in French.", xPos, yPos+60);

  for (int i=0; i<partNum; i++){
    bodyArray[i].drawCircle();
    bodyArray[i].teach();
  }
  
  swapScreens(400, 550, "testing.");
}

//TEST ME FUNCTIONS
void drawInstructions(){
  textAlign(CENTER); 
  textSize(22);
  
  drawBubble();
  fill(111,224,32);
  int xPos = 280;
  int yPos = 70;
  text("Click the name of", xPos, yPos);
  text("the circled area", xPos, yPos+25);
  
  fill(111,224,32);
  text("Answers:", 420, 198);
  
  textSize (20);
  text("The score is " + score + "/" + partNum, 390, 550);
}

  

void testMe(){
  image(webImg, 0, 50);
  
  drawInstructions();

  for (int i=0; i<partNum; i++){
    if(bodyArray[i].show){
        bodyArray[i].drawCircle();
    }
    bodyArray[que[i]].test();
  }
    
  swapScreens(400, 620, "teaching."); 
     
  int radius = 20;
  
  if (mousePressed){
   
      frameRate(14);
      fill(248, 224, 192);
      noStroke();
      
      for (int i=0; i<partNum-1; i++){
        if (dist(mouseX, mouseY, bodyArray[que[i]].xAns, bodyArray[que[i]].yAns) <= radius){
            if (question == i+1)
            {
               question++;
               bodyArray[que[i]].show = false;
               bodyArray[que[i+1]].show = true;
               score++;
            }
         }
      }
      
      if(question == partNum){
        if (dist(mouseX, mouseY, bodyArray[que[score]].xAns, bodyArray[que[score]].yAns) <= radius)
          {
            question++;
            bodyArray[que[score]].show = false;
            score++;
          }
        }

  }
    
}

//MENU FUNTIONS

void drawMenu(){
    PFont font;
    // The font must be located in the sketch's
    // "data" directory to load successfully
    font = loadFont("LetterGothicStd-32.vlw");
    
    int xOpt = 305;
    int yOpt = 490;
    int diameter = 40;
    
    fill(210, 10);
    noStroke();
    ellipse(xOpt, yOpt, diameter, diameter);
    ellipse(xOpt, yOpt+50, diameter, diameter);
     
    int startX = 190;
    int startY = 450;
     
    textSize(55);
    fill(111,224,32);
    text("Options:",startX, startY);
     
    textSize(30);
    fill(237, 144, 29);
    text("1 -Teach me!", startX+15, startY+50);
     
    textSize(30);
    fill(111,224,32);
    text("2 -Test me!", startX+15, startY+100);
    
    //frenchflag
    noStroke();
    fill(227, 21, 27);
    rect(290,55,108,200);
    fill(21,48,193);
    rect(75,55,108,200);
    stroke(4);
    strokeWeight(4);
    noFill();
    rect(75,55, 325, 200);

    
    if(mousePressed){
      
        //teach me
      if (dist(mouseX, mouseY, xOpt, yOpt) <= (diameter/2)) {
        startTeaching = true;
      }
     
        //test me
      if (dist(mouseX, mouseY, xOpt, yOpt+50) <= 20){
        startTesting = true;
      }
    }
    
    
 
} 

void draw(){
  
  if (!startTeaching && !startTesting){
    drawMenu();
  }
  if(startTeaching){
    teachMe();
  }
  if (startTesting){
    testMe();
    if(score == partNum){
      stroke(0);
      strokeWeight(7);
      fill(255);
      rect((width/2)-200, (height/2)-100, 400, 200);
      fill(0);
      textSize(40);
      textAlign(CENTER);
      text("FÉLICITATIONS!", width/2, height/2);
      
    }
  }
  
}
 
class BodyPart{
  color cl;
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String name;
  int xAns;
  int yAns;
  boolean show = false;
 
  BodyPart(color clTmp, int xPTmp, int yPTmp, int xSTmp, int ySTmp, String nameTmp, int xATmp, int yATmp){
    cl = clTmp;
    xPos = xPTmp;
    yPos = yPTmp;
    xSize = xSTmp;
    ySize = ySTmp;
    name = nameTmp;
    xAns = xATmp;
    yAns =yATmp;
  }
 
  void drawCircle(){
    stroke(cl);
    strokeWeight(4);
    noFill();
    ellipse(xPos, yPos, xSize, ySize);        
  }
 
  void teach(){
    if (mousePressed){
      if( (mouseX < xPos+(xSize/2)) && (mouseX > xPos-(xSize/2)) && (mouseY < yPos+(ySize/2)) && (mouseY > yPos-(ySize/2)) ){
        drawBubble();
        fill(0);
        textAlign(CENTER);
        textSize(25);
        text(name, 270, 80);
      }
    }
  }
    
    void test(){
      textSize(18);
      fill(237, 144, 29);
      text(name, xAns, yAns);
      fill(100, 50);
      noStroke();
      ellipse(xAns, yAns, 40, 40);
      if (mousePressed && dist(mouseX, mouseY, xAns, yAns) < 21 ){
        if(!show){
          fill(255, 10, 10, 50);
        }
        else{
          fill(10, 255, 10, 50);    
        }
        rect(xAns-20, yAns-20, 40, 40);
      }
    }
   
 
}  
