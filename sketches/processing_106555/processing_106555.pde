
int counter; 
int x = 20;
int y = 20;

int dx = 5;
int dy = 8;

void setup (){
size (600, 500);
background (0);
frameRate (60);
}

void draw (){

background (255, 0, 255)
rect (x, y, 25, 25)

x = x + dx;
y = y + dy ;
} 

if (x < 0 || x > 475){
dx = -1 * dy;
dy = -1 * dy;
