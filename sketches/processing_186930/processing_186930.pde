
int planets;
int suns;
bool clicking;
int lastSuns;
int lastPlanets;

void setup() 
{
    size(250, 250);
    background(0, 0, 0);
    planets = 0;
    suns = 0;
    clicking = false;
    lastSuns = 0;
    lastPlanets = 0;
}

void draw() 
{
    fill(0, 0, 0);
    rect(0, 0, 250, 30);
    fill(0, 122, 255);
    textSize(12);
    text("click to birth a sun.", 75, 20);
    
    if(mousePressed == true && clicking == false) 
    {
        suns += 1;
        planets += random(0, 20);
    }
    
    // draw universe
    if(lastSuns < suns)
    {
        // draw sun
        fill(255, random(200, 255), random(200, 255));
        sunX = random(0, 250);
        sunY = random(0, 250);
        ellipse(sunX, sunY, random(3, 5), random(3, 5));
        
        for (int planet = 0; planet < (planets - lastPlanets); planet++)
        {
            fill(random(100, 180), random(100, 180), random(100, 180));
            ellipse(random(sunX - 15, sunX + 15), random(sunY - 15, sunY + 15), random(1, 4), random(1, 4));
        }
    }

    // store whether the mouse is being pressed
    clicking = mousePressed;
    lastSuns = suns;
    lastPlanets = planets;
}
