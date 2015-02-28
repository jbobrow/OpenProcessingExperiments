
float xPos;
float yPos;

float a = 45;

void setup()[
size(600,600);
xPos = width/2;
yPos = height/2;
}

void draw(){

fill(0, 0);
rect(0,0,width, height);


fill(255);
ellipse(xPos, yPos, 40, 40);

a=a+1;

float xChange = cos(radians(a));
float yChange = sin(radians(a));

xPos += xChange * 0.5;
yPos += yChange*2;
}
