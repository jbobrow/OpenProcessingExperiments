
int nMax, lB, lR, x, y, xR, yR;
float t, rT, aR;

void setup() {  //setup function called initially, only once
    size(800, 600);
    background(255);  //set background white
    smooth();
  
    noFill();
    strokeCap(PROJECT);
  
    nMax = 6; //Number of recursions
    lB = 75; //Branch length
    lR = 100; //Root length
    rT = 1500; //Time per cycle
  
    xR = width/2; //x position of Root
    yR = height-50; //y position of Root
}

void draw() {
    background(255);
    
    t = millis()/rT; //Time
    aR = TWO_PI-HALF_PI+sin(t)/30; //Angle of root
    
    x = (int)(xR + lR * cos(aR));
    y = (int)(yR + lR * sin(aR));
    
    stroke(0);
    strokeWeight(3);
    
    //Draw Root
    line(xR, height, xR, yR); 
    line(xR, yR, x, y);
    
    recLine(x, y, nMax, aR);
}

void recLine(int x, int y, int n, float a) {
    if (n == 0) return;
    float aO = 0.2+0.15*((sin(t)+1)/2);

    float aL = a-aO; //Angle of left branch
    float aR = a+aO; //Angle of right branch
   
    int x2L = (int)(x + lB * cos(aL)); //x position of left branch
    int y2L = (int)(y + lB * sin(aL)); //y position of left branch
    
    int x2R = (int)(x + lB * cos(aR)); //x position of right branch
    int y2R = (int)(y + lB * sin(aR)); //y position of right branch
    
    strokeWeight(n/3);
    
    line(x, y, x2L, y2L); //Draw left branch
    line(x, y, x2R, y2R); //Draw right branch
    
    n--;
    
    recLine(x2L, y2L, n, aL);
    recLine(x2R, y2R, n, aR);
}
