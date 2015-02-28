
/*
Love / Processing Studies / Code 01
Author: Rafael
2011
*/

//Heart Graphic
var heart = createGraphics(80, 80);

//Random Values
float r;
float g;
float b;

void setUp()
{
    background(0, 0);
    noStroke();
}

///////////////////////////////////////
void draw() 
{
    r = random(255);
    g = random(55);
    b = random(55);
    
    background(color(r, g, b));
                
    drawHeart();
    image(heart, 0, ((r/50)+24)); 
}

//Heart Drawing method
void drawHeart()
{
    //Shape Config
    heart.background(0, 0);
    heart.stroke(0);
    heart.fill(0);
    
    heart.beginShape();
    heart.vertex(50, 15);
    heart.bezierVertex(50, -5, 90, 5, 50, 40); //You (Right)
    heart.vertex(50, 15);
    heart.bezierVertex(50, -5, 10, 5, 50, 40); //Me (Left)
    heart.endShape();
}
                                                                                    
