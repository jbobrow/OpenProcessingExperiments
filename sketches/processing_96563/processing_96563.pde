
float hour; // map() often return float value
float minute;
float second;
float mouseXX;
float mouseYY;

void setup () {
size (400, 400);
background (50);
}

void draw() {
second = second ();
if(!mousePressed){
/* you tried to change value when pressed but variable was assigned every frame so I wrapped states*/ 

minute = minute ();
hour = hour ();
}
else{
mouseXX = mouseX;
mouseXX = map(mouseXX, 0, 400, 0, 23); // you called map() but didn't used returned value 
hour = mouseXX;

mouseYY = mouseY;
mouseYY = map(mouseYY, 0, 400, 0, 59);
minute = mouseYY;
}

fill (0);
noStroke();
ellipse (width/2, height/2, 300, 300);
noFill();

translate (width/2, height/2);

stroke(255);
strokeWeight(10);

pushMatrix();
rotate(radians (30*hour));
line(0, 0, 0, -50);
popMatrix();

pushMatrix();
rotate(radians (6*minute));
line(0, 0, 0, -100);
popMatrix();

strokeWeight(2);
pushMatrix();
rotate(radians (6*second));
line(0, 0, 0, -100);
popMatrix();
}


^^
