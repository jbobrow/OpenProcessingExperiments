
PFont Helvetica18;


void setup() {
  size(700,600);
  Helvetica18 = loadFont("Helvetica-Light-18.vlw");
}

void draw () {
  background(100);
  fill(0);
  smooth();
  textFont(Helvetica18);
  text("What Should I Eat?", 50, 70);
  text("would a snack suffice?", 101, 150);
  
  yesButton(300,130, width/10, height/17);
  noButton(400,130, width/10, height/17);
  
  if(mouseX >= 325 && mouseX <= 370 && mouseY >= 36 && mouseY <= 166)
  text("Find some string cheese", 201, 201);
  
  if(mouseX >= 425 && mouseX <= 470 && mouseY >= 36 && mouseY <= 520)
  text("Can you eat gluten?", 400, 201);
    if(mouseX >= 420 && mouseX <= 520 && mouseY >= 36 && mouseY <= 520)
  yesButton(350,320,width/10,height/17);
      if(mouseX >= 425 && mouseX <= 520 && mouseY >= 36 && mouseY <= 520)
  
  noButton(450,320,width/10,height/17);
   
}

void yesButton(int xPos, int yPos, int w, int h){
rect(xPos,yPos,w,h);
  fill(255,250,250);
  text("YES",xPos+15,yPos+20);
  fill(0);
  
}

void noButton(int x2Pos, int y2Pos, int w, int h){
  
  rect(x2Pos,y2Pos,w,h);
  fill(255,250,250);
  text("NO",x2Pos+20,y2Pos+20);
  fill(0);
}


