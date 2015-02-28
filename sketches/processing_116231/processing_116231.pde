
int num;
int numCalc;
int numJdgA;
int numJdgB;
int count = 0;
String numStr=""; 
int i;
int FRate=30;

void setup() {
  size(500, 500);
  background(255,255,255,255);
  frameRate(FRate);
}

void draw() {
  background(255,255,255,200);

  frameRate(FRate);
  if(FRate <= 1){ FRate = 1; }
  textSize(12);
  text("The refresh of " + FRate + " times per second", 30, 270);

  textSize(50);
  fill(150,50,50,255);
  rect(50,300,50,50);
  fill(255,255,255,255);
  text("+",55,340);

  fill(50,50,150,255);
  rect(50,350,50,50);
  fill(255,255,255,255);
  text("-",60,390);

  fill(0,0,0,255);
  stroke(0,0,0,255);

  textSize(12);
  text("Process", 300, 15);

  i = 0;
  num = num + 1;
  numCalc = num;
  numJdgA = num % 2;
  numJdgB = numJdgA;
  
  while (numCalc > 1) {
    numJdgB = numCalc % 2;
      if(numJdgB == 1) {
        numCalc = numCalc * 3 + 1;
        text(numCalc, 300, 30+i*10);
        i = i + 1;
      }
      if(numJdgB == 0) {
        numCalc = numCalc / 2;
        text(numCalc, 300, 30+i*10);
        i = i + 1;
      }
  }
  
  textSize(25); 
  if(numJdgA >= 1){
      numStr = "odd";
    }  else {
      numStr = "even";
  }  

  textSize(30); 
  text("Collatz sequence ", 30, 50);  
  
  textSize(25); 
  text("Number:" + num, 30, 100);  
  text("Remainder:" + numJdgA + "→" + numStr, 30, 150);
  text("Step:" + i, 30, 200);  

}

void mouseClicked(){
  if(mouseX>=50 && mouseX<=100 && mouseY>=300 && mouseY<=350){ FRate = FRate + 1; }
  if(mouseX>=50 && mouseX<=100 && mouseY>=350 && mouseY<=400){ FRate = FRate - 1; } 
  if(FRate <= 1){ FRate = 1; }
}


