
Thing[] ts = new Thing[10];
BG bg;
void setup() {
 size(320,240);
 for(int i = 0; i < ts.length; i++){  
     ts[i] = new Thing(random(width),random(height),30,30,color(random(100)+50));
 }
 bg = new BG(0,0,width,height,color(0));
}

void draw() {
 bg.draw();
 for(int i = 0; i < ts.length; i++){
     ts[i].draw();
 }
}
void mousePressed(){
    for(int i = 0; i < ts.length; i++){
       ts[i].mousePressed();
   }
}
void mouseReleased(){for(
    int i = 0; i < ts.length; i++){
        ts[i].mouseReleased();
    }
}
class Thing{
    float x,y,Width,Height;
    color C, storedC;
    Thing(float _x, float _y, float _Width, float _Height, color _C){
        x = _x;
        y = _y;
        Width = _Width;
        Height = _Height;
        storedC = C = _C;
    }
    void draw(){
        if((dist(mouseX,mouseY,x,y) < Width/2)&&(mousePressed)){
            for(int i = 0; i < ts.length; i++){
                stroke(200);
                line(ts[i].x,ts[i].y,x,y);
                C = color(255,0,0);
            }
        }
        fill(C);
        noStroke();
        ellipse(x,y,Width,Height);
    }
    void mousePressed(){
            C = color(255);
    }
    void mouseReleased(){
        C = storedC;
    }
}

class BG{
    float x,y,Width,Height;
    color C;
    BG(float _x, float _y, float _Width, float _Height, color _C){
        x = _x;
        y = _y;
        Width = _Width;
        Height = _Height;
        C = _C;
    }
    void draw(){
        fill(C);
        noStroke();
        rect(x,y,Width,Height);
    }
}
                
                                                                                
