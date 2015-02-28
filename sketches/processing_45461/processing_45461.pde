
void setup()
{
    size(500, 500);
    background(0);
    float r = random(1, 500);

}

void draw()
{
    float r = random(200, 300);
    fill(100, 100, 100, 100);
    
    fill(0);
    
    strokeWeight(10);
    stroke(300, 0, 0);
    line(1, 250, mouseX, mouseY);
    
    line(500, 250, mouseX, mouseY);
   
    strokeWeight(7);
    stroke(300, 100, 0);
    line(1, 250, mouseX, mouseY);
    
    line(500, 250, mouseX, mouseY);
   
    strokeWeight(5);
    stroke(300, 300, 0);
    line(1, 250, mouseX, mouseY);
    
    line(500, 250, mouseX, mouseY);
    
    strokeWeight(3);
    stroke(300, 300, 300);
    line(1, 250, mouseX, mouseY);
   
    
    line(500, 250, mouseX, mouseY);
    noStroke();
    fill(random(1, 100), random(1, 500), 200, 50);
    rect(random(1, 500), random(1, 500), random(50-200), random(50-200));
    rect(random(1, 500), random(1, 500), random(50-200), random(50-200));
    rect(random(1, 500), random(1, 500), random(50-200), random(50-200));
    rect(random(100, 200), random(100, 200), random(50-200), random(50-200));
    rect(random(400, 500), random(400, 500), random(50-200), random(50-200));
    ellipse(250, 250, r, r);
    
    fill(0, 10);
    rect(0, 0, 500, 500);
    
 

}


