
void setup(){
    size(400,400);
    background(255);
}

void draw(){
    int sh = screen.height;
    int sw = screen.width;
    int x = random(sw);
    int y = random (sh);
    
    int rand = random(0,10);
    
    if(rand <= 5){
        line(0,y, sh,y);
        line(x,0, x,sh);
        stroke(x,y);
        strokeWeight(rand);
    }
    
    else{
        line(0,y, sh,y);
        line(x,0, x,sh);
        stroke(y,x);
        strokeWeight(rand/10);
    }
    
}
                
                
