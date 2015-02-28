
//set global variables
var rectWidth = 5;

void setup() {  //setup function called initially, only once
 size(600,800);
 
}

void draw() {  //draw function loops 
    fill(255, 0, 0)
    rectMode(CENTER);
    rect(300, 400, rectWidth, rectWidth);
    rectWidth++;
}
