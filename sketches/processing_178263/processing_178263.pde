
int lines;


void setup() {  //setup function called initially, only once
    size(250, 250);
    background(255);  //set background white
    fill(0);
    colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
    lines = 4;
}

void draw() {  //draw function loops 
    
    for(int i = 0; i < lines; i++) {
        int frac = pow(2,i);
        for(int j = 0; j < frac; j++) {
            rect(pow(2/3*width,j),50*i,width*pow(1/3,i),10);
        }
        
    }
    
    
}
