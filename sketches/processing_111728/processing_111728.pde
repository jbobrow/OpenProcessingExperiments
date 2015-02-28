
// Chun Yi Wu


void setup(){
background(255,255,255);
size(500,500);
}
void draw(){

// draw rectangle
noStroke();
fill(255,0,0);
rect(0,0,230,230);
noStroke();
fill(255,255,0);
rect(0,350,30,150);
noStroke();
fill(0,0,128);
rect(230,350,170,120);

// draw line
stroke(0);
strokeWeight(8);
line(230,0,230,500);
line(0,230,500,230);
line(0,350,500,350);
line(30,350,30,500);
line(400,350,400,500);
line(230,470,397,470);


}


