
int counter;
int planets;
int suns;
int followers;
int energy;
bool clicking;
bool gameOver;
int lastSuns;
int lastPlanets;

void setup() 
{
    size(250, 250);
    background(0, 0, 0);
    counter = 0;
    planets = 50;
    suns = 1;
    life = 0;
    energy = 1000000;
    clicking = false;
    gameOver = false;
    lastSuns = 0;
    lastPlanets = 0;
}

void draw() 
{
    fill(0, 0, 0);
    rect(0, 0, 250, 200);
    
    if (!gameOver)
    {
        fill(177, 177, 177);
        textSize(8);
        text("You need followers to survive.", 10, 20);
        text("Followers need planets.", 10, 30);
        text("Planets need suns", 10, 40);
        text("Suns need energy", 10, 50);
        text("Suns will collapse", 10, 60);
        
        fill(255, 255, 255);
        textSize(14);
        text("Sun(s): " + int(suns), 120, 100);
        text("Planet(s): " + int(planets), 120, 130);
        text("Follower(s): " + int(followers), 120, 160);
        text("Energy: " + int(energy), 120, 190);
        
        fill(0, 122, 255);
        text("Birth a sun", 10, 100);
        text("Form planets", 10, 130);
        text("Create life", 10, 160);
    
        // debug text
        text("", 10, 50);
        
        if(mousePressed == true && clicking == false) 
        {
            if (mouseY > 90 && mouseY < 110)
            {
                if (energy > 100000)
                {
                    suns += 1;
                    planets += random(0, 10);
                    energy -= 100000;
                }
                
                else
                {
                    energy = 0;
                    gameOver = true;
                }
            }
            
            if (mouseY > 120 && mouseY < 140)
            {
                if (planets < suns * 100)
                {
                    planets += 10;
                    energy -= 10000;
                }
            }
            
            if (mouseY > 150 && mouseY < 170)
            {
                if (followers < planets * 1000)
                {
                    followers += 1000;
                    energy -= 1000;
                }
            }
        }
        
        else 
        {
            if((mouseY > 90 && mouseY < 110)
             || (mouseY > 120 && mouseY < 140)
             || (mouseY > 150 && mouseY < 170))
            {
                cursor(HAND);
            }
            
            else
            {
                cursor(ARROW);
            }
        }
        
        // kill life, planets and suns
        if ((random(0, 10000) > 9999) && suns > 0)
        {
            suns--;
            planets -= int(random(8, 12));
            followers -= int(random(1000, 1200));
        }
        
        if (followers > planets * 1000)
        {
            followers -= int(random(1000, 1200));
        }
        
        energy -= suns;
        followers -= 10;
        energy += followers / 1000;
        
        if (energy < 0)
        {
            gameOver = true;
        }
        
        if (suns < 0)
        {
            suns = 0;
        }
        
        if (planets < 0)
        {
            planets = 0;
        }
        
        if (followers < 0)
        {
            followers = 0;
        }
        
        // draw universe
        if(lastSuns < suns)
        {
            // draw sun
            fill(255, random(200, 255), random(200, 255));
            sunX = random(0, 250);
            sunY = random(200, 250);
            ellipse(sunX, sunY, 3, 3);
            
            for (int planet = 0; planet < (planets - lastPlanets); planet++)
            {
                fill(random(100, 180), random(100, 180), random(100, 180));
                ellipse(random(sunX - 10, sunX + 10), random(sunY - 10, sunY + 10), 2, 2);
            }
        }
    
        // store whether the mouse is being pressed
        clicking = mousePressed;
        lastSuns = suns;
        lastPlanets = planets;
    }
    
    else
    {
        fill(200, 0, 0);
        text("You have failed, your universe is no more.", 10, 125);
    }
}
