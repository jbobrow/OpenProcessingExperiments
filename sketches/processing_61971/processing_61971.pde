

int answer; 

void setup()
 {
 
  size(300, 300);
   background(78, 227, 138);
   smooth();
   frameRate(60);
 
  fill(0);
   textSize(16);
   textAlign(CENTER);
   text( "Ask a Yes/No Question \n then Press Mouse to Roll", width/2, height/2);

 }
 
void draw()
 {
 
if (mousePressed)
 {
   background(random(255), random(255), random(255));
 
  answer = int( random(1,9)); 

  if (answer == 1)
   {
     textAlign(CENTER);
     textSize(40);
     text( "Yes!", width/2, height/2);
   }
 
  if (answer == 2)
   {
     textAlign(CENTER);
     textSize(40);
     text( "No", width/2, height/2);
   }
 
  if (answer == 3)
   {
     textAlign(CENTER);
     textSize(39);
     text( "Maybe", width/2, height/2);
   }
 
  if (answer == 4)
   {
     textSize(36);
     textAlign(CENTER);
     text( "Ask Later...", width/2, height/2);
   }
 
  if (answer == 5)
   {
     textAlign(CENTER);
     textSize(35);
     text( "Keep Dreaming", width/2, height/2);
   }
 
  if (answer == 6)
   {
     textAlign(CENTER);
     textSize(35);
     text( "After a long while", width/2, height/2);
   }
   
  if (answer == 7)
   {
    textAlign(CENTER);
    textSize(40);
     text( "Never", width/2, height/2);
   }
  if (answer == 8)
   {
    textAlign(CENTER);
    textSize(38);
    text( "Of course!", width/2, height/2);
   }
 

}
 

}



