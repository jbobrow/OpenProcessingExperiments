
// based-on: http://www.khanacademy.org/cs/rectangulo-6-prototipos-encapsulation/1438197159

class Rect {
    int x, y, b, h;
    color c;
    
    Rect(int xp, int yp, int bp, int hp, color cp) {
        x = xp;
        y = yp;
        b = bp;
        h = hp;
        c = cp;
    }
    
    int area() { return b * h; }
    
    void writeArea() {
        fill(0, 0, 0);
        text(area(), x+16, y+h/2+6);
    }
    
    void paint() {
        fill(c);
        rect(x, y, b, h);
        writeArea();
    }
}

Rect rects;  // Object array

void setup() {  // this is run once.   
    background(255);
    size(300, 300); 
    rects = [
        new Rect(50,50,60,40,color(0,0,66,99)),
        new Rect(100,100,130,40,color(66,0,0,99)),
        new Rect(200,150,60,110,color(0,66,0,99))
    ];
    for (int i=0; i<rects.length; i++) {
        rects[i].paint();
    }
} 

void draw() {  // execute always @framerate
}
