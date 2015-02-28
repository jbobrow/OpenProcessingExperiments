
void display_startingInfo(){
  background(10,129,206);  
  smooth();
  textSize(40);
  fill(255,0,0);
  text("PLAY THE GAME",203,103);
  fill(255);
  text("PLAY THE GAME",200,100);
  image(images[frame],10,0);
   stroke(30,95,137);
   strokeWeight(50);
   noFill();
   rect(0,0,595,595);
     stroke(255);
     strokeWeight(2);
       line(0,0,25,25);
       line(571,26,600,-3);
       line(0,600,25,570);
       line(600,600,570,570);
       rect(25,25,545,545); 
}

void display_game1(){
  frameRate(6);
  background(255,208,88);
   strokeWeight(.5);
    noStroke();
    fill(234,206,43);
    ellipse(x1,y1,50,50);
  textSize(100);
  fill(255,0,0);
  text("YOU WIN",96,100);
  fill(255);
  text("YOU WIN",90,100);
  fill(0);
  text("YOU WIN",93,103);
    image(images2[frame2],0,0);
    if(x1 > width){
     gameOver = true;
     play = false;
 }
}

void display_game2(){
  background(0,0,255);
  fill(0);
  text("WHUDDUP",100,100);
}

void display_gameOver(){
  background(255,0,0);
   
    noStroke();
    fill(191,113,12);
     ellipse(0,400,590,590);
    fill(203,8,8);
     ellipse(322,140,590,590);
    fill(0,104,167);
     ellipse(0,0,600,600);
    fill(11,131,114);
     ellipse(556,448,600,600);
     
    
    fill(160,63,92);
    textSize(110);   
    text("UHHHHHH...",78,150);
    fill(234,224,93);
    textSize(105);
    text("UHHHHHH...",85,150);
    textSize(100);
    fill(255);
    text("UHHHHHH...",96,151);
    textSize(70);
    fill(0,104,167);
    text("YOU DIDN'T WIN",100,500);
    fill(234,224,93);
    textSize(65);
    text("YOU DIDN'T WIN",110,500);    
    textSize(60);   
    fill(255);
    text("YOU DIDN'T WIN",118,501);
    fill(11,131,114);
    textSize(26);
    text("¿PlΔY ΔGΔIN?",xRestart,yRestart);
    textSize(25);
    fill(234,224,193);
    text("¿PlΔY ΔGΔIN?",119,301);
     
    stroke(255);
    strokeWeight(1);
    noFill();
    rect(45,45,590,510);
}     
  


