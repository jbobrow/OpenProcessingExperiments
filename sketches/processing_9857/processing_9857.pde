
void arm2 ( float x, float y)
    {  
    pushMatrix();
    translate(x,y);
    fill (0);  
    triangle (0,0,170,10,170,-40);
    triangle (0,0,20,40,40,-5);
    
    popMatrix();
    }

