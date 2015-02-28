
PImage fall;

void setup() {
    size(1024,819) ;
    fall = loadImage("http://einsrevolver.files.wordpress.com/2013/04/autumn-leaves.jpg");
}

void draw() {
    
    background(fall) ;
    frameRate(5);
    ellipse(mouseX,mouseY,100,100) ;
    line(0,0,1024,819) ;
    line(0,819,1024,0) ;
    fill(255,0,0) ;
    rect(437,700,50,118);
    fill(0,255,0) ;
    rect(487,700,50,118);
    fill(0,0,255) ;
    rect(537,700,50,118) ;
    float c = random(255);
    float a = random(255);
    float b = random(255);    
    fill(a,b,c)
    quad(100, 231, 186, 220, 169, 263, 130, 276);
    float x = random(1024) ;
    float y = random(819) ;
    float r = random(150,255) ;
    float g = random(50,150) ;
    fill(r,g,0) ;
    triangle(x,y,x+(x*.25),y+(y*.5),x-(x*.25),y+(y*.5)) ;
    fill(200,100,0);
    if(mouseY>=614) {
    fill(r,g,0)}
    ellipse(mouseX,mouseY,100,100);
}
