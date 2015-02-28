
String programmmodus = "static";
int anzahl = 10;
int[] xlist = new int[anzahl];
int[] ylist = new int[anzahl];
int[] speedlist = new int[anzahl];
int speed = 10;
void setup () {
size(1080,720);
background(0,0,0);
//anti-aliased on
smooth();

for (int a = 0; a < anzahl; a++) { //Liste
xlist[a] = int(random(0,1080));
ylist[a] = int(random(0,720));
speedlist[a] = 10;
}

}
void draw () {
if (programmmodus == "action") {
background(0);
for (int a = 0; a < anzahl; a++) {
xlist[a]=xlist[a]+speedlist[a];

if (xlist[a] > width) {
speedlist[a]=-speedlist[a];
}
if (xlist[a] < 1){
speedlist[a]=-speedlist[a];
}
}

}
stroke(255);
strokeWeight(10);

for (int a = 0; a < anzahl; a++) {
point(xlist[a],ylist[a]);
}
noStroke();

stroke(random(255),random(255),random(255));
strokeWeight(random(1));
if(mousePressed) {

for (int a = 0; a < anzahl; a++) {
line(mouseX,mouseY,xlist[a],ylist[a]);
} 

}

}

void keyReleased()
{
if (key == 'b') {
background(0);
}
}

void keyPressed() 
{
if (key == 'n') {
background(0);
for (int a = 0; a < anzahl; a++) {
xlist[a] = int(random(0,1080));
ylist[a] = int(random(0,720));
}


} else if (key == 'a') {
if ( programmmodus == "action") {
programmmodus = "static";
} else {
programmmodus = "action";
}
}
}
