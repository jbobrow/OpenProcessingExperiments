
int hi =50;

int pink1 =255;

int pink2 =0;

int pink3 =255;

ball[] circleArray = new ball[20];

void setup(){

}

size(500,500);



}

class ball   {

int X=0;

int Y=0;

ball(int XP, int YP){

X=XP;

Y=YP;

}

void update(){

fill (random(0, 255), random(0, 255), random(0, 255));

ellipse(X,Y,50,50);

X=X+random(-2,2);

Y=Y+random(-2,2);

}

}

void draw(){ 

for(int i=0; i<circleArray;i++){

circleArray[i].update
}
