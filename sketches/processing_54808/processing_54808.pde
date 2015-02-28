
//source: http://processing.org/learning/2darray/

int angle = 0;

void setup() 
{
size(250,250);
background(127);
}


void draw() {  //draw function loops 
    angle += 0.02; 
    background(127+127*sin(angle));  
}
