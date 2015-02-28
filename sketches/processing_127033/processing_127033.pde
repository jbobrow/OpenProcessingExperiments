
//Name: Daniel Zegers
//Date:7-01-2014
//Project: Traffic light
void setup() {  //setup function called initially, only once
  size(250, 250);

}

void draw() {  //draw function loops 
    
    rect (0,0,250,250);
    fill(255,0,0); //Red
    
    ellipse(125,50,50,50);
    fill(255,255,0); //Yellow
    
    
    ellipse(125,125,50,50);
    fill(0,255,0); //Green
    
    ellipse(125,200,50,50);
    fill(0,0,0) //Black
}
