
int circleW=15;
int circleH=15;
int theSpace=circleW/3;
int redColor = int(random(10,255));
int greenColor= int(random(50,255));
int blueColor = int(random(200,255));


import controlP5.*;
ControlP5 cp5;
String textValue = "";

  
void setup(){
smooth () ;
  size(1000,700);
  background (248,253,245);
  noFill();
  stroke(0);
  ellipse(495,300,200,200);
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);


                 
  cp5.addTextfield("YOUR NAME HERE")
     .setColorBackground(10)
     .setPosition(400,600)
     .setSize(200,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     ;
       
   
  

  textFont(font);
}

   


void draw() {
   strokeWeight(random(.25,20));
   for (int i = 0; i < width-circleW/2; i = i+(circleW+theSpace)) {
    stroke(random(255), random(255), random(255), 150);
   }
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    
  } 
 
  }

public void clear() {
  cp5.get(Textfield.class,"textValue").clear();
}



public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}
void keyPressed() {
  if (key == '0') {
    saveFrame("images/artwork-####.png");;
    endRecord();
    exit();
  }
}


