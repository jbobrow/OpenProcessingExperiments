
int monsterX;
int monsterY;
int richting;
int score;
boolean test; 

void setup () {
  size (400,400); 
  monsterX = 164;
  monsterY = 217;
  richting = 7;
  score = 0;
  test = false; 
}

void draw () {
  
  background (255); 
  
  //arm links */
  if (test == true){
    fill(247, 122, 122);
  }
  if (test == false){
    fill(77, 158, 149);
  }
  noStroke();
  rect(monsterX,monsterY,24,10); //x = 164. y = 217.
  
  noStroke();
  rect(monsterX-9,monsterY+22,9,51);
  
  //arm rechts */
  if (test == true){
    fill(247, 122, 122);
  }
  if (test == false){
    fill(77, 158, 149);
  }
  noStroke();
  rect(monsterX+137, monsterY, 24, 10);
  
  noStroke();
  rect(monsterX+146, monsterY-22, 9, 51);
  
  //been links */
  if (test == true){
    fill(247, 122, 122);
  }
  if (test == false){
    fill(77, 158, 149);
  }
  noStroke();
  rect(monsterX+42, monsterY+81, 12, 31);
  
  noStroke();
  rect(monsterX+35, monsterY+100, 26, 11);
  
  //been rechts */
  if (test == true){
    fill(247, 122, 122);
  }
  if (test == false){
    fill(77, 158, 149);
  }
  noStroke();
  rect(monsterX+92, monsterY+81, 12, 31);
  
  noStroke();
  rectMode(CENTER);
  rect(monsterX+99, monsterY+100, 26, 11);
  
  //lichaam */ //x = 164. y = 217
  if (test == true){
    fill(255,0,0);
  }
  if (test == false){
    fill(118, 198, 191);
  }
  noStroke();
  rectMode(CENTER);
  rect(monsterX+67, monsterY-7, 126, 149);
  
  //beeldscherm */
  if (test == true){
    fill(219, 49, 49);
  }
  if (test == false){
    fill(211, 244, 244);
  }
  noStroke(); 
  rectMode(CENTER);
  rect(monsterX+66,monsterY-37,91,57); 
  
  //gezicht */
  noFill();
  stroke(0);
  ellipse (monsterX+66,monsterY-37,25,40);
  
    if (test == true){
    fill(219, 49, 49);
  }
  if (test == false){
    fill(211, 244, 244);
  }
  noStroke ();
  rect (monsterX+65,monsterY-45,35,40);

  //ogen */
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX+42, monsterY-45, 11, 18);
  
  noStroke();
  ellipseMode(CENTER);
  ellipse(monsterX+92, monsterY-45, 11, 18);
  
  //Laadje */ //x = 164. y = 217
  noStroke();
  fill(67, 66, 66); 
  rectMode(CENTER);
  rect(monsterX+52, monsterY+8, 63, 6);
  
  //Knopjes */
  noStroke();
  fill(142, 90, 167); 
  ellipseMode(CENTER);
  ellipse(monsterX+102, monsterY+7, 10, 9);
  
  noStroke();
  fill(255, 0, 0); 
  ellipseMode(CENTER);
  ellipse(monsterX+90, monsterY+48, 14, 14);
  
  noStroke();
  fill(125, 249, 131); 
  ellipseMode(CENTER);
  ellipse(monsterX+106, monsterY+36, 10, 10);
  
  noStroke();
  fill(0, 228, 255);
  rectMode(CENTER); 
  rect(monsterX+89, monsterY+29, 7, 7);
  
  //Gele knoppen */
  noStroke();
  fill(255, 222, 0);
  rectMode(CENTER);
  rect(monsterX+32, monsterY+28, 7, 12); 
  
  noStroke();
  rectMode(CENTER);
  rect(monsterX+32, monsterY+35, 7, 12);
  
  noStroke();
  rectMode(CENTER);
  rect(monsterX+26, monsterY+32, 11, 7);
  
  noStroke();
  rectMode(CENTER);
  rect(monsterX+38, monsterY+32, 11, 7);
  
  //Usb poortjes */
  noStroke(); 
  fill(122, 120, 120); 
  ellipseMode(CENTER);
  ellipse(monsterX+24, monsterY+55, 17, 5);
 
 noStroke();  
  ellipseMode(CENTER);
  ellipse(monsterX+51, monsterY+55, 17, 5); 
  
  if (monsterX > 299 || monsterX < 0){
    richting = -richting; 
    score = score+1; 
  }
  
  monsterX = monsterX + richting;
 
 if (score == 10){
   score = 0; 
   test = !test; 
 }
}
