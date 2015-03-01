
float xPos;
float yPos;
float xPos2;
float yPos2;
float rectW = 150;
float rectH = 80;
float offset = 5;
PFont font;
PFont fontitalic;
String q;
String feedback;
String q1;
String q2;
String q3;
String f1;
String f2;
String f3;
String f4;
String f5;
String f6;
int countA;
int countB;


void setup(){
  
  size(600, 600);
  noStroke();
  font = loadFont ("Georgia-48.vlw");
  fontitalic = loadFont ("Georgia-Italic-48.vlw");
  textFont(font, 24);
  q = "Do people die if they eat a traffic light?";
  feedback = "";
  countA = 0;
  countB = 0;

}

void draw(){
   
   background(0);
   rectMode(CENTER);
   xPos = width*0.3;
   yPos = height*0.7;
   xPos2 = width*0.7;
   yPos2 = height*0.7;
   

   
   fill(100);
   rect(xPos + offset, yPos + offset, rectW, rectH);//left.shadow
   fill(255);
   rect(xPos, yPos, rectW, rectH);//left
   fill(100);
   rect(xPos2 + offset, yPos2 + offset, rectW, rectH);//right.shadow
   fill(255);
   rect(xPos2, yPos2, rectW, rectH);//right
   
   
   fill(255);
   textFont(font, 36);
   text("FIRST CHAPTER", width/4, height/6);
   
   fill(255);
   q1 = "Do people die if they eat a traffic light?";
   q2 = "But seriously, you can't eat such a big thing right?";
   q3 = "Do you wanna join the annual traffilightholic festival?";
   
   
   textFont(font, 20);
   f1 = "So nobody will get hurt!!!";
   f2 = "You should really try some!";
   f3 = "How many traffic lights will make you fat?";
   f4 = "So, you're a traffilightholic???";
   f5 = "Why don't you try it?";
   f6 = "Got you!";
   
   
   
   
   
 /*     if (countA == 1) {
     q = q2; feedback = f2;}
   if (countA == 2 && countB == 0) {
     q = q1; feedback = f1;}
   if (countA == 1 && countB == 1) {
     q = q1; feedback = f3;}*/
     
     
     
   text(feedback, width/5, height/4);
   text(q, width/5, height/3);

   
   
   
   
   fill(0);
   textFont(font, 24);
   text("Yes.", xPos - 18, yPos + 4 );
   textFont(font, 24);
   text("No.", xPos2 - 18, yPos2 + 4 );
   
   
   
  
}



void mousePressed(){
  
  
 
   
  if(mouseX > (xPos - rectW/2) && mouseX < (xPos + rectW/2) &&
        mouseY > (yPos - rectH/2) && mouseY < (yPos + rectH/2))
{ countA = countA + 1; 

if(q == q1){q = q2; feedback = f2;} 
else if(q == q2){q = q1; feedback = f1;}
else if(q == q3){q = q1; feedback = f6;}






  
}

  if(mouseX > (xPos2 - rectW/2) && mouseX < (xPos2 + rectW/2) &&
        mouseY > (yPos2 - rectH/2) && mouseY < (yPos2 + rectH/2))
{
  
  if(q == q1){q = q3; feedback = f4;}
  else if(q == q3){q = q1; feedback = f5;}
  else if(q == q2){q = q1; feedback = f3;}
  
  
}
  
   if (countA > 2){
     countA = 1; }
     
   if (countB > 2){
     countB = 1; }
     println(countA, countB, q);


}


