

float x,a,b,c;

void setup()
{
    size (400,400, P3D);
    noStroke();
    
}

void draw()
{
    lights();
    fill(100,80,60,200);
    x = 10;
    while(x <=width)
    {
        fill(100,80,60,200);
        pushMatrix();
        translate(x,200,0);
        box(10,200,300);
        popMatrix();
        
        a = random(0,width);
        b = random(0,height);
        c = random(-400,50);
        fill(100,20,20,200);
        pushMatrix();
        translate(a, b, c);
        sphere(10);
        popMatrix();
        x = x + 30;
        
    }

}

