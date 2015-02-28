
int x=0;
int y=0;
PImage b;
float xr;
float yr;
float redValue;
float greenValue;
float blueValue;
float imgSize;


void setup(){
    // SET STAGE
    size(500,500);
    b = loadImage("catSprite.png");
    frameRate(20);
    background(0,255,50);
    // REGISTER VARIABLES
}


void draw(){

        if (mousePressed == true) {
      
              xr = abs(random(0, 500));
              yr = abs(random(0, 500));
              redValue = abs(random(0, 255));
              greenValue = abs(random(0, 255));
              blueValue = abs(random(0, 255));
              imgSize = abs(random(30, 100));
        
              x=x+1; 
              y=y+1; 
       
     
               if(x>500){x=0;}
               if(y>500){y=0;}
       
              tint(redValue, greenValue, blueValue);
              image(b, mouseX, mouseY, imgSize, imgSize);
        }
        
        if (keyPressed == true) {        
            background(0,255,50);
        }

}



