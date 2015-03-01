
String Name;
Record[] records;
color fillColor;
int inputState;
int currentField;
Button editButton, nextButton, previousButton, newButton;
float buttonWIDTH = 160;
float buttonHEIGHT = 50;
int currentRecord;
int numRecords;

void setup(){
size(800, 600);
background(0);
currentRecord = 1;
numRecords = 1;
Name = "";
records = new Record[0];
records = (Record[]) append(records, new Record()); 
fillColor = color(200, 200, 0);
inputState = 0;
editButton = new Button("Accept", "Edit", width - 20 - buttonWIDTH/2, 150, buttonWIDTH, buttonHEIGHT, false, color(#3A8FB4), color(#E7E857));
newButton = new Button("New record", "New record", width - 20 - buttonWIDTH/2, 150 + buttonHEIGHT + 10, buttonWIDTH, buttonHEIGHT, false, color(#3A8FB4), color(#E7E857));

nextButton = new Button("Next", "Next", width/2 + 1.5*buttonWIDTH, height - buttonHEIGHT, buttonWIDTH, buttonHEIGHT/2, true, color(#ED5418), color(0));
previousButton = new Button("Previous", "Previous", width/2 - 1.5*buttonWIDTH, height - buttonHEIGHT, buttonWIDTH, buttonHEIGHT/2, true, color(#ED5418), color(0));
}

void draw(){
  background(0, 50, 0);
  fill(fillColor);
    textSize(20);
    textAlign(LEFT);
    text("First Name: " + records[currentRecord - 1].recordData[0], 50, 150);
    text("Last Name: " + records[currentRecord - 1].recordData[1], 50, 190);
    text("Telephone: " + records[currentRecord - 1].recordData[2], 50, 230);
  
  if(inputState == 1){
    textSize(30);
    textAlign(CENTER);
    text(records[currentRecord - 1].recordData[currentField], width/2, height/2);
    if(millis()/400 % 2 == 1){
    text("_", width/2 + textWidth(records[currentRecord - 1].recordData[currentField] + " ")/2, height/2);
    }
  }
  editButton.display();
  newButton.display();
  
  fill(0, 0, 100, 80);
  stroke(0, 0, 100, 80);
  rectMode(CORNER);
  rect(40, 120 + currentField * 40, textWidth("Last Name: " + records[currentRecord - 1].recordData[currentField]), 40 );
  
  fill(#B9F5E5);
  text("RECORD: " + currentRecord, width/2, height - buttonHEIGHT);
  nextButton.display();
  previousButton.display();
 inputState = editButton.isOn? 1 : 0;
  
}


void mouseClicked(){
   if(editButton.buttonPressed()){
   editButton.switchState();
   }
   if(nextButton.buttonPressed()){
     currentRecord = currentRecord < numRecords? currentRecord + 1: currentRecord;
   }
   if(previousButton.buttonPressed()){
     currentRecord = currentRecord > 1? currentRecord - 1: currentRecord;
   }
   if(newButton.buttonPressed()){
     numRecords += 1;
     currentRecord = numRecords;
     records = (Record[]) append(records, new Record()); 
   }
 }
 
void keyPressed(){
  if( key <= 'z' & key >= ' ' & inputState == 1){
   records[currentRecord - 1].recordData[currentField] = records[currentRecord - 1].recordData[currentField].concat("" + key);
  }
  if (key == DELETE || key  == BACKSPACE & inputState ==1){
    records[currentRecord - 1].recordData[currentField] = records[currentRecord - 1].recordData[currentField].substring(0, max(0, records[currentRecord - 1].recordData[currentField].length() - 1));
  }
  if(key == ENTER || key == RETURN){
    //inputState = 0;
    editButton.switchState();
  }
  if(key == CODED){
    if(keyCode == UP){
      currentField = currentField > 0? currentField - 1 : currentField;
    }
    if(keyCode == DOWN){
      currentField = currentField < 2? currentField + 1 : currentField;
    }
  }
} 

class Button{
  String onCaption, offCaption;
  float centerX, centerY;
  float buttonHeight, buttonWidth;
  boolean isOn;
  color buttonFill, buttonTextColor;
  
 // constructor

 Button(String onCaption_, String offCaption_, float centerX_, float centerY_, float buttonWidth_, float buttonHeight_, boolean isOn_, color buttonFill_ , color buttonTextColor_ ){
   onCaption = onCaption_;
   offCaption = offCaption_;
   centerX = centerX_;
   centerY = centerY_;
   buttonHeight = buttonHeight_;
   buttonWidth = buttonWidth_;
   isOn = isOn_;
   buttonFill  = buttonFill_;
   buttonTextColor = buttonTextColor_;
 }



 
 void display(){
   rectMode(CENTER);
   fill(buttonFill);
   textAlign(CENTER, CENTER);
   textSize(buttonHeight/2);
   stroke(buttonTextColor);
   rect(centerX, centerY, buttonWidth, buttonHeight);
   fill(buttonTextColor);
   text(isOn ? onCaption : offCaption, centerX, centerY);
 }

void switchOff(){
  isOn = false;
}
 
 void switchState(){
   isOn = !isOn;
 }
 
 boolean buttonPressed(){
   if(mouseX < centerX + buttonWidth/2 & mouseX > centerX - buttonWidth/2 & mouseY < centerY + buttonHeight/2 & mouseY > centerY - buttonHeight/2){
     return true;
   }
   else{
     return false;
   }
 }
 
 
}



class Record{
  String[] recordData;
  
  Record(){
    recordData = new String[3];
    recordData[0] = "";
    recordData[1] = "";
    recordData[2] = "";
  }

}



