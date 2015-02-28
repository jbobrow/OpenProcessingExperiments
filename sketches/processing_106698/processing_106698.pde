
int x = 20;
int y = 20;

int dx = 5;
int dy = 10;

int a = -50;
int b = -50;

int da = 0;
int db = 0;


int counter = 0;

void setup() {  
size (300, 300);

}

void draw() {  
    background (255, 255, 255);
    
    
        ellipse (x, y, 20, 20);
        ellipse (a, b, 20, 20);
    
    x = x +dx;
    y = y +dy;
    
    a= a +da;
    b = b +db;
    
    
    if (y > 300) {
        dy = -dy;
         fill (random (255), random (255), random (255));
       
    }
    if (y < 0) {
        dy = -dy;
       fill (random (255), random (255), random (255));
    }
    if (x > 300) {
        dx = - dx;
         fill (random (255), random (255), random (255));
    }
    if (x < 0) {
        dx = - dx;
       fill (random (255), random (255), random (255));
    }
    if (mousePressed) {
       // ellipse (a, b, 20, 20);
       // a = a +dx;
       // b = b +dy;
        
        a=mouseX;
        b=mouseY
        da = 1;
        db = 1;
        
        
    }
}
