
boolean shoot = false;
int sphereDiameter = 20;
float seconds = 2; //number of seconds before can exit fail screen.
int tmax = round(30*seconds); //frame rate x seconds
int counter = tmax;
int score;
PFont font;
int gamemode = 0;


int randx()

  {
    return int(random(600-100)+50);
  }
  
  int[] sphereXCoords = { randx(), randx(), randx(), randx(), randx(), randx(), randx() };
  int[] sphereYCoords = { 0, 0, 0, 0, 0, 0, 0};
  

void setup(){
    size(600,685);
    score = 0;
    font = loadFont( "LiberationSans-36.vlw" );
}
  
void draw(){ 
   background(#75A0CE);
   if (gamemode != 1) {
     counter ++;
   }
   if (gamemode == 0) {
     startscreen();
   }
   else if (gamemode == 2) {
     winscreen();
   }
   else if (gamemode == 1) {
     DrawGame();
   }
   else {
     endscreen();
   }
      
}

void DrawGame(){
  //wings and body
  strokeWeight(1);
   fill(#72737C);
   noStroke();   
   rect(mouseX-20,642,40,10);
   triangle(mouseX-20, 650, mouseX+20, 650, mouseX, 615);
   //nose
   fill(#585A71);
   rect(mouseX-2,614,4,8);
   triangle(mouseX-8, 630, mouseX+8, 630, mouseX, 615);   
   //fire  
   fill(#F7BC16);
   triangle(mouseX-7, 650, mouseX+7, 650, mouseX, 675);  
   fill(#DB4116);
   triangle(mouseX-5, 650, mouseX+5, 650, mouseX, 667); 
   if(shoot==true)
   {
    sphereKiller(mouseX);
    fill(#FFAB0D);             
    shoot = false;
   }   
   sphereDropper();
   gameEnder();  
    fill(#5979AA);
   stroke(0);
   textAlign( CENTER );
   textFont( font );
   String scoretext;
   if (score > 100) {
     scoretext = "OVER 9000!?";
   }
   else {
     scoretext = str(score);
   }
   text( scoretext, width/2, height-45 );
   noStroke();
   noFill(); 
   
//   if (score >= 50){
//     score = 9001;
//    gamemode = 2; 
//   }
}
 
 void mousePressed(){
   if (gamemode != 1 && counter >= tmax) {
     resetgame();
     gamemode = 1;
   }
   else if (gamemode == 1) {
    shoot = true;
  }
}

 void sphereDropper(){  
  stroke(#5F507E);
  fill(#9081B2);
  for (int i=0; i<7; i++)
  {
   ellipse(sphereXCoords[i], sphereYCoords[i]+=spherespeed(),
            sphereDiameter, sphereDiameter);
  }
}
  
int spherespeed() {
  return 1+floor(score/25);
}
  
 void sphereKiller(int shotX){
    boolean hit = false;
    for (int i = 0; i < 7; i++)
    {
      if((shotX >= (sphereXCoords[i]-sphereDiameter)) && 
         (shotX <= (sphereXCoords[i]+sphereDiameter)))
      {
        hit = true;
        score++;
        textAlign( CENTER );
        textFont( font );              
        fill(#FFA600);
        //strokeWeight(2);
        stroke(#FFA600);
        line(mouseX, 565, mouseX, sphereYCoords[i]);       
        fill(#FFAB0D);
        stroke(#FFA600);   
        //explosion
        ellipse(sphereXCoords[i], sphereYCoords[i],
        sphereDiameter+25, sphereDiameter+25);
        noFill();
        sphereXCoords[i] = randx();
        sphereYCoords[i] = 0;
      }    
    }
  
    if(hit == false)
    {
      //strokeWeight(2);
      stroke(#FFAB0D);
      fill(#FFAB0D);
      line(mouseX, 565, mouseX, 0);
      
            
    }    
  }
  
void gameEnder(){
  for (int i=0; i< 5; i++)
  {
    if(sphereYCoords[i] >=600)
    {
      gamemode = 3;
    }
  }
}

void resetgame() {
  counter = 0;
  score = 0;
  for (int j=0; j < sphereXCoords.length; j++) {
    sphereXCoords[j] = randx();
    sphereYCoords[j] = 0;        
  }
}

 void winscreen (){
  fill(color(#5979AA));
  strokeWeight(10);
  stroke(#C10208);
  textSize(150);
  textAlign(CENTER);
  textFont (font);
  text("Click to Play again!", width/2,3*height/5);
  textSize(75);  
  text("YOU WON!", width/2,height/2);
}

 void startscreen (){
  
  fill(color(#5979AA));
  strokeWeight(10);
  stroke(#C10208);
  textSize(150);
  textAlign(CENTER);
  textFont (font);
  text("Click to Play!", width/2,3*height/5);
  textSize(50);  
  text("The Amazingly Complex\nShooter Game", width/2,height/2-100);
}
  
 void endscreen(){  
  
  fill(color(#5979AA));
  strokeWeight(10);
  stroke(#C10208);
  textSize(200);
  textAlign(CENTER);
  textFont (font);
  text("Click to play again!", width/2,3*height/4-75);
  textSize(55);  
  text("Your score was", width/2,height/2-75);
  textSize(55);
  text( score, width/2, height/2+25 );  
  //noLoop();
}

