
boolean loopEntered = false;
int loseCount = 0;
int counter;
int xPosRevolve;
float sinCounter;
int playerXBoundLeft;
int playerXBoundRight;
int playerYBoundBottom;
int playerYBoundTop;

int boundRevolveXRight;
int boundRevolveXLeft;

boolean playerLose = false;


void setup() {  //setup function called initially, only once
size(863, 100);
colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
counter = 0;
//sinCounter is used in xPosRevolve
sinCounter = 0;
    ellipseMode(CENTER);
}

void draw() {  //draw function loops 
    background(145,100,000);  //set background color, over and over again
    counter++;
    noStroke();
    fill(random(255),100,255,255);
    
    text("loseCount: " + loseCount, 0, 30);    
  
   if (playerLose){
    fill(255);
    textSize(32);
    text("You Lose", width/2, 30); 
    }
    
    //Richard's sin motion yay    
    //Advance the sinCounter to infinity; since sin is periodic function, & min/max are 1
    sinCounter = sinCounter + (PI/168);
    
    //xPosRevolve should be MAX-VALUE * alternating sin value. min:-MAX-VALUE, max: MAX-VALUE
    xPosRevolve = (width/2)+((width/2)*sin(sinCounter));

    //enable cute circle clicking
    drawCircles();
    
    
    //update boundaries for revolve
    boundRevolveXRight = xPosRevolve + 80; 
    boundRevolveXLeft = xPosRevolve - 40; 
        
    //flashy circle thingy
    ellipse(xPosRevolve, height/2, 80*sin(sinCounter*8), 80*sin(sinCounter*8));
    
    color(255,255,255);
    ellipse(xPosRevolve, height/2 , 80, 80);
}

void drawCircles(){
//Kanye says: BOUND! -- log the coordinates for comparison
//x boundaries
playerXBoundRight = mouseX + 20;
playerXBoundLeft = mouseX + 20;
//y Boundaries
playerYBoundTop = mouseY - 20;
playerYBoundBottom = mouseY - 20;

if (mousePressed == true) { //spawn a cute-ass ellipse
    ellipse(mouseX, mouseY, 20, 20);
      
       if (
(playerXBoundLeft <= boundRevolveXRight) && (playerXBoundRight >= boundRevolveXLeft))       
            {playerLose = true;
            
            if (!loopEntered) {
            loseCount += 1;
            loopEntered = true;}
            }    
            else {playerLose = false;
            loopEntered = false;}
}
  }
