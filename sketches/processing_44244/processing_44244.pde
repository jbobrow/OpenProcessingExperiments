
import processing.opengl.*;
import controlP5.*;

PFont font;
PImage img;	

ControlP5 controlP5;



public int k = 0;
//Let's Determine the Sum for the User Up Here
int au = int(random(0,99));
int bu = int(random(0,99));
int cu = au + bu;
float answer = -1;

//Set the Value for Something having been entered
boolean entered = false;
int state = 0;

//Set TExtField
String textValue = "";
Textfield myTextfield;


void setup() {
  size(800,800);
  
  background(0);
  colorMode(RGB, 255,255,255,100);

   controlP5 = new ControlP5(this);
   fill(0);
   myTextfield = controlP5.addTextfield("Answer",999,999,75,20);
   myTextfield.setFocus(true);
   
   img = loadImage("intro.png");
   font = loadFont("din.vlw"); 
   textFont(font, 14);


}

void draw() {
myTextfield.setFocus(true);
if(state == 1) {
  frameRate(1000000);
         //Let's see if this works
          fill(0);
          stroke(255);
          rect((width/2 - 150), (height/2 - 40),300, 80);
          fill(255);
          text(au + " + " + bu + " = ", (width/2 - 75), (height/2));
        
          
          //START MATHING
            //Set up Default Gaps
            float xgap = 50;
           float ygap = 10;
          //Start
          if(!entered){
              int a = int(random(0,99));
              int b = int(random(0,99));
              int c = (a + b);
              
              //Random Setting
              float xaxis = random(50,(width - 100));
              float yaxis = random(20,(height - 20));
              
              //Random Color
              int clr = int(random(0,255));
              float trans = random(2,50);
              fill(clr, trans);
              
              String txt =  k + ". " + a + " + " + b +" = "+ c;
              
              text( txt,xaxis, yaxis);
              fill(255,0,0);
          }
         //First Check if something has been entered
          if(entered){
             if(answer == cu){
          
              fill(0);
              stroke(255);
              //Rectangulo ARRIBA de la Suma = "Youre Right"
              rect((width/2 - 150), (height/2 - 90),300, 40);
              //Set the Text
                  fill(0);
                  stroke(255);
                  //Rectangulo ABAJO de la Suma ... Comparacion
                  rect((width/2 - 150), (height/2 + 55),300, 60);
              //Set the Comparissonß
               fill(255);
               int ans = int(answer);
               textAlign(CENTER);
              text("You're Right!", (width/2),(height/2 - 65));
        
              text("The computer only did " + k + " similar sums, while you only did one.", (width/2 - 130),(height/2 + 65),260,100);
             }
             else{
               
              //Set the Background Rectangle 
               fill(0);
              stroke(255);
              rect((width/2 - 150), (height/2 + 50),300, 40);
              //Set the Text
               fill(255);
               int ans = int(answer);
               textAlign(CENTER);
              text(ans + " is not the right answer", (width/2),(height/2 + 75));
             }
          }
          else{
            //What Happends if the user hasn't entered anything
          } 
  }
else{
  frameRate(5);
          fill(0,1);
          rect(0,0,width,height);
  //Let's see if this works
          fill(0);
          stroke(255);
         // translate(0, 0, -1);

        //  rect((width/2 - 150), (height/2 - 40),300, 80);
        //  fill(255);
        //  text("THIS IS A TEST. CLICK TO BEGIN.", (width/2 - 75), (height/2));
          
          image(img,(width/2 - 150) ,(height/2 - 100));

          
            int a = int(random(0,99));
              int b = int(random(0,99));
              int c = (a + b);
              
              //Random Setting
              float xaxis = random(50,(width - 100));
              float yaxis = random(20,(height - 20));
              
              //Random Color
              int clr = int(random(0,255));
              float trans = random(2,50);
              fill(clr, trans);
              
              String txt =  k + ". " + a + " + " + b +" = "+ c;
              
              text( txt,xaxis, yaxis);
              fill(255,0,0);
  }
  
  
  if(!entered){
    k++; 
  }
  else{
   k = k; 
  }
  
}

// for every change in textfield textA, this function will be called
public void Answer(String theValue) {
  answer = int(theValue);
  entered = true;
}

void mousePressed(){
  if(state == 0){
   state = 1; 
  //Change Position of Field
  myTextfield.position().x = (width/2 );
  myTextfield.position().y = (height/2 - 15); 
   
   //Basically, Reset-Everything
    
          //Re-Set Background
          background(0);
          //RE-Set Sketch Key
          k = 0;
          entered = false;
          answer = -1;
          ////Let's Determine the Sum for the User Up Here
           au = int(random(0,99));
           bu = int(random(0,99));
           cu = au + bu;
  }
  else{
   state = 0; 
   //Change Position of Field
    myTextfield.position().x = 999;
    myTextfield.position().y = 999; 
    
    //Basically, Reset-Everything
    
          //Re-Set Background
          background(0);
          //RE-Set Sketch Key
          k = 0;
          entered = false;
          answer = -1;
          ////Let's Determine the Sum for the User Up Here
           au = int(random(0,99));
           bu = int(random(0,99));
           cu = au + bu;
  }
}





