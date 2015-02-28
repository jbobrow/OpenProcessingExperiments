
//An angles game by T Carrell @KGV School 2013
PFont myFont;
int score=0;
int angle = 90;

void setup() {
  size(600,400);
  myFont = createFont("Verdana",14);
  textFont(myFont);
}

void draw() {
  background(70);
  stroke(70);
  strokeWeight(2);
  ellipse(300,400,600,600);                    //big arc (half circle)
  line(600,399,300,399);                       //line across the bottom
  line(300,400,mouseX,mouseY);                 //line from centre of arc to mouse pointer
  text("Try to guess "+angle+" degrees",10,30);
  text("Score: "+score,520,30);
}

void mousePressed() {                          //when the mouse is pressed...  
    int guess = int(degrees(atan2((mouseY-400),(mouseX-300)))*-1); //calculate the angle
    println(guess);                            //print out the users angle
    
    if(guess > angle-3 && guess < angle+3) {  //if the angle is close to the target angle      
      score = score+1;                        //increase the score
    }
    
    angle = int(random(0,180));               //create a new random target angle
}
  


