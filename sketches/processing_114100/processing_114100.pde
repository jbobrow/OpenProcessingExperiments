
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  //frameRate(10);
  //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  //counter = 0;
}

void doit(float xofs){

    background(255);  //set background white

    int px = -1;
    int py = -1;
    float dx = (TWO_PI / 250) * 10;
    float xpos = xofs;
    float amp = random(200)-100;
    for ( int x = 0; x < 500;x+=10 ){
    
        xpos += dx;
        int y = sin ( xpos ) * amp;
        y+= 200;
        //int y = (sin ( (x+xofs) * 0.01745329222222 ) * 100)+200;
        
        if ( px != -1 ){
            line(px,py,x,y);
        }
        
        px = x;
        py = y;
        
    }
    

}


boolean done = false;
float ofs = 0;
void draw() {  //draw function loops 
    
  if ( done == false ){
//      done = true;
      doit(ofs+=1);
  }
  
  
}
