
int yPos = 0;

void setup() { //setup funtion called intially, only once
    size(400,400);
    smooth(0);
    background(126);
    }
    
    void draw() { //draw funtion loops
    yPos = mouseY;
    if(yPos < 150 ) {
    background(0);
    }
   else if (yPos >= 150 && yPos <=250){
   background(0,0,255);
   }
    else{
    background(255);
    }
    }
