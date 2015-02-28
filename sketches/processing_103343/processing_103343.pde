
// Credit: Ren Ervin Bettendorf 

/* SCREENSAVERS FER DAYS BROSKIES */
void setup(){
  size(600,500);  //sizes canvas
  background(0); //colors canvas
  frameRate(60); //names how manny of the balls frames a second can be seen
}

int dx = 2;
int dy = 3;

int x = 50; //creates ellipse size
int y = 50; //creates ellipse size

void draw(){
    fill(255); //colors ball
    ellipse(x,y,25,25);
  
    x = x + dx;
    y = y + dy;
    
    if ( x< 0 || x > 475){ //creates bounce angle
       dx = -1 * dx;
    }
    
    if ( y < 0 || y > 475){ //creates bounce angle
       dy = -1 * dy;  
    }

if (mousePressed == true){
  x = mouseX + dx;
  y = mouseY + dy;

  size(600,500);  //sizes canvas
  background(0); //colors canvas
  frameRate(60); //names how manny of the balls frames a second can be seen

  
    x = x + dx;
    y = y + dy;
    

    
    if ( x< 0 || x > 475){ //creates bounce angle
       dx = -1 * dx;
    }
    
    if ( y < 0 || y > 475){ //creates bounce angle
       dy = -1 * dy;  


    }

}
}
