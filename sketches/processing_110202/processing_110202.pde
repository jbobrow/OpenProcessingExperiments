
void setup() 
{
    size(450, 450);
    background(150);
    stroke(0, 50);
    fill(255, 200);
    float xstart = random(10);
    float ynoise = random(10);
    translate(width/2, height/2);
    
    for (float y = -(height/5); y <= (height/5); y+=1) 
    {
        ynoise += 0.02;
        float xnoise = xstart;
        
        for (float x = -(width/5); x <= (width/5); x+=1) 
        {
            xnoise += 0.02;
            drawPoint(x, y, noise(xnoise, ynoise));
        }
        
    } 
}

void drawPoint(float x, float y, float noiseFactor) 
{
    pushMatrix();
    translate(x * noiseFactor * 4, y * noiseFactor * 4);
    float edgeSize = noiseFactor * 26;
    ellipse(0, 0, edgeSize, edgeSize);
    popMatrix();
}
