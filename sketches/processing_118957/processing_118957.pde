
Stick[] myStick = new Stick[1];
float mx;
float my;
float SizeW = 20;
float SizeH = 20;
float easing = 0.05;
float edge = 50;
float rotationNum = 0;
String temptype = "Wood";
int counter = 1;
int antiCounter = 3;

void setup(){
  size(400,400);
  myStick[0] = new Stick(mx,my,SizeW,SizeH,temptype);
}

void draw(){
  //Backgroud
  background(175,175,175); 
 //Boundary 
  fill(150);
  rectMode(CORNERS);
  rect(edge,edge, width-edge,height-edge);
  //Cool moving effect
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
   }
   if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY - my) * easing;
  }
  //Constrains mouse to the boundary
  mx = constrain(mx, edge + SizeW/2, width - edge - SizeW/2);
  my = constrain(my, edge + SizeH/2, height - edge - SizeH/2);
  //Looping the new sticks
  for (counter = 1; counter < myStick.length; counter++){
    if (counter < 4){
    myStick[counter].displayStick();
    myStick[counter].dropStick();
    }
  }
  //Stick on the mouse
  Stick S1 = new Stick(mx,my,SizeW,SizeH,temptype);
  S1.displayStick();
  //Text
  fill(0);
  text(antiCounter,200,45);
  text(temptype,300,45);
  rectMode(CENTER);
}
//Place and append new stick
void mousePressed(){
  if(counter < 4){
    antiCounter = antiCounter - 1;
    Stick b = new Stick(mx,my,SizeW,SizeH,temptype);
    myStick = (Stick[]) append(myStick,b);
  }
}
//Adjust Size of Stick
void keyPressed(){
  if (keyCode == UP && SizeH < height-100){
    SizeH += 5;
  }
  if (keyCode == DOWN && SizeH > 0){
    SizeH -= 5;
  }
  if (keyCode == LEFT && SizeW > 0){
    SizeW -= 5;
  }
  if (keyCode == RIGHT && SizeW < width-100){
    SizeW += 5;
  }
  if (key == '1'){
    temptype = "Brick";
  }
  if (key == '2'){
    temptype = "Wood";
  }
  if (key == '3'){
    temptype = "Stone";
  }
}

class Stick{
  float xPos;
  float yPos;
  float StickW;
  float StickH;
  String Type;
  
  Stick(float tempXpos,float tempYpos,float tempStickW,float tempStickH,String tempType){
    xPos = tempXpos;
    yPos = tempYpos;
    StickW = tempStickW;
    StickH = tempStickH;
    Type = tempType;
  }
  
  void displayStick(){
    rectMode(CENTER);
    if (Type == "Brick"){
      fill(255,0,0);
    }
    else if (Type == "Wood"){
      fill(#C49002);
    }
    else if (Type == "Stone"){
      fill(#AAAAA8);
    }
    rect(xPos,yPos,StickW,StickH);
  }
  void dropStick(){
    if (yPos < height - edge - SizeH/2){
      yPos++;
    }
  }
}
