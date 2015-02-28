
boolean shoot = false;
int sphereDiameter = 20;
boolean stopgame = false;
int counter = 0;
float seconds = 2; //number of seconds before can exit fail screen.
int tmax = round(30*seconds); //frame rate x seconds
int score;
PFont font;
int randx()

  {
    return int(random(600));
  }
  
  int[] sphereXCoords = { randx(), randx(), randx(), randx(), randx() };
  int[] sphereYCoords = { 0, 0, 0, 0, 0};
  

void setup(){
    size(600,685);
    score = 0;
    font = loadFont( "LiberationSans-36.vlw" );
}
  
void draw(){ 
   background(#75A0CE);
   if (!stopgame) {
     DrawGame();
   }
   else {
     endscreen();
     counter ++;
     
   }
   fill(#5979AA);
   stroke(0);
   textAlign( CENTER );
   textFont( font );
   text( score, width/7, height-45 );
   noStroke();
   noFill();     
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
     
   //if (mouseX>=0 || mouseY>=0){
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
}
 
 void mousePressed(){
    if (!stopgame) {
      shoot = true;
    }
    else if (counter >= tmax) {
      //Restart
      stopgame = false;
      score =0;
    }
  }
  
 void sphereDropper(){  
    stroke(#5F507E);
    fill(#9081B2);
    for (int i=0; i<5; i++)
    {
     ellipse(sphereXCoords[i], sphereYCoords[i]++,
              sphereDiameter, sphereDiameter);
    }
  }
  
 void sphereKiller(int shotX){
    boolean hit = false;
    for (int i = 0; i < 5; i++)
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
    if(sphereYCoords[i]==600 && !stopgame)
    {
      stopgame = true;
      counter = 0;
      for (int j=0; j < sphereXCoords.length; j++) {
        sphereXCoords[j] = randx();
        sphereYCoords[j] = 0;        
      }
    }
  }
}
  
void endscreen(){
  fill(color(#5979AA));
  strokeWeight(10);
  stroke(#C10208);
  textSize(200);
  textAlign(CENTER);
  textFont (font);
  text("Click to Play Again", width/2,3*height/5);
  textSize(75);  
  text("FAIL", width/2,height/2);  
  //noLoop();
}

