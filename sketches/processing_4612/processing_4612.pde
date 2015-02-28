
void setup(){size(400, 400);noLoop();}
float x=0;
void draw(){background(7);x=x++;if(x>height){x=0;}
float m = millis();fill(m%20);rect(0,0,400,x++);noLoop();}
void mousePressed(){loop();}

