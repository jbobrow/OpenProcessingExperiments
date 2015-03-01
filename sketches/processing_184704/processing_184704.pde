


int posilr = 100;
int posiud = 100;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  
    
}

void draw() {  //draw function loops 

}

void keyPressed() {
    background();

    if (keyCode == UP) {
        posiud-=3;
    } 
    else if (keyCode == DOWN) {
        posiud+=3;
    } 
    else if(keyCode == RIGHT){
        posilr+=3;
    }
    else if (keyCode == LEFT) {
        posilr-=3;
    }

  fill(128);
  smooth();
  rect(posilr, posiud, 70,100);
  
}
