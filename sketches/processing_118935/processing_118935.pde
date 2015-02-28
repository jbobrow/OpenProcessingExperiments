
Square[] mySquare;
float xPos; //Sets x coordinate ofsquare
float yPos;  //sets y coordinate of square
int highestNumber;  //sets number of boxes displayed
boolean pressed = false;  //determines if the mouse button is bein pressed
int no_selected = 0;
public int value = 0;
public float total = 0;
int newTarget;


void setup(){
  float target = random(3,57); //States that the target must be  random number between 3 and 57
  newTarget = round(target); //rounds that target number to a whole number
  //setting background/screen size and colour
    size(620,475);
    background(41,198,252);
  //sets position of first square
    xPos = 75;
    yPos = 75;
  
    getValue();
  
  //creates a new square
    mySquare = new Square[highestNumber];
    for(int i=0; i<highestNumber; i++){  //Creates an if statement around an array to create boxes and there locations
      mySquare[i] = new Square(xPos, yPos, i+1);  //creates new square
      xPos += 75;  //adds 75 pixels to the x coordinate of the square to move it along the screen
   if (i == 4){  //defines the end of the first row, moves next box beneith if too many on row
        xPos = 75;
        yPos = 150;
      }
   if (i == 9){  //defines the end of the second row, moves next box beneith if too many on row
        xPos = 75;
        yPos = 225;
      }
   if (i == 14){  //defines the end of the third row, moves next box beneith if too many on row
        xPos = 75;
        yPos = 300;
      }
 
   
    }

     
}

void draw(){//displays the boxes
 
  //box behind target
  fill(255,255,255);
  rect(455,75, 155,70);
 
  //text for target
  fill(0);
  textSize(16);
  text("Select two boxes",460,95);
  text("which make" ,460,115);
  text("this number: " + newTarget,460,135);
 
  //box behind total
  fill(255);
  rect(455,345,130,30);
 
  //text for total
  fill(0);
  textSize(16);
  text("your total: " + total, 460,365);
 
  //Plus sign
  fill(237,17,208);
  textSize(80);
  text("+", 500,265);
 
  for(int i=0; i<highestNumber; i++){
      //mySquare[i].clicked();
      mySquare[i].display();
   }
   
    //numbers in the boxes
    float temp_xPos = 100;
    float temp_yPos = 130;
    int myNumbers = 1;
   
    fill(65,21,188);
   
    for(int i=0; i<4; i++){
      for (int o=0; o<5; o++){
        textSize(40);
        text(myNumbers, temp_xPos, temp_yPos);
        temp_xPos += 75;
        myNumbers++;
        if (myNumbers == 10){
          temp_xPos = 390;
        }
      }
      if (myNumbers>10){
        temp_xPos = 90;
      }
      else{
        temp_xPos = 100;
      }
      temp_yPos += 75;
    }
 
}

class Square{  //defines what a square is and its propperties
 float x;
 float y;
 float s_width;
 float s_height;
 float value;
 boolean selected;
 
 Square(float xPos, float yPos, float val){
   x = xPos;   //states that the x coordinate of the square is the global vairable xPos's content
   y = yPos;    //states that the y coordinate of the square is the global vairable yPos's content
   s_width = 75;   //defines that the width of the square will always be 75px
   s_height = 75;   //defines that the height of the square will always be 75px
   value = val;
   selected = false;
 }
 
  void display(){
    if (selected == true){
      fill(150,255,200);
  }
  else {
    fill(255);}
  
    rect(x,y,s_width,s_height);
    //println(pressed);
  }
 
 //makes the boxes selected or unselected
  void clicked(){
   if(no_selected < 3 || no_selected == 3){
     if (mouseX > x && mouseX < (x + s_width) && mouseY > y && mouseY < (y+s_height)){
       //if (mousePressed){
         if (selected == false && no_selected < 3){
           selected = true;
           no_selected++;
           boxValue();
           total = total + value;
         }
         else if (selected == true) {selected = false;
           no_selected--;
           boxValue();
           total = total - value;
         }
       
      // }
     }
   }
   if(total == newTarget && no_selected>1){
     textSize(30);
     fill(255,255,255);
     text("congratulations, you have solved it.", 50, 400);
   }
  
 }
 
    ////////////////////
   //////boxValue//////
   ////////////////////
  
void boxValue(){

if (mouseX > 75 && mouseX < 150 && mouseY > 75 && mouseY < 150 && mousePressed){
  value = 1;
}
else if(mouseX > 150 && mouseX < 225 && mouseY > 75 && mouseY < 150 && mousePressed){
  value = 2;
}
else if(mouseX > 225 && mouseX < 300 && mouseY > 75 && mouseY < 150 && mousePressed){
  value = 3;
}
else if(mouseX > 300 && mouseX < 375 && mouseY > 75 && mouseY < 150 && mousePressed){
  value = 4;
}
else if(mouseX > 375 && mouseX < 450 && mouseY > 75 && mouseY < 150 && mousePressed){
  value = 5;
}
else if(mouseX > 75 && mouseX < 150 && mouseY > 150 && mouseY < 225 && mousePressed){
  value = 6;
}
else if(mouseX > 150 && mouseX < 225 && mouseY > 150 && mouseY < 225 && mousePressed){
  value = 7;
}
else if(mouseX > 225 && mouseX < 300 && mouseY > 150 && mouseY < 225 && mousePressed){
  value = 8;
}
else if(mouseX > 300 && mouseX < 375 && mouseY > 150 && mouseY < 225 && mousePressed){
  value = 9;
}
else if(mouseX > 375 && mouseX < 450 && mouseY > 150 && mouseY < 225 && mousePressed){
  value = 10;
}
else if(mouseX > 75 && mouseX < 150 && mouseY > 225 && mouseY < 300 && mousePressed){
  value = 11;
}
else if(mouseX > 150 && mouseX < 225 && mouseY > 225 && mouseY < 300 && mousePressed){
  value = 12;
}
else if(mouseX > 225 && mouseX < 300 && mouseY > 225 && mouseY < 300 && mousePressed){
  value = 13;
}
else if(mouseX > 300 && mouseX < 375 && mouseY > 225 && mouseY < 300 && mousePressed){
  value = 14;
}
else if(mouseX > 375 && mouseX < 450 && mouseY > 225 && mouseY < 300 && mousePressed){
  value = 15;
}
else if(mouseX > 75 && mouseX < 150 && mouseY > 300 && mouseY < 375 && mousePressed){
  value = 16;
}
else if(mouseX > 150 && mouseX < 225 && mouseY > 300 && mouseY < 375 && mousePressed){
  value = 17;
}
else if(mouseX > 225 && mouseX < 300 && mouseY > 300 && mouseY < 375 && mousePressed){
  value = 18;
}
else if(mouseX > 300 && mouseX < 375 && mouseY > 300 && mouseY < 375 && mousePressed){
  value = 19;
}
else if(mouseX > 375 && mouseX < 450 && mouseY > 300 && mouseY < 375 && mousePressed){
  value = 20;
}

/////////////////////
////////End//////////
/////////////////////
}


}


void mouseClicked(){
   for(int i=0; i<highestNumber; i++){
      mySquare[i].clicked();
      //mySquare[i].display();
   
   }
}

void getValue(){
  highestNumber = 20;
}


