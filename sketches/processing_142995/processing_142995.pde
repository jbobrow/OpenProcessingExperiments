
String[] conchshell = new String [20]; 

void setup(){
//frameRate(2);
size(500, 500);
conchshell[0] = "It is certain";
conchshell[1] = "It is decidedly so";
conchshell[2] = "Without a doubt";
conchshell[3] = "I guess";
conchshell[4] = "Good luck with that";
conchshell[5] = "Consult a doctor";
conchshell[6] = "Consult The Doctor";
conchshell[7] = "Whatever";
conchshell[8] = "Sorry, not sorry";
conchshell[9] = "Leave me alone";
conchshell[10] = "Can't you make your own decisions?";
conchshell[11] = "Hell no!";
conchshell[12] = "Hell yeah!";
conchshell[13] = "Google it.";
conchshell[14] = "Ask Siri";
conchshell[15] = "Very answers, such luck. WOW.";
conchshell[16] = "Absolutely";
conchshell[17] = "Make it so";
conchshell[18] = "Sleep on it";
conchshell[19] = "That's cute, but no";
}

void draw(){
  background(255);
fill(0);
textAlign(CENTER);
textSize(20);
text(conchshell [floor(random(20))], 250, 250);
if (mousePressed == true){
  noLoop();
}
}
void mouseReleased (){
  loop();
}
