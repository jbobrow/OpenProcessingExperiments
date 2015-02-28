

void setup() {
    size(300, 300);
}
 
void draw() {
    int s = second()*4;       //(0 - 59)*4 = 0 - 240
    int m = minute()*4;       //Same as above
    int h = hour()*4;         //Same as above
    float deg = 180;          //Value for rotating
    float rad = radians(deg); //Value in degrees
     
    background(65);
           
    fill(255, 255, 0);
    rect(50, 35, 200, 240);  
    
    fill(237,48,60); 
    textAlign(CENTER);
    text("Art Clock", width/2, 20);
  
    //Bottom text
    text("Hours", 58, 293);
    text("Minutes", 143, 293);
    text("Seconds", 231, 293);
     
    text(hour(), 40, 280-h);
    text(minute(), width/2, 270-m);
    text(second(), 260, 280-s);
    
    //Graph
    noStroke();
    translate(150, 275);
    rotate(rad);
    
    fill(20,180,80);       //Hour Block
    rect(0, 0, 100, m);
    triangle(0, m, 100, h, 100, m);   
    fill(225,129,54);      //Minute Block
    triangle(0, m, 100, h, 100, 240);
     
    fill(30,30,230); 
    triangle(0, 0, 0, m, -100, 0);
    fill(237,48,60);      //Second Block
    triangle(-100, 0, -100, s, 0, m);
}



