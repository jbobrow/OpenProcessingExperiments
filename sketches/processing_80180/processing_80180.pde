

void setup() {
    size(300, 300);
}
 
void draw() {
    int s = second()*4;       //Values from 0 - 59
    int m = minute()*4;       //Values from 0 - 59
    int h = hour()*4;         //Values from 0 - 23
    float deg = 180;            //Value for rotating
    float rad = radians(deg);   //Value in degrees
    float distance = 34.8;      //Distance used in math
     
    background(65);
     
    //stroke(255);
    textAlign(CENTER);
    text("Art Clock", width/2, 25);
  
    //Bottom text
    text("Hours", 58, 293);
    text("Minutes", 143, 293);
    text("Seconds", 231, 293);
     
    //Graphs
    noStroke();
    translate(150, 275);
    rotate(rad);
    
    fill(255, 255, 0);
    rect(-100, 0, 200, 240);  
    
    fill(20,180,80);      //Hour Block
    rect(0, 0, 100, m);    
    fill(245,99,74);      //Minute Block
    triangle(0, m, 100, h, 100, m);
     
    fill(30,30,230); 
    triangle(0, 0, 0, m, -100, 0);
    fill(237,48,60);      //Second Block
    triangle(-100, 0, -100, s, 0, m);
}



