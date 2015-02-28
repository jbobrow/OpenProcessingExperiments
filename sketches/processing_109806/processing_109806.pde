
//Lissajous Curve

float ax = 1;
float ay = 1;

float xpos,ypos;
float px,py;

float a = random(10);
float b = random(10);

float dx = PI/2;

float offSet = 1;

int counter = 0;

void setup(){
    size(600,400);
    background(255);
    fill(125,125,126,50);
    
}//end of setup

void draw(){
    
    fill(255,1);
    rect(0,0,width,height);
    xpos = width/4 * ax * (sin(radians(counter * a)) + dx) + width/6 ;
    ypos = width/4 * ax * (sin(radians(counter * b)) + offSet) + height/6;
    
    stroke(xpos,ypos,random(126));
    strokeWeight(3);
    if( counter > 0 ){
        line(px  , py , xpos, ypos);
        ellipse(px , py , 2, 2);
        
    }
    
    px = xpos;
    py = ypos;
    
    counter++;
}
