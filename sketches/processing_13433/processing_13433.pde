
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
    for(int y=00; y<500;){
        line(0,y,y,500);
        y=y+10;
    }
          
    for(int x=0; x<500;){
        line(x,0,500,x);
        x=x+20;
    }
        
    for(int i=0; i<30; i++){
        noFill();
        ellipse(width/2, height/2, 10*i, 10*i);
    }

}
        
