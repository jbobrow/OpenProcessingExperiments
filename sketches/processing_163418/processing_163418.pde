
int xAxis = 30;
int yAxis = 30;

void setup() {  //setup function called initially, only once
    size(600, 600);
    background(0);
}

void draw() { //draw function loops 

noStroke();                        //removes the outline
fill(255);                         //white circle
ellipse(xAxis, yAxis, 30, 30);     //circle itself
}


void keyPressed () {
    
    if (key == CODED) {
        if (keyCode == UP) {          
            yAxis -= 10; }            //when up is pressed, the circle goes upwards by 10.
   else if (keyCode == DOWN) {
            yAxis += 10; }            //when down is pressed, the circle goes downwards by 10.
   else if (keyCode == LEFT) {
            xAxis -= 10; }            //when left is pressed, the circle goes leftwards by 10.
   else if (keyCode == RIGHT) {
            xAxis += 10; }            //when right is pressed, the circle goes rightwards by 10.

    else {
    xAxis = 0;
    yAxis = 0;
    }
    }
    }
    

