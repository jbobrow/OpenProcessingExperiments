
size(600, 600);
background(255);
colorMode(HSB, 360, 100, 100);
noStroke();
rectMode(CENTER);

float angolo = 0;

for(int y=0; y<=height; y+=40)
{
    for(int x=0; x<width; x+=20)
    {
        angolo += 0.20;
        resetMatrix();
        translate(x, y);
        rotate(angolo);
        fill(random(21, 360), random(0, 50), random(90, 100),  255);
        ellipse(0, 0, 40, 13);
        
    }
}



