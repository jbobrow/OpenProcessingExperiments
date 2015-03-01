
int xAxis = 30;
int yAxis = 30;

void setup() {  //setup function called initially, only once
  size(800, 800);

}

void draw() { //draw function loops 
background(0);
fill(0);
ellipse(xAxis, yAxis, 30, 30);


void keyPressed (){
    
    if (key == CODED) {
        if (keyCode == UP) {
            yAxis -= 5; }
   else if (keyCode == DOWN) {
            yAxis += 5; }
   else if (keyCode == LEFT) {
            xAxis -= 5; }
   else if (keyCode == RIGHT) {
            xAxis += 5; }               
}
}
}

    else {
    xAxis = 30;
    yAxis = 30;
    }
    
    
//Coded everything right, however it does not display on the canvas for whatever reason.
