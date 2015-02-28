
/* Flow
 * Inspired from the internet "Flow" game.
 *
 * By Charles Carr
*/

int WIDTH = screen.width;
int HEIGHT = screen.height;

Fish fish = new Fish(WIDTH/2,HEIGHT/2,5,0,0);

ArrayList p = new ArrayList();

int phase = 0;
int hold = 0;

void setup()
{
    size(WIDTH,HEIGHT);
    textSize(30);
    textAlign(CENTER,CENTER);
}

void draw()
{
    background(0,100,160,200);
    
    if (phase == 0)
    {
        fish.display(pmouseX,pmouseY);
        
        boolean superbreak = false;
        
        for (int i = 0; i < p.size(); i++)
        {
            Pellet aPellet = (Pellet) p.get(i);
            aPellet.display();
            
            for (int j = 0; j < fish.getSize()-1; j++)
            {
                if (aPellet.getX() > fish.getXAtIndex(j)-fish.getSize() &&
                    aPellet.getX() < fish.getXAtIndex(j)+fish.getSize() &&
                    aPellet.getY() > fish.getYAtIndex(j)-fish.getSize() &&
                    aPellet.getY() < fish.getYAtIndex(j)+fish.getSize())
                {
                    fish.setSize(fish.getSize()-1);
                    p.remove(i);
                    superbreak = true;
                    break;
                }
            }
            
            if (superbreak == true)
            {
                superbreak = false;
                break;
            }
            
            if (aPellet.getX() > fish.getXAtIndex(fish.getSize()-1)-fish.getSize() &&
                aPellet.getX() < fish.getXAtIndex(fish.getSize()-1)+fish.getSize() &&
                aPellet.getY() > fish.getYAtIndex(fish.getSize()-1)-fish.getSize() &&
                aPellet.getY() < fish.getYAtIndex(fish.getSize()-1)+fish.getSize())
            {
                fish.setSize(fish.getSize()+1);
                p.remove(i);
                break;
            }
            
            if (aPellet.getX() > WIDTH || aPellet.getX() < 0 || aPellet.getY() > HEIGHT || aPellet.getY() < 0)
            {
                p.remove(i);
            }
        }
        
        int n = floor(random(200 * (1 / (float) fish.getSize())));
        if (n == 1)
        {
            p.add(new Pellet(random(WIDTH),random(HEIGHT),3,random(TWO_PI)));
        }
        
        hold = (int) (millis() / 1000);
        fill(255);
        text(hold,WIDTH/2,100);
        
        if (fish.getSize() < 3)
        {
            hold = millis();
            phase = 1;
        }
    }
    else if (phase == 1)
    {
        fill(255);
        text("Your Score is: " + (hold/1000),WIDTH/2,HEIGHT/2);
    }
}
