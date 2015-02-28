
class Walker{
    int x;
    int y;
     
    Walker(){
        x = width/2;
        y = height/2;
    }
     
    void display(){
    stroke(0);
    point(x,y);
    }
 
    void step(){
     /*int stepx = int(random(3)) - 1;
     int stepy = int(random(3)) - 1;*/
    
     float stepx = random(-1,1);
     float stepy = random(-1,1);
     
     x += stepx;
     y += stepy;
    }
}
 
 
 
Walker w;
 
void setup(){
    size(640,320);
    w = new Walker();
    background(255);
}
 
void draw(){
    w.step();
    w.display();
}
