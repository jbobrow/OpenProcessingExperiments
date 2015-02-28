
void setup() 
{
//setup function called initially, only once
    size(300,250);
    background(255);  
//set background white
    noFill();
    strokeWeight(5)
}

void draw()
{
//draw function loops
    stroke(0,0,255);
    ellipse(100,100,50,50);
    
    stroke(0,0,0);
    ellipse(150,100,50,50);
    
    stroke(255,0,0);
    ellipse(200,100,50,50);
    
    stroke(255,255,0);
    ellipse(125,125,50,50)
    
    stroke(0,255,0);
    ellipse(175,125,50,50);
}
