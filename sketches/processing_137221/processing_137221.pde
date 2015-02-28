
void setup() {
  size(200,200);
  background(0);
  stroke(255);
  fill(255);
  rect(25,25,150,150);
  stroke(0);
  line(25,75,175,75);
  line(25,125,175,125);
  line(75,25,75,175);
  line(125,25,125,175);

}
void draw() {
}
boolean[] squareFilled = {true,true,true,true,true,true,true,true,true};
int playerTurn=1;
void mouseClicked() {
   println(playerTurn);
  int turn=playerTurn%2;
  stroke(0);
  fill(255);
  if((mouseX<75)&&(mouseX>25)&&(mouseY>25)&&(mouseY<75)&&(squareFilled[0]==true)) {
  switch(turn) {
  case 0:  
  ellipse(50,50,50,50); 
  break;
  case 1:
  line(25,25,75,75);
  line(75,25,25,75);
  break;
  } 
  playerTurn=playerTurn+1;
  squareFilled[0]=false;
} else if((mouseX<125)&&(mouseX>75)&&(mouseY>25)&&(mouseY<75)&&(squareFilled[1]==true)) {
  switch(turn) {
  case 0:  
  ellipse(100,50,50,50); 
  break;
  case 1:
  line(75,25,125,75);
  line(75,75,125,25);
  break;
  } 
  playerTurn=playerTurn+1;
  squareFilled[1]=false;
} else if((mouseX<175)&&(mouseX>125)&&(mouseY>25)&&(mouseY<75)&&(squareFilled[2]==true)) {
  switch(turn) {
  case 0:  
  ellipse(150,50,50,50); 
  break;
  case 1:
  line(125,25,175,75);
  line(125,75,175,25);
  break;
  } 
  playerTurn=playerTurn+1;
  squareFilled[2]=false;
}else if((mouseX<75)&&(mouseX>25)&&(mouseY>75)&&(mouseY<125)&&(squareFilled[3]==true)) {
  switch(turn) {
  case 0:  
  ellipse(50,100,50,50); 
  break;
  case 1:
  line(25,75,75,125);
  line(25,125,75,75);
  break; 
  }
  playerTurn=playerTurn+1;
  squareFilled[3]=false;
}  else if((mouseX<125)&&(mouseX>75)&&(mouseY>75)&&(mouseY<125)&&(squareFilled[4]==true)) {
  switch(turn) {
  case 0:  
  ellipse(100,100,50,50); 
  break;
  case 1:
  line(75,75,125,125);
  line(75,125,125,75);
  break; 
  } 
  playerTurn=playerTurn+1;
  squareFilled[4]=false;
}  else if((mouseX<175)&&(mouseX>125)&&(mouseY>75)&&(mouseY<125)&&(squareFilled[5]==true)) {
  switch(turn) {
  case 0:  
  ellipse(150,100,50,50); 
  break;
  case 1:
  line(125,75,175,125);
  line(125,125,175,75);
  break; 
  } 
  playerTurn=playerTurn+1;
  squareFilled[5]=false;
}  else if((mouseX<75)&&(mouseX>25)&&(mouseY>125)&&(mouseY<175)&&(squareFilled[6]==true)) {
  switch(turn) {
  case 0:  
  ellipse(50,150,50,50); 
  break;
  case 1:
  line(25,125,75,175);
  line(25,175,75,125);
  break; 
  } 
  playerTurn=playerTurn+1;
  squareFilled[6]=false;
}  else if((mouseX<125)&&(mouseX>75)&&(mouseY>125)&&(mouseY<175)&&(squareFilled[7]==true)) {
  switch(turn) {
  case 0:  
  ellipse(100,150,50,50);
  break;
  case 1:
  line(75,125,125,175);
  line(75,175,125,125);
  break; 
  } 
  playerTurn=playerTurn+1;
  squareFilled[7]=false;
}  else if((mouseX<175)&&(mouseX>125)&&(mouseY>125)&&(mouseY<175)&&(squareFilled[8]==true)) {
  switch(turn) {
  case 0:  
  ellipse(150,150,50,50);
  break;
  case 1:
  line(125,125,175,175);
  line(125,175,175,125);
  break; 
  } 
  playerTurn=playerTurn+1;
  squareFilled[8]=false;
}}
