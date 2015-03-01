
Shape[] shapes;
float newShapeInitX, newShapeInitY;

Button lineButton, circleButton, selectButton;
int shapeChosen;

ColorButton blackButton, redButton;
color currentColor, tempColor;

boolean isDrawing;

int temp = 0;


void setup(){
size(800, 600);
smooth();
isDrawing = false;
shapes = new Shape[0];
lineButton = new Button("Line", 20, 20, 35, 35, false,  color(200, 100, 100), color(210), color(0));
circleButton = new Button("Circle", 60, 20, 35, 35, false, color(200, 100, 100), color(210), color(0));
selectButton = new Button("Select", 100, 20, 35, 35, false, color(200, 100, 100), color(210), color(0));

blackButton = new ColorButton("", width - 60, 20, 35, 35, true, color(100, 150, 150), color(0), color(0));
redButton = new ColorButton("", width - 20, 20, 35, 35, false, color(100, 150, 150), color(0), color(255, 0, 0));
currentColor = color(0);
}

void draw(){
background(255);
for(int i = 0; i < shapes.length; i++){
  shapes[i].display();
}
rectMode(CORNER);
fill(220);
stroke(200);
strokeWeight(1);
rect(0, 0, width, 40);
lineButton.display();
circleButton.display();
selectButton.display();

blackButton.display();
redButton.display();

stroke(0);



}


class Shape{
  float initX, initY, endX, endY;
  color objCol;
  boolean isSelected;
  
  Shape(float initX_, float initY_, color objCol_){
    initX = initX_;
    initY = initY_;
    endX = initX_;
    endY = initY_;
    objCol = objCol_;
    isSelected = true;
  }
  
  void setEnd(float endX_, float endY_){
  endX = endX_;
  endY = endY_;
  }
  
  void display(){
  }
  
  boolean isSelected(){
    return true;
  }
  
}


class Line extends Shape{
  
  Line(float initX_, float initY_, color objCol_){
    super(initX_, initY_, objCol_);
  }  
  
  void display(){
    //fill(objCol);
    stroke(objCol);
    strokeWeight(isSelected? 3 : 1);
    line(initX, initY, endX, endY);
  }
  
  boolean isSelected(){
    float slope;
    boolean temp_result = false;
    if(endX == initX){
      slope = 10;
    }else{
      slope =  (endY - initY)/(endX - initX);
      if(abs(slope) <= 1){
        temp_result =  ((mouseX < endX + 10 & mouseX > initX - 10) | (mouseX < initX+10 & mouseX > endX - 10)) & (mouseY < slope *(mouseX - initX) + initY + 20 & mouseY > slope * (mouseX - initX) + initY - 20);
      }else{
       temp_result = ((mouseY < endY + 10 & mouseY > initY - 10) | (mouseY < initY + 10 & mouseY > endY - 10)) & (mouseX < 1/slope *(mouseY - initY) + initX + 20 & mouseX > 1/slope * (mouseY - initY) + initX - 20);
    }
    }
    
    return temp_result;
}
}

class Circle extends Shape{
  
  Circle(float initX_, float initY_, color objCol_){
    super(initX_, initY_, objCol_);
  }  
  
  void display(){
    //fill(objCol);
    stroke(objCol);
    strokeWeight(isSelected? 3 : 1);
    noFill();
    float radius_;
    radius_ = sqrt(sq(initX - endX) + sq(initY - endY));
    ellipse(initX, initY, 2*radius_, 2*radius_);
  }
  
  boolean isSelected(){
    return abs(sqrt(sq(mouseX - initX) + sq(mouseY - initY)) - sqrt(sq(endX - initX) + sq(endY - initY))) < 10;
  }
  
}

class Button{
  String onCaption, offCaption;
  float centerX, centerY;
  float buttonHeight, buttonWidth;
  boolean isOn;
  color buttonOnFill, buttonOffFill, buttonTextColor;
  
 // constructor

Button(String onCaption_, float centerX_, float centerY_, float buttonWidth_, float buttonHeight_, boolean isOn_, color buttonOnFill_ , color buttonOffFill_, color buttonTextColor_ ){
   onCaption = onCaption_;
   centerX = centerX_;
   centerY = centerY_;
   buttonHeight = buttonHeight_;
   buttonWidth = buttonWidth_;
   isOn = isOn_;
   buttonOnFill  = buttonOnFill_;
   buttonOffFill = buttonOffFill_;
   buttonTextColor = buttonTextColor_;
 }
 void display(){
   rectMode(CENTER);
   fill(isOn ? buttonOnFill : buttonOffFill);
   textAlign(CENTER, CENTER);
   textSize(buttonHeight/3);
   strokeWeight(1);
   stroke(150);
   rect(centerX, centerY, buttonWidth, buttonHeight);
   fill(buttonTextColor);
   stroke(buttonTextColor);
   text(onCaption, centerX, centerY);
 }

void switchOff(){
  isOn = false;
}

void switchOn(){
  isOn = true;
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

class ColorButton extends Button{
  ColorButton(String onCaption_, float centerX_, float centerY_, float buttonWidth_, float buttonHeight_, boolean isOn_, color buttonOnFill_ , color buttonOffFill_, color buttonTextColor_ ){
    super("", centerX_, centerY_, buttonWidth_, buttonHeight_, isOn_, buttonOnFill_ , buttonOffFill_, buttonTextColor_ );
  }
  void display(){
    strokeWeight(isOn ? 4 : 0);
    stroke(isOn? buttonOnFill : buttonOffFill);
    fill(buttonTextColor);
    rectMode(CENTER);
    rect(centerX, centerY, buttonWidth, buttonHeight);
  }

}


void removeShapes(){
    Shape[] shapesTemp = new Shape[shapes.length];
    arrayCopy(shapes, shapesTemp);
    shapes = new Shape[0];
    for(int i = 0; i < shapesTemp.length; i++){
        if(!shapesTemp[i].isSelected){
            shapes = (Shape[]) append(shapes, shapesTemp[i]);
        } 
    }
} 


void mousePressed(){
 
 if(lineButton.buttonPressed()){
   shapeChosen = 1;
   lineButton.switchOn();
   circleButton.switchOff();
   selectButton.switchOff();
   for(int i =0; i < shapes.length; i++){
     shapes[i].isSelected = false;
   }
 }else if(circleButton.buttonPressed()){
   shapeChosen = 2;
   circleButton.switchOn();
   lineButton.switchOff();
   selectButton.switchOff();
   for(int i =0; i < shapes.length; i++){
     shapes[i].isSelected = false;
   }
 }else if(selectButton.buttonPressed()){
   shapeChosen = 0;
   selectButton.switchOn();
   circleButton.switchOff();
   lineButton.switchOff();
 }else if(blackButton.buttonPressed()){
   blackButton.switchOn();
   redButton.switchOff();
   currentColor = color(0);
   if(shapeChosen == 0){
     for(int i = 0; i < shapes.length; i++){
       if(shapes[i].isSelected){
         shapes[i].objCol = color(0);
       }
     }
   }
 }else if(redButton.buttonPressed()){
   redButton.switchOn();
   blackButton.switchOff();
   currentColor = color(255, 0, 0);
   if(shapeChosen == 0){
     for(int i = 0; i < shapes.length; i++){
       if(shapes[i].isSelected){
         shapes[i].objCol = color(255, 0, 0);
       }
     }
   }
 }else if(mouseY > 40){
   isDrawing = true;
   newShapeInitX = mouseX;
   newShapeInitY = mouseY;
   switch(shapeChosen){
     case 1:
       shapes = (Shape[]) append(shapes, new Line(newShapeInitX, newShapeInitY, currentColor));
       break;
     case 2:
       shapes = (Shape[]) append(shapes, new Circle(newShapeInitX, newShapeInitY, currentColor));
       break;
   }
  }
}

void mouseDragged(){
  if(shapeChosen != 0 & isDrawing){
    shapes[shapes.length - 1].setEnd(mouseX, mouseY);
  }
}

void mouseReleased(){
  if(shapeChosen != 0 & isDrawing){
    shapes[shapes.length -1].isSelected = false;
  }
  isDrawing = false;
}

void mouseClicked(){
  if(shapeChosen == 0 & shapes.length > 0 & mouseY > 40){
    int temp = -1;
    for(int i = 0; i < shapes.length; i++){
      if(shapes[i].isSelected()){
        temp = i;
      }
    }
    if(temp != -1){
      for(int i = 0; i < shapes.length; i++){
        shapes[i].isSelected = (temp == i);
      }
    }
    
  }
}

void keyPressed(){
  if(shapeChosen == 0){
    if(key == DELETE | key == BACKSPACE){
      removeShapes(); 
    }
  }
}


