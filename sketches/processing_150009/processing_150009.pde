
void setup() {  //setup function called initially, only once
    size(200, 200);
//    background(255);  //set background white
//    colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
//    counter = 0;
}

void draw() 
{  //draw function loops 
    background(0);
    noStroke();
    fill(0,0,255);
    rect(0,0,100,200);
    
    fill(255,0,0,255); // 100% opacity with  last 255
    rect(0,0,200,40);
    
    fill(255,0,0,191); // 75% opacity 
    rect(0,50,200,40);
    
    fill(255,0,0,127); // 50% opacity 
    rect(0,100,200,40);
    
    fill(255,0,0,63); // 25% opacity 
    rect(0,150,200,40);
}
