
//learning processing example
float angle = 0;

void setup()
{
    size(800, 200,P3D);
    fill(0);
}

void draw()
{
    background(255);
    
    float yangle = angle;
    for(int i = 0; i < 20; i ++)
    {
        
        translate(i * 10, height/2 + cos(yangle) * height/2); 
        sphere(10);
        yangle += 0.2;
    }
    
    angle += 0.02;
}
