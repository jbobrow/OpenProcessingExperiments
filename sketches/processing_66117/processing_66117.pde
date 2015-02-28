
//Global Variables
int yValue;
int xValue;
int yColor;
int xColor;
boolean vertBoolean;
boolean horizBoolean;
boolean vertClicked;
boolean horizClicked;

void setup(){
  size(600,600);
  horizBoolean = true;
  vertBoolean = true;
  vertClicked = true;
  horizClicked = false;
  xValue=300;
  yValue = 300;
  yColor = 125;
  xColor = 125;
}

void draw(){
  PFont font;                        //loads font
  font = loadFont("Monospaced-14.vlw"); 
  textFont(font); 
  String message="Switch to horizontal";
  String message2="Switch to vertical";
  background(xColor, yColor, 100);  
  fill(255);                         //rectangle color
  rect(20,15,100,40);
  ellipse(xValue,yValue,100,100);
  fill(0);        //text color
 
  if(vertClicked){
    text(message, 30, 20, 100,40);
  }
  if(!vertClicked){
    text(message2, 30, 20, 100,40);
  }

  if(vertClicked){                   // checks if ball should move vertically
      if (yValue==50){
         vertBoolean = false;
      }
      else if (yValue==550){    
        vertBoolean = true;
      }
      if (vertBoolean){
        yValue = yValue - 10;
        yColor = yColor + 5;
      }
      else if (!vertBoolean){
        yValue = yValue + 10;
        yColor = yColor - 5;
      }
  }
  
  if (horizClicked){                  // checks if ball should move horizontally
      if (xValue==50){
        horizBoolean = true;
      }
      else if (xValue==550){
        horizBoolean = false;
      }
      if (horizBoolean){
        xValue = xValue + 10;
        xColor = xColor + 5;
      }
      else if (!horizBoolean){
        xValue = xValue - 10;
        xColor = xColor - 5;
      }
  }
}

void mouseClicked() {
  if(mouseX>20 && mouseX<120 && mouseY>15 && mouseY<55){
        vertClicked = !vertClicked;
        horizClicked = !horizClicked;
  }
}




