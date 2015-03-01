
void setup() 
{
    size(400, 400); 
    myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
    myMarioImageMirrow = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario-flip.png");
    pouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
    back = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
    x = 80;
    y = 325; 
    v = 40
}

void draw() 
{
//  x = x+v;
    if (x > 320)
    {
        x = 320;
    }
    if (x < 40)
    {
        x = 40;
    }
    if (y < 40)
    {
        y = 40;
    }
    if (y > 320)
    {
        y = 320;
    }
    
    image(back, 0, 0);
    image(myMarioImage, x, y);
    image(pouncer, 160, 200);
    image(pouncer, 280, 280);
    
    if (x == 160){
         if (y == 200){
             println("Kollision");
            }
        }
}

void keyPressed()
{
/*    if (key == 'd')
        x = x + v;
    if (key == 'a')
        x = x - v;
    if (key == 'w')
        y = y - v;
    if (key == 's')
        y = y + v;
        
    if (key == 'j')
        x = x + v;
    if (key == 'g')
        x = x - v;
    if (key == 'z')
        y = y - v;
    if (key == 'h')
        y = y + v;
*/    
    if (key == CODED) {
        if (keyCode == RIGHT) {
          x = x + v;  
        } else if (keyCode == LEFT) {
          x = x - v;
        } else if (keyCode == UP) {
          y = y - v;
        } else if (keyCode == DOWN) {
          y = y + v;
        }
    }
}
