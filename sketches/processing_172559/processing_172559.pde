
Game robot = new Game();
Play fun = new Play();
Design thing = new Design();
int myState = 0;
int battery;
int definition;

void setup() {
  size(650, 650);
}

void draw(){
  switch(myState){
    case 0: // intro screen
    background(0);
    fun.setTerm(0);
    fun.setTerm(1);
    fun.setTerm(2);
    fun.setTerm(3);
    fun.setTerm(4);
    fun.setTerm(5);
    fun.setTerm(6);
    fun.setTerm(7);
    battery = 0;
    definition = (int)random(8);
    
    thing.robo();
    thing.popin();
    fill(255);
    rect(100, 350, 450, 150);
    fill(0);
    text("Oh hello!  You must be the new robot mechanic!", 198, 400);
    text("Right this way, we need your help.", 230, 450);
    break;
    
    case 1: // intro to vocabutron
    robot.body();
    robot.battery(battery);
    pushMatrix();
    translate(0, 400);
    thing.doc();
    popMatrix();
    fill(255);
    rect(100, 300, 450, 150);
    fill(0);
    text("I need you to choose the right term for the definition that", 150, 340);
    text("appears in the big green box at the bottom, so we can", 153, 380);
    text("calibrate the VOCABUTRON.", 240, 420);
    break;
    
    case 2: // playing game
    robot.body();
    robot.battery(battery);
    fill(0);
    text(fun.term[0], 145, 120);
    text(fun.term[1], 455, 120);
    text(fun.term[2], 300, 120);
    text(fun.term[3], 225, 195);
    text(fun.term[4], 375, 195);
    text(fun.term[5], 145, 270);
    text(fun.term[6], 300, 270);
    text(fun.term[7], 455, 270);
    text(fun.def[definition], 110, 475);
    break;
    
    case 3: // small success
    robot.body();
    robot.battery(battery);
    fill(0);
    text(fun.term[0], 145, 120);
    text(fun.term[1], 455, 120);
    text(fun.term[2], 300, 120);
    text(fun.term[3], 225, 195);
    text(fun.term[4], 375, 195);
    text(fun.term[5], 145, 270);
    text(fun.term[6], 300, 270);
    text(fun.term[7], 455, 270);
    text("YOU GOT IT!", 200, 475);
    definition = (int)random(8);
    fill(0, 0, 150);
    rect(230, 320, 195, 60);
    fill(0);
    text("NEW DEFINITION", 280, 350);
    break;
    
    case 4: // darn
    robot.body();
    robot.battery(battery);
    fill(0);
    text(fun.term[0], 145, 120);
    text(fun.term[1], 455, 120);
    text(fun.term[2], 300, 120);
    text(fun.term[3], 225, 195);
    text(fun.term[4], 375, 195);
    text(fun.term[5], 145, 270);
    text(fun.term[6], 300, 270);
    text(fun.term[7], 455, 270);
    text("X", 200, 475);
    definition = (int)random(8);
    fill(0, 0, 150);
    rect(230, 320, 195, 60);
    fill(0);
    text("NEW DEFINITION", 280, 350);
    break;
    
    case 5: //done!
    background(255);
    pushMatrix();
    translate(0, 300);
    thing.doc();
    popMatrix();
    pushMatrix();
    translate(200, 0);
    scale(0.9);
    thing.doc();
    popMatrix();
    pushMatrix();
    translate(-100, -60);
    scale(0.5);
    thing.doc();
    popMatrix();
    fill(0);
    rect(230, 320, 195, 60);
    fill(255);
    text("NEW GAME", 290, 350);
    fill(0);
    text("Congratulations!!", 280, 200);
    break;
  }
  
  
  
}


void mousePressed(){
  int check = checkButton() ;
  if((myState == 0) || (myState == 1)){
    myState++;
  }
  if(myState == 2){
    if(check == definition){
      battery++;
      if(battery < 8){
        myState = 3;
      }
      else{
        myState = 5;
      }
    }
    else if ((check != definition) && (check != 9) && (check != 8)){
      myState = 4;
    }
  }
  if((myState == 3) || (myState == 4)){
    if (check == 8){
      myState = 2;
    }
  }
  if(myState == 5){
    if (check == 8){
      myState = 0;
    }
    
  }
}

int checkButton(){
  int buttonPressed = 9;
  if((mouseX < 230) && (mouseX > 110) && (mouseY < 145) && (mouseY > 85)){
    buttonPressed = 0;
  }
  if((mouseX > 420) && (mouseX < 540) && (mouseY > 85) && (mouseY < 145)){
    buttonPressed = 1;
  }
  if((mouseX > 265) && (mouseX < 385) && (mouseY > 85) && (mouseY < 145)){
    buttonPressed = 2;
  }
  if((mouseX > 190) && (mouseX < 310) && (mouseY > 160) && (mouseY < 220)){
    buttonPressed = 3;
  }
  if((mouseX > 340) && (mouseX < 460) && (mouseY > 160) && (mouseY < 220)){
    buttonPressed = 4;
  }
  if((mouseX > 110) && (mouseX < 230) && (mouseY > 235) && (mouseY < 295)){
    buttonPressed = 5;
  }
  if((mouseX > 265) && (mouseX < 385) && (mouseY > 235) && (mouseY < 295)){
    buttonPressed = 6;
  }
  if((mouseX > 420) && (mouseX < 540) && (mouseY > 235) && (mouseY < 295)){
    buttonPressed = 7;
  }
  
  if((mouseX > 230) && (mouseX < 425) && (mouseY > 320) && (mouseY < 380)){
    buttonPressed = 8;
  }
  return buttonPressed;
}
class Design{
  
  void robo(){
    fill(125);
    rect(220, 425, 80, 200);
    rect(350, 425, 80, 200);
    quad(175, 200, 175, 280, 115, 360, 45, 360);
    quad(475, 200, 475, 280, 535, 360, 605, 360);
    fill(175);
    rect(175, 150, 300, 300);
    rect(175, 150, 150, 300);
    rect(250, 25, 150, 150);
    rect(175, 600, 125, 50);
    rect(350, 600, 125, 50);
    fill(100, 0, 0);
    triangle(290, 60, 275, 90, 305, 90);
    triangle(360, 60, 345, 90, 375, 90);
    rect(275, 120, 100, 25);
    fill(135, 0, 0);
    rect(275, 120, 10, 25);
    rect(295, 120, 10, 25);
    rect(315, 120, 10, 25);
    rect(335, 120, 10, 25);
    rect(355, 120, 10, 25);
  }
  
  void doc(){
    fill(0);
    ellipse(300, 280, 40, 30);
    ellipse(350, 280, 40, 30);
    ellipse(285, 200, 30, 30);
    ellipse(365, 200, 30, 30);
    fill(255);
    quad(300, 175, 350, 175, 375, 275, 275, 275);
    quad(300, 175, 325, 175, 325, 275, 275, 275);
    fill(0);
    ellipse(320, 200, 4, 4);
    ellipse(320, 220, 4, 4);
    ellipse(320, 240, 4, 4);
    ellipse(320, 260, 4, 4);
    fill(150);
    ellipse(325, 150, 80, 80);
    fill(0);
    quad(287, 140, 363, 140, 360, 130, 290, 130);
    triangle(310, 150, 305, 155, 315, 155);
    triangle(340, 150, 335, 155, 345, 155);
    triangle(310, 170, 340, 170, 330, 180);
    fill(230);
    ellipse(325, 135, 20, 20);
    ellipse(325, 135, 3, 3);
  }
  
  void popin(){
    fill(255);
    quad(650, 450, 650, 300, 550, 250, 525, 310);
    fill(150);
    ellipse(530, 260, 100, 100);
    fill(0);
    quad(490, 230, 570, 230, 576, 240, 486, 240);
    triangle(510, 250, 503, 265, 517, 265);
    triangle(550, 250, 543, 265, 557, 265);
    ellipse(530, 290, 30, 15);
    fill(230);
    ellipse(530, 235, 20, 20);
    ellipse(530, 235, 5, 5);
  }
  
}
class Game{
  
  void body(){
    background(0);
    
    //body of robot
    fill(175);
    rect(40, 25, 570, 600);
    quad(75, 50, 75, 600, 0, 650, 0, 0);
    quad(575, 50, 575, 600, 650, 650, 650, 0);
    fill(100);
    rect(75, 50, 500, 550);
    fill(140);
    rect(90, 415, 470, 160);
    fill(0, 115, 0);
    rect(97, 422, 456, 146);
    
    //buttons
    fill(140);
    rect(95, 70, 460, 330);
    
    fill(210, 0, 0);
    rect(110, 85, 120, 60);
    fill(0, 210, 0);
    rect(420, 85, 120, 60);
    fill(0, 0, 210);
    rect(265, 85, 120, 60);
    fill(230, 0, 160);
    rect(190, 160, 120, 60);
    fill(0, 210, 140);
    rect(340, 160, 120, 60);
    fill(140, 0, 210);
    rect(110, 235, 120, 60);
    fill(210, 140, 0);
    rect(265, 235, 120, 60);
    fill(210, 210, 0);
    rect(420, 235, 120, 60);
    fill(0, 0, 50);
    rect(230, 320, 195, 60);
    fill(0);
    text("NEW DEFINITION", 280, 350);
    fill(0, 200, 0);
    rect(495, 427, 30, 20);
    rect(480, 432, 60, 130);
    fill(0, 115, 0);
    rect(485, 437, 50, 120);//557
  }
  
  void battery(int charge){
    if(charge >= 1){                   //1
      fill(0, 200, 0);
      rect(490, 543, 40, 12);
      if(charge >= 2){                 //2
        rect(490, 529, 40, 13);
        if(charge >= 3){               //3
          rect(490, 514, 40, 13);
          if(charge >= 4){              //4
            rect(490, 499, 40, 13);    
            if(charge >= 5){            //5
              rect(490, 484, 40, 13);
              if(charge >= 6){          //6
                rect(490, 469, 40, 13);
                if(charge >= 7){        //7
                  rect(490, 454, 40, 13);
                  if(charge == 8){              //8
                    rect(490, 440, 40, 12);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  
}
class Play{
  String[] pool = {"proton", "electron", "neutron", "compound", "fluid", "ion", "mass", "nucleus", "products", "weight", "anion", "cation", "bond", "charge"};
  String[] dictionary = {"positively charged particle in an atom", "negatively charged particle in an atom", 
      "neutral particle in an atom", "a substance containing more than one element", 
      "a liquid or gas", "atom with an unbalance charge caused by a change in electrons", 
      "the quantity of matter in a body", "the central part of an atom containing the protons and neutron",
      "the substances produced in a chemical reaction", "the gravitational force exerted on a mass",
      "a negative ion", "a positive ion",
      "a chemical link between atoms", "the amount of unbalanced electricity in a system"};
  String[] term = new String[8];
  String[] def = new String[8];
  
  
  void setTerm(int index)
  {
    int assignment = (int)random(14);
    term[index] = pool[assignment];
    def[index] = dictionary[assignment];
    if (index == 0)
    {}
    else
    {
      for (int i = 0; i < index; i++)
      {
        if (term[i] == term[index])
        {
          this.setTerm(index);
        }
        else
        {}
      }
    }
  }
  
  
}


