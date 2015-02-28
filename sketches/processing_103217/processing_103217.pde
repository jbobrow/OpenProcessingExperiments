
float x, y;
int x_inicial;
int y_inicial;
int i;
int n;
void setup(){
size(500,500);
x = 1;
y = 0;
x_inicial = 250;
y_inicial = 250;
i=0;
background(123,215,124);
strokeWeight(2);
n = 0;
}
void draw(){
    stroke(n,n,n);
    smooth();
    line(x_inicial, y_inicial, x_inicial + cos(radians(i)) * 250, 255 + sin(radians(i)) * 250);
    i+=5;
    if ( i > 360){
        i=0;
        background(123,215,124);
    }
    if (n>=255)
        n = 0;
    n+=3;
}

