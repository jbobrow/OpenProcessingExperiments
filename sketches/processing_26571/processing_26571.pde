
    boolean hit = false;
boolean hit2 = false;
float oldX, oldY; 
int thick = 1;

//colors
color clear = #FAFFFA; //white
color button1 = #099313;  //green
color button2 = #0C48F5;  //blue
color button3 = #D30B22;  //red
color button4 = #000000; //black
color pencolor= #000000; //black
void setup() {
size (500,450);
smooth();
}

void draw() {
  ///buttons
   stroke(0);
 fill(button1);
  rect(40, 10, 25, 25);
 fill(button2);
   rect(70,10, 25,25);
 fill(button3);
   rect(100,10,25,25);
 fill(button4);
   rect(130,10,25,25);

//buttons for changing color of pen
if(mousePressed) {
    if(mouseY > 5 && mouseY < 35) { 
      if(mouseX > 35  && mouseX < 55) { //button 1
        pencolor = button1;
        thick = 2;
        
      }
      else if(mouseX > 65 && mouseX < 85) {  //button 2
        pencolor = button2;
        thick = 3;
      }
    else if(mouseX > 95 && mouseX < 120) {  //button 3
        pencolor = button3;
        thick = 4;
    }
    else if(mouseX > 130 && mouseX < 145) {  //button 4
        pencolor = button4;
        thick = 1;
    }  
        
        
      
    }
}
  
  
  //button for clear screen
  
  fill(0);
  text("clear",10,10);
 fill(clear);
  rect(10, 10, 25, 25);
  //if the first comdition is true and if the second condtition is true as well
  if(mouseX > 5 && mouseX < 35 && mouseY > 5 && mouseY < 35) {
    //this is to get "hit" to print when in box
    //!hit means "not hit"
    if(!hit) {
      //rollover button
      fill(100);
     // println("HIT!");
    }
    if(mousePressed) {//this is where we know they have clicked on the box
     fill(255);
     background(255);
    }else{
      //makes it unpress mouse
      fill(200);
    }
    hit = true;
  //println("HIT!");
 

}
 else{
  hit = false; 
  fill(100);
 }
 
 //drawing part
 stroke(pencolor);
 strokeWeight(thick);
if(mousePressed) {
line (mouseX, mouseY, oldX, oldY);
}
oldX=mouseX;
oldY=mouseY;

}       
                
