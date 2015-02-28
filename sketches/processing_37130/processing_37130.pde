
void crash(){
  textFont(font, 30);
   
  fill(255, 0, 0);
   
  text("You have crashed.", 400, 20);
  print("CRASH");
  crashed = true;


 


   
}
 
void successfulLanding(){
 
  textFont(font, 48);
  delay(1000);
 
  score += targetScore;
  genTarget();
  generateStars();
  generateEarth();
  generateLand();
  SpaceShipx = random(340, scrWidth-50);
  SpaceShipy = 0;
  SpaceShipySpeed = 0.1;
 
 
  fuel += 35;
 
  if(fuel > 340){
 
    fuel = 340;
 
  }
 
 
  crashed = false;
  keyPress = false;
}

