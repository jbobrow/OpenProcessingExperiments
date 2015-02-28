
int timer = 0; 
 
void setup() {   
    size(300, 300);
    colorMode(HSB, 360, 100, 100);
}
void draw() { 
    timer += 1;
    println(timer);
    background(random(255));
    
    if (timer >= 300)
    {
        timer = 0;
    }
    if (timer != 0 && timer < 100) 
    {
        scale(2);
        fill(random(255),random(255),random(255));
        triangle(random(1,300), random(1,300), random(1,300), random(1,300), random(1,300), random(1,300));
    }
    else if (timer >= 100 && timer < 200) 
    {
        fill(random(255),random(255),random(255));
        rect(random(1,300), random(1,300), random(1,300), random(1,300));
    }
    else if (timer >= 200 && timer < 300) 
    {
        fill(random(255),random(255),random(255));
        ellipse(random(1,300), random(1,300), random(1,300), random(1,300));
    }
        
}
 
