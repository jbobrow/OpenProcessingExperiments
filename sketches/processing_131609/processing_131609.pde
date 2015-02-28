
void setup(){
  size (400,400);
  background(255);
  
  fill(45);
  rect(20, 40, 60, 160, 5); //left speaker
  fill(216, 216, 203);
  ellipse(50, 80, 20, 20); // Tweeter
  ellipse(50, 145, 35, 35); //Woofer
  fill(20);
  ellipse(50, 145, 10, 10); // small woofer
  ellipse(50, 80, 5, 5); // small tweeter
  
  fill(45);
  rect(320, 40, 60, 160, 5); //right speaker
  fill(216, 216, 203);
  ellipse(350, 80, 20, 20); // tweeter
  ellipse(350, 145, 35, 35); //woofer
  fill(20);
  ellipse(350, 145, 10, 10); //small woofer
  ellipse(350, 80, 5, 5); // small tweeter
  
  
  fill(30);
  rect(110, 30, 180, 90, 15); // tv
  fill(75); 
  rect(117, 37, 165, 75, 5); //screen
  
  fill(134, 122, 83);
  rect(100, 130, 200, 70, 0); // tv stand
  
  fill(255);
  ellipse(135, 232, 45, 45);// person 1
  ellipse(260, 232, 45, 45); // person 2
  
  fill(67, 55,44);
  rect(80, 250, 240, 110);// couch

  

}


