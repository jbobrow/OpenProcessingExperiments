
int y = 10;
int spatie = 20;
int stop = height;

void setup (){
    size (600,600);
    background (255);
    fill (200,200,200);
    noStroke();
}

void draw(){
    while(y < stop) { 
        rect (50,y,100,10);
        y = y + spatie;
    } 
}
