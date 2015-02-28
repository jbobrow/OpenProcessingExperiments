
void setup()
{
    size(400, 400);
    background(180, 0, 180);
    posx = width/2;
    posy = height/2;
    frameRate(20);
    println("GO!");
    
}
    int masterCounter = 15;
    int helperCounter = 20;
    int diameter = 80;
    float posx;
    float posy;
   
 
    
void draw()
{
    if (helperCounter <= 0) {
    helperCounter = 20;
    masterCounter--;
    masterCounter >= 0;
   
    println(masterCounter);

    }
     
    helperCounter--;
     
    if (masterCounter <= 0) {
    println("GAME OVER");
    noLoop();
    }
     
    posx = random(20, 380);
    posy = random(20, 380);
     
    fill (255);
    ellipse(posx, posy, diameter, diameter);
    
    if (mousePressed == true) {
    fill (180, 0, 180);
    ellipse(mouseX, mouseY, diameter, diameter);
    noStroke();
    }

}
       


  

 
