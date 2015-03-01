
float offset=0, offsetindexed, increment;

color figure = color(0,90,0);
color ground = color(150,0,0);

boolean clickOnce = false;
int clickcount=0;


void setup() {
size(800, 500, P3D);

}

void draw() {

lights();
fill(0,90,0);

offset = offset + 0.035;
background(ground);
if (clickcount==1) {
translate(-mouseX+1012,mouseY);
}
else{
translate(mouseX,mouseY);
}
head(0, 0, sine(-PI / 8, PI / 8, .01));

//RIGHT arm
pushMatrix();
translate(70, 80);
rotate( sine(-PI / 3, 0, 8));
box(14,80,8);
translate(0, 95);
rotate( sine(-PI / 10, PI / 10, 1));
box(14,80,8);
popMatrix();


//LEFT ARM
pushMatrix();
translate(-70, 80);
rotate( sine(0, PI / 3, 1));
box(14,80,8);
translate(0, 95);
rotate( sine(-PI / 10, PI / 10, 1));
box(14,80,8);
popMatrix();//b




pushMatrix();
translate(0, 80);
for (int i = 0; i<7;i++) {
translate(0, 5);
rotate( sine(-PI / 100, PI / 100, .01));
box(70,80,30);

}
noStroke();

popMatrix();
pushMatrix();

for (int i = 0; i<14;i++) {
translate(0, 10);
rotate( sine(-PI/100, PI/100, .01));
}

//LEFT LEG
pushMatrix();
translate(-27, 90);
rotate( sine(-PI / 10, PI / 10, 1));
box(20,100,10);
translate(0, 110);
rotate( sine(-PI / 10, PI / 10, 1));
box(20,100,10);
popMatrix();


//RIGHT LEG
pushMatrix();
translate(27, 90);
rotate( sine(-PI / 10, PI / 10, 1));
box(20,100,10);
translate(0,110);
rotate( sine(-PI / 10, PI / 10, 1));
box(20,100,10);
popMatrix();
popMatrix();
}

void head(float neckX,float neckY, float theta)
{
box(35,50,10);
}

float sine(float low, float high, float speed) {
float freeze;


if(clickcount==2){
freeze = map(0, -1, 1, low, high);
}

else {
float raw = sin(map(millis() % 1000, 0, 1000, 0, TWO_PI));
freeze = map(raw, -1, 1, low, high);
}

return freeze;
}

void mousePressed() {

clickcount=(clickcount+1)%3;
clickOnce = !clickOnce ;
}
