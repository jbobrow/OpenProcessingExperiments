
    float a = 0;
    float r = 0;
    void setup()
    {
        size(500, 500, P3D);
        
    }
    
    void draw(){
        background(60);
        
        translate(mouseX, mouseY, map(noise(a), 0, 1, -400, 300));
        rotateY(r);

        box(100);
        a = (float) (a + 0.01);
        r = (float) (r + 0.05);
        
        //box(120, 160, 50);
        //noFill();
    }
