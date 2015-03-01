
class floater
{
    PVector pos;
    
    void update(float t)
    {
        float nz = noise(pos.x/100, pos.y/100, t/100)*6;
        
        pos.x+= Math.cos(nz);
        pos.y+= Math.sin(nz);
    
        if(pos.x < 0)
        {
            pos.x = width;
        }
        
        if(pos.x > width)
        {
            pos.x = 0;
        }
        
        if(pos.y < 0)
        {
            pos.y = height;
        }
        
        if(pos.y > height)
        {
            pos.y = 0;
        }
    
        pushMatrix();
        translate(pos.x, pos.y);
        stroke(31, cos((pos.x-t)/100)*256, nz*41);
        fill(31, cos((pos.x-t)/100)*256, nz*41);
        ellipse(0,0,30,30);
        popMatrix();
    }
    
    public floater(float x, float y)
    {
        pos = new PVector(x, y);
    }
}



float t = 0;

var floaters = Array();


void setup()
{
    for(var i = 0; i < 6; i++)
    {
        floaters.push(new floater(random(width*2.2), random(height*3.5)));
    }
  size(600,600);
}

void draw()
{
    background(0);
    
    
    for(var i = 0; i < width; i += 40)
    {
        for(var j = 0; j < height; j+=40)
        {
            pushMatrix();
            
            translate(i, j);
            
            float noi = noise(i/100, j/100, t/100)*6;
            
            rotate(noi);
            stroke(32,sin((i-t)/100)*256,noi*41);
            strokeWeight(12);
            line(0,0,10,0);
            popMatrix();
        }
    }
    
    
    for(var fl : floaters)
    {
        fl.update(t);
    }
    
    t++;
}
