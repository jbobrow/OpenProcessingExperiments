
int myState = 0 ;
Robot vocab = new Robot();

void setup() {
  size(650, 650);
}

void draw() {
  background(150) ;
  
 switch(myState) {
   case 0:
   text("Introduction Splash", width/3, height/2) ;
   break ;
   
   case 1:
   //playing game
   vocab.display();
   fill(255);
   text("Definition", 120, 450);
   text("Correct Term", 120, 125);
   break ;
   
   case 2:
   vocab.display();
   fill(255);
   text("This continues for as many terms as I have buttons", 120, 450);
   text("Undecided on number of buttons", 120 ,240);
   break;
   
   case 3:
   vocab.display();
   fill(0, 175, 0);
   rect(585, 100, 30, 100);
   fill(255);
   text("Battery/Score", 565, 92);
   text("(Temporary Indicator for presentation, it'll look better)", 300, 80);
   text("The battery fills as they get it right", 120, 450);
   break;
   
   case 4:
   text("Hooray!  End/Win splash screen", width/2, height/2);
   break;
 }
 
  
}

void mousePressed() {
  myState = (myState + 1) % 5 ;
}
class Robot{

void display()
{
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
  fill(140);
  rect(95, 70, 460, 330);
  rect(110, 85, 120, 60);
  rect(420, 85, 120, 60);
  rect(265, 85, 120, 60);
  rect(190, 160, 120, 60);
  rect(340, 160, 120, 60);
}
}


