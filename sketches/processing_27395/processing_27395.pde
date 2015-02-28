
// dice  
  
int diceA;
int diceB;
int total;
float rate = 20;
PFont font;

void setup(){
  size(400,400);
  font=loadFont("FranklinGothic-Heavy-30.vlw");
}


void draw(){
  frameRate(rate);
  
   diceA = round((random(5)+1));
   diceB = round((random(5)+1));
   total = diceA + diceB;
   // println(str(total));
   background(0);
   textFont(font, 300); 

   text(str(total), 10, height /2 + 70);
   
   if(mousePressed){
     rate = rate - 1;
     if (rate < 2){
       delay(6500);  // Stops the program for 6.5 seconds
       rate = 20; 
     }
  }
}
  void mouseReleased() {
  rate = 20;  
  }

