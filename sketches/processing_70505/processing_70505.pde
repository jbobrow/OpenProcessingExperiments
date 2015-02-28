
/*
  Stages of Fry that are involved
- Acquire:  acquire the data, in this case the system clock.
- Represent: represent the data (time) using 3 different graphs.
- Refine: used color to refine the representation.
*/

void setup() {
    size(330, 300);
}

void draw() {
    int s = second()*3.5;       //Values from 0 - 59
    int m = minute()*3.5;       //Values from 0 - 59
    int h = hour()*3.5;         //Values from 0 - 23
    float deg = 180;            //Value for rotating
    float rad = radians(deg);   //Value in degrees 
    double distance = 34.8;     //Distance used in math
    
    background(51);
    noStroke();
    
    fill(255);
    textAlign(CENTER);
    text("Graph Clock", width/2, 35);
    
    //Background panels
    fill(40);
    rect(0, 0, 25, 300);        //Left side
    rect(305, 0, 25, 300);      //Right side
    rect(0, 275, 330, 25);      //Bottom
    
    //Left side numbers 
    fill(255);      
    textAlign(RIGHT);
    for (int i=0; i<=6; i++){
        text(i*10+" -", 25, 278-distance*i);
    }
    
    //Right side numbers
    textAlign(LEFT);
    for (int i=0; i<=6; i++){
        text("- "+i*10, 305, 278-distance*i);
    }
    
    //Horizontal lines
    stroke(70);
    for (int i=0; i<=5; i++){
        line(25, 65.5+distance*i, 305, 65.5+distance*i);
    }
    stroke(63);
    for (int i=0.5; i<=5.5; i++){
        line(25, 65.5+distance*i, 305, 65.5+distance*i);
    }
    
    //Bottom text
    text("Hours", 58, 293);
    text("Minutes", 143, 293);
    text("Seconds", 231, 293);
    
    //Graphs
    noStroke();
    translate(100, 275);
    rotate(rad);
    
    fill(121,189,154);
    rect(0, 0, 50, h);      //Hour
    
    fill(245,99,74);
    rect(-90, 0, 50, m);    //Minutes
    
    fill(237,48,60);
    rect(-180, 0, 50, s);   //Seconds
}
