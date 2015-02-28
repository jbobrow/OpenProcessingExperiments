
//global variables
boolean grow=true;//to determine wheter heart is now growing or getting smaller
boolean auto=false;//to determine whether heart should beat gradually by mouse input or automatically
boolean turn=true;// to determine whether heart is now straight or upside down.

int move=0;//to move the diagram across the screen
int beats=0;//heartbeat count

Heart mainHeart;

void setup()
{
  size(600,600);
  background(0);
  smooth();
  mainHeart = new Heart(color(255, 0, 0), 300, 300, 1);
}

 
void drawDiagram()
{
  stroke(255);
  strokeWeight(5);
  noFill();
  
  int level=height/2;
 
  line(move, level, 15+move, level-25);
  line(15+move, level-25, 30+move, level+30);
  line(30+move, level+30, 70+move ,level-150);
  line(70+move ,level-150, 120+move, level+120);
  line(120+move, level+120, 160+move, level);
  
  line(0, level, move, level);
  line(160+move, level, width, level);
} 

void moveDiagram()
{  
  
   if(move==width+160){
    move=-160;
  }
  else{
    move+=5;   //you can define speed
    background(0);
  }
  
}
 
void draw()
{
    moveDiagram();
    drawDiagram();
    
  //display heartbeat count 
    textSize(25);
    text("Heartbeats: "+beats, 400, 590);  
    
    //control the heartbeat by clicking
    if (mousePressed || auto){      
      if(grow==true){
        mainHeart.mult++;
      }
      if(grow==false){
        mainHeart.mult--;
      }
      if(mainHeart.mult>40){
        grow = false;
      }
      if(mainHeart.mult<1){
        grow = true;
        beats++;// this is to count heartbeats
      }
    }
   
  
 //change heart's color after every heartbeat 
   if(mainHeart.mult % 100 == 0 ){
        mainHeart.paint = color(255, random(150), random(150)); 
        //This narrows color choice to red
    }

//drawing the heart considering whether it's straight or upside down
    if (turn){
      mainHeart.drawHeart();
    }
    else{
      translate(width, height);
      rotate(PI);
      mainHeart.drawHeart();
    }
    
}

//controlling keboard input
void keyPressed() {
  
    if (key == CODED) {
      if ((keyCode == UP && turn) || (keyCode == DOWN && !turn)) {
        mainHeart.y-=25;
      } 
      else if ((keyCode == DOWN && turn) || (keyCode == UP && !turn)) {
        mainHeart.y+=25;
      }
       else if ((keyCode == RIGHT && turn) || (keyCode == LEFT && !turn)){
          mainHeart.x+=25;
       }
      else if ((keyCode == LEFT && turn) || (keyCode == RIGHT && !turn)){
          mainHeart.x-=25;
      } 
    } 
    
    if(key == ENTER){
      if(auto){
        auto=false;
      }
      else{
        auto=true;
      }
    }
    
    if(key == 'T' || key == 't'){
      if(turn){
        turn=false;
      }
      else{
        turn=true;
      }
    }
}

//A class defining our heart.
class Heart{
  
    color paint; //heart's color
    //heart's coordinates:
    int x;
    int y;
    int mult; //changing heart's size
    
    Heart(color paintTmp, int xTmp, int yTmp, int multTmp)
    {
     paint = paintTmp;
     x = xTmp;
     y = yTmp;
     mult = multTmp;
    }
  
  //drawing a heart's shape including an option to make it bigger 
    void drawHeart()
    {
      int anchor1=5;
      int anchor2=10;
      int anchor3=2;
      int anchor4=6;
      
      noStroke();
      fill(paint);
      beginShape();
      vertex(x, y);
      bezierVertex(x, y-(mult*anchor1), x+(mult*anchor2), y-(mult*anchor3), x, y+(mult*anchor4));
      vertex(x, y);
      bezierVertex(x, y-(mult*anchor1), x-(mult*anchor2), y-(mult*anchor3), x, y+(mult*anchor4));
      endShape();
    }
}

