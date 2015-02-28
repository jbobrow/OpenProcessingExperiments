
int xKoordinate=150;
int yKoordinate=30;

int x0=xKoordinate;
int y0=yKoordinate;

float vx=0;
float vy=0;

float mass=0.1f;
float spring=0.006f;
float gravity=9.81f;
float deltat=0.1f;
float friction=0.025f;

int xSize=20;
int ySize=20;

color figurFarbe=color(200,30,30);
color hintergrundFarbe=color(80,80,30);

int spielFeldGroesse=300;


void setup(){
    size(spielFeldGroesse,spielFeldGroesse);
    ellipseMode(CENTER);
    textAlign(CENTER,CENTER);
}

void draw(){
    background(hintergrundFarbe);
    fill(figurFarbe);
    line(mouseX,mouseY,xKoordinate,yKoordinate);
    ellipse(xKoordinate,yKoordinate,xSize,ySize);
    updatev();
    yKoordinate+=vy;
    xKoordinate+=vx;
}

void updatev(){
    float Fx=0;
    float Fy=gravity*mass;
    float sprlen=dist(xKoordinate,yKoordinate,mouseX,mouseY);
    Fy-=spring*(yKoordinate-mouseY);
    Fx-=spring*(xKoordinate-mouseX);
    Fy-=friction*vy;
    Fx-=friction*vx;
    vy+=Fy*deltat/mass;
    vx+=Fx*deltat/mass;
}
