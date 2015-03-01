
boolean key1Playing = false;
boolean key2Playing = false;
boolean key3Playing = false;
boolean key4Playing = false;
boolean key5Playing = false;
boolean key6Playing = false;
boolean key7Playing = false;
boolean key8Playing = false;
boolean key9Playing = false;
boolean key10Playing = false;
boolean key11Playing = false;
boolean key12Playing = false;
boolean key13Playing = false;
boolean key14Playing = false;
boolean key15Playing = false;
boolean key16Playing = false;

Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10;
AudioPlayer player11;
AudioPlayer player12;
AudioPlayer player13;
AudioPlayer player14;
AudioPlayer player15;
AudioPlayer player16;

float speedAdjust = 1.0;

void setup()
{
  size(900, 600);
  
  maxim = new Maxim(this);
  
  //TOP ROW
  
  player1 = maxim.loadFile("001.wav");
  player1.setLooping(true);
  
  player2 = maxim.loadFile("002.wav");
  player2.setLooping(true);
  
  player3 = maxim.loadFile("003.wav");
  player3.setLooping(true);
  
  player4 = maxim.loadFile("004.wav");
  player4.setLooping(true);
  
  
  //SECOND ROW
  
  player5 = maxim.loadFile("005.wav");
  player5.setLooping(true);
  
  player6 = maxim.loadFile("006.wav");
  player6.setLooping(true);
  
  player7 = maxim.loadFile("007.wav");
  player7.setLooping(true);
  
  player8 = maxim.loadFile("008.wav");
  player8.setLooping(true);
  
  //THIRD ROW
  
  player9 = maxim.loadFile("009.wav");
  player9.setLooping(true);
  
  player10 = maxim.loadFile("010.wav");
  player10.setLooping(true);
  
  player11 = maxim.loadFile("011.wav");
  player11.setLooping(true);
  
  player12 = maxim.loadFile("012.wav");
  player12.setLooping(true);
  
  //FOURTH ROW
  
  player13 = maxim.loadFile("013.wav");
  player13.setLooping(true);
  
  player14 = maxim.loadFile("014.wav");
  player14.setLooping(true);
  
  player15 = maxim.loadFile("015.wav");
  player15.setLooping(true);
  
  player16 = maxim.loadFile("016.wav");
  player16.setLooping(true);

  noStroke();
  
  rectMode(CENTER);
  
  //TOP ROW
  fill(239, 99, 101);
  rect(width/8, height/8, width/4, height/4);
  
  fill(148, 210, 213);
  rect((width*3/8), height/8, width/4, height/4);
  
  fill(122, 76, 143);
  rect((width*5/8), height/8, width/4, height/4);
  
  fill(216,75,116);
  rect((width*7/8), height/8, width/4, height/4);
  
  
  //SECOND ROW
  fill(237, 231, 218);
  rect(width/8, (height*3/8), width/4, height/4);
  
  fill(216,75,116);
  rect((width*3/8), (height*3/8), width/4, height/4);
  
  fill(109, 58, 113);
  rect((width*5/8), (height*3/8), width/4, height/4);
  
  fill(92,205,212);
  rect((width*7/8), (height*3/8), width/4, height/4);
  
  
  //THIRD ROW
  fill(85, 36, 90);
  rect(width/8, (height*5/8), width/4, height/4);
  
  fill(246,246,240);
  rect((width*3/8), (height*5/8), width/4, height/4);
  
  fill(238, 134, 98);
  rect((width*5/8), (height*5/8), width/4, height/4);
  
  fill(215,74,115);
  rect((width*7/8), (height*5/8), width/4, height/4);
  
  
  //FOURTH ROW
  fill(122, 76, 143);
  rect(width/8, (height*7/8), width/4, height/4);
  
  fill(216,75,116);
  rect((width*3/8), (height*7/8), width/4, height/4);
  
  fill(239, 99, 101);
  rect((width*5/8), (height*7/8), width/4, height/4);
  
  fill(217, 209, 196);
  rect((width*7/8), (height*7/8), width/4, height/4);
}
 
 /* //CURSOR STYLE
  stroke(255);
  noFill();
  ellipse(mouseX, mouseY, 10, 10);
  
  stroke(255, 255, 255, 60);
  noFill();
  ellipse(mouseX, mouseY, 30, 30);
  
  stroke(255, 255, 255, 30);
  noFill();
  ellipse(mouseX, mouseY, 60, 60);*/

void draw()
{  }
  
void mouseClicked()
{
  
  //KEY1

  if(mouseX < (width/4) && mouseY < (height/4)) {
    
     key1Playing = !key1Playing;
     fill(255, 255, 255, 70);
     rect(width/8, height/8, width/4, height/4);
  }

  if (key1Playing) {
    player1.play();
  } 
  else {

    player1.stop();
     fill(239, 99, 101);
     rect(width/8, height/8, width/4, height/4);
  }
  
  
  
  //KEY2
  
   if(mouseX < (width/2) && mouseX > (width/4) && mouseY < (height/4)) {
    
     key2Playing = !key2Playing;
     fill(255, 255, 255, 70);
     rect((width*3/8), height/8, width/4, height/4);
  }

  if (key2Playing) {
    player2.play();
  } 
  else {
    player2.stop();
    fill(148, 210, 213);
    rect((width*3/8), height/8, width/4, height/4);
  }
  
  
  
  //KEY3
  
   if(mouseX < (width*3/4) && mouseX > (width/2) && mouseY < (height/4)) {
    
     key3Playing = !key3Playing;
     fill(255, 255, 255, 70);
     rect((width*5/8), height/8, width/4, height/4);
  }

  if (key3Playing) {
    player3.play();
  } 
  else {
    player3.stop();
    fill(122, 76, 143);
    rect((width*5/8), height/8, width/4, height/4);
  }
  
  
 //KEY4
  
  if(mouseX > (width*3/4) && mouseY < (height/4)) {
    
     key4Playing = !key4Playing;
     fill(255, 255, 255, 70);
     rect((width*7/8), height/8, width/4, height/4);
  }

  if (key4Playing) {
    player4.play();
  } 
  else {
    player4.stop();
    fill(216,75,116);
    rect((width*7/8), height/8, width/4, height/4);
  }
  
  
  //KEY 5
  if(mouseX < (width/4) && mouseY < (height/2) && mouseY > (height/4)) {
    
     key5Playing = !key5Playing;
     fill(255, 255, 255, 70);
     rect(width/8, (height*3/8), width/4, height/4);
  }

  if (key5Playing) {
    player5.play();
  } 
  else {
    player5.stop();
    fill(237, 231, 218);
    rect(width/8, (height*3/8), width/4, height/4);
  }
  
  
  //KEY 6
  if(mouseX < (width/2) && mouseX > (width/4) && mouseY < (height/2) && mouseY > (height/4)) {
    
     key6Playing = !key6Playing;
     fill(255, 255, 255, 70);
     rect((width*3/8), (height*3/8), width/4, height/4);
  }

  if (key6Playing) {
    player6.play();
  } 
  else {
    player6.stop();
    fill(216,75,116);
    rect((width*3/8), (height*3/8), width/4, height/4);
  }
  
  
  //KEY 7
  if(mouseX < (width*3/4) && mouseX > (width/2) && mouseY < (height/2) && mouseY > (height/4)) {
    
     key7Playing = !key7Playing;
     fill(255, 255, 255, 70);
     rect((width*5/8), (height*3/8), width/4, height/4);

  }

  if (key7Playing) {
    player7.play();
  } 
  else {
    player7.stop();
    fill(109, 58, 113);
  rect((width*5/8), (height*3/8), width/4, height/4);
  }
  
  
  //KEY 8
  if(mouseX > (width*3/4) && mouseY < (height/2) && mouseY > (height/4)) {
    
     key8Playing = !key8Playing;
     fill(255, 255, 255, 70);
    rect((width*7/8), (height*3/8), width/4, height/4);

  }

  if (key8Playing) {
    player8.play();
  } 
  else {
    player8.stop();
    fill(92, 205, 212);
  rect((width*7/8), (height*3/8), width/4, height/4);
  }
  
   
  
  //KEY 9
  if(mouseX < (width/4) && mouseY < (height*3/4) && mouseY > (height/2)) {
    
     key9Playing = !key9Playing;
     fill(255, 255, 255, 70);
    rect((width*1/8), (height*5/8), width/4, height/4);

  }

  if (key9Playing) {
    player9.play();
  } 
  else {
    player9.stop();
    fill(85, 36, 90);
  rect((width*1/8), (height*5/8), width/4, height/4);
  }
  
  

 //KEY 10
  if(mouseX < (width/2) && mouseX > (width/4) && mouseY < (height*3/4) && mouseY > (height/2)) {
    
     key10Playing = !key10Playing;
     fill(255, 255, 255, 70);
    rect((width*3/8), (height*5/8), width/4, height/4);

  }

  if (key10Playing) {
    player10.play();
  } 
  else {
    player10.stop();
    fill( 246,246,240);
  rect((width*3/8), (height*5/8), width/4, height/4);
  }
  
  
  
  //KEY 11
  if(mouseX > (width/2) && mouseX < (width*3/4) && mouseY < (height*3/4) && mouseY > (height/2)) {
    
     key11Playing = !key11Playing;
     fill(255, 255, 255, 70);
    rect((width*5/8), (height*5/8), width/4, height/4);

  }

  if (key11Playing) {
    player11.play();
  } 
  else {
    player11.stop();
    fill(238, 134, 98);
  rect((width*5/8), (height*5/8), width/4, height/4);
  }
  
  
  //KEY 12
  if(mouseX > (width*3/4) && mouseY < (height*3/4) && mouseY > (height/2)) {
    
     key12Playing = !key12Playing;
     fill(255, 255, 255, 70);
    rect((width*7/8), (height*5/8), width/4, height/4);

  }

  if (key12Playing) {
    player12.play();
  } 
  else {
    player12.stop();
    fill(215,74,115);
  rect((width*7/8), (height*5/8), width/4, height/4);
  }
  
  
  //KEY 13
  if(mouseX < (width/4) && mouseY > (height*3/4)) {
    
     key13Playing = !key13Playing;
     fill(255, 255, 255, 70);
    rect(width/8, (height*7/8), width/4, height/4);

  }

  if (key13Playing) {
    player13.play();
  } 
  else {
    player13.stop();
    fill(122, 76, 143);
  rect(width/8, (height*7/8), width/4, height/4);
  }
  
  
  
  //KEY 14
  if(mouseX > (width/4) && mouseX < (width/2) && mouseY > (height*3/4)) {
    
     key14Playing = !key14Playing;
     fill(255, 255, 255, 70);
    rect((width*3/8), (height*7/8), width/4, height/4);

  }

  if (key14Playing) {
    player14.play();
  } 
  else {
    player14.stop();
    fill(216,75,116);
  rect((width*3/8), (height*7/8), width/4, height/4);
  }
  
  
  //KEY 15
  if(mouseX < (width*3/4) && mouseX > (width/2) && mouseY > (height*3/4)) {
    
     key15Playing = !key15Playing;
     fill(255, 255, 255, 70);
    rect((width*5/8), (height*7/8), width/4, height/4);

  }

  if (key15Playing) {
    player15.play();
  } 
  else {
    player15.stop();
    fill(239, 99, 101);
  rect((width*5/8), (height*7/8), width/4, height/4);
  }
  
  
  //KEY 16
  if(mouseX > (width*3/4) && mouseY > (height*3/4)) {
    
     key16Playing = !key16Playing;
     fill(255, 255, 255, 70);
    rect((width*7/8), (height*7/8), width/4, height/4);

  }

  if (key16Playing) {
    player16.play();
  } 
  else {
    player16.stop();
    fill(217, 209, 196);
  rect((width*7/8), (height*7/8), width/4, height/4);
  }

}

void mouseDragged() {
  
  //SPEED KEY 1
   
 if (mouseX < (width/4) && mouseY < (height/4)) {
   player1.speed(speedAdjust);
   speedAdjust=map(mouseX,0,width/4,0,2);
   fill(speedAdjust * 127);
   rect(width/8, height/8, width/4, height/4);
 }
  
  //SPEED KEY 2
  
  if (mouseX < (width/2) && mouseX > (width/4) && mouseY < (height/4)) {
   player2.speed(speedAdjust);
   speedAdjust=map(mouseX,width/4,width/2,0,2);
   fill(speedAdjust * 127);
   rect((width*3/8), height/8, width/4, height/4);
 }
  
  //SPEED KEY 3

  if(mouseX < (width*3/4) && mouseX > (width/2) && mouseY < (height/4)) {
   player3.speed(speedAdjust);
   speedAdjust=map(mouseX,width/2,(width*3/4),0,2);
   fill(speedAdjust * 127);
   rect((width*5/8), height/8, width/4, height/4);
 }
   
   //SPEED KEY 4
 
 if(mouseX > (width*3/4) && mouseY < (height/4)) {
   player4.speed(speedAdjust);
   speedAdjust=map(mouseX,(width*3/4),width,0,2);
   fill(speedAdjust * 127);
   rect((width*7/8), height/8, width/4, height/4);
 }
 
 //SPEED KEY 5
 
 if(mouseX < (width/4) && mouseY < (height/2) && mouseY > (height/4)) {
   player5.speed(speedAdjust);
   speedAdjust=map(mouseX,0,width/4,0,2);
   fill(speedAdjust * 127);
   rect(width/8, (height*3/8), width/4, height/4);
 }
 
  //SPEED KEY 6
 
 if(mouseX < (width/2) && mouseX > (width/4) && mouseY < (height/2) && mouseY > (height/4)) {
   player6.speed(speedAdjust);
   speedAdjust=map(mouseX,width/4,width/2,0,2);
   fill(speedAdjust * 127);
   rect((width*3/8), (height*3/8), width/4, height/4);
 }
 
   //SPEED KEY 7
 
 if(mouseX < (width*3/4) && mouseX > (width/2) && mouseY < (height/2) && mouseY > (height/4)) {
   player7.speed(speedAdjust);
   speedAdjust=map(mouseX,width/2,(width*3/4),0,2);
   fill(speedAdjust * 127);
   rect((width*5/8), (height*3/8), width/4, height/4);
 }
 
  //SPEED KEY 8
 
 if(mouseX > (width*3/4) && mouseY < (height/2) && mouseY > (height/4)) {
   player8.speed(speedAdjust);
   speedAdjust=map(mouseX,(width*3/4),width,0,2);
   fill(speedAdjust * 127);
   rect((width*7/8), (height*3/8), width/4, height/4);
 }
 
 //SPEED KEY 9
 
 if(mouseX < (width/4) && mouseY < (height*3/4) && mouseY > (height/2)) {
   player9.speed(speedAdjust);
   speedAdjust=map(mouseX,0,width/4,0,2);
   fill(speedAdjust * 127);
   rect((width*1/8), (height*5/8), width/4, height/4);
 }
 
 //SPEED KEY 10
 
 if(mouseX < (width/2) && mouseX > (width/4) && mouseY < (height*3/4) && mouseY > (height/2)) {
   player10.speed(speedAdjust);
   speedAdjust=map(mouseX,width/4,width/2,0,2);
   fill(speedAdjust * 127);
   rect((width*3/8), (height*5/8), width/4, height/4);
 }
 
 //SPEED KEY 11
 
 if(mouseX > (width/2) && mouseX < (width*3/4) && mouseY < (height*3/4) && mouseY > (height/2)) {
   player11.speed(speedAdjust);
   speedAdjust=map(mouseX,width/2,(width*3/4),0,2);
   fill(speedAdjust * 127);
   rect((width*5/8), (height*5/8), width/4, height/4);
 }
 
 //SPEED KEY 12
 
 if(mouseX > (width*3/4) && mouseY < (height*3/4) && mouseY > (height/2)) {
   player12.speed(speedAdjust);
   speedAdjust=map(mouseX,(width*3/4),width,0,2);
   fill(speedAdjust * 127);
   rect((width*7/8), (height*5/8), width/4, height/4);
 }
 
 //SPEED KEY 13
 
 if(mouseX < (width/4) && mouseY > (height*3/4)) {
   player13.speed(speedAdjust);
   speedAdjust=map(mouseX,0,width/4,0,2);
   fill(speedAdjust * 127);
   rect(width/8, (height*7/8), width/4, height/4);
 }
 
 //SPEED KEY 14
 
 if(mouseX > (width/4) && mouseX < (width/2) && mouseY > (height*3/4)) {
   player14.speed(speedAdjust);
   speedAdjust=map(mouseX, width/4, width/2, 0,2);
   fill(speedAdjust * 127);
   rect((width*3/8), (height*7/8), width/4, height/4);
 }
 
 //SPEED KEY 15
 
 if(mouseX < (width*3/4) && mouseX > (width/2) && mouseY > (height*3/4)) {
   player15.speed(speedAdjust);
   speedAdjust=map(mouseX, width/2, (width*3/4), 0,2);
   fill(speedAdjust * 127);
   rect((width*5/8), (height*7/8), width/4, height/4);
 }
 
 //SPEED KEY 16
 
 if(mouseX > (width*3/4) && mouseY > (height*3/4)) {
   player16.speed(speedAdjust);
   speedAdjust=map(mouseX,(width*3/4), width, 0,2);
   fill(speedAdjust * 127);
   rect((width*7/8), (height*7/8), width/4, height/4);
 }

}



