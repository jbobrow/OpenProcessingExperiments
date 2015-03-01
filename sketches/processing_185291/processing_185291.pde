
//landscape project - tatooine sunset

//alter the horizon 
int y = 300;

//sandy ground color
color color1 = color(219, 162, 78);
//sky color
color color2 = color(220, 80, 71);

void setup() {
size(500, 500);
smooth();
background(255);
noStroke();

//ground
fill(color1,230);
rect(0, y, width, height-y);
//sky
fill(color2, 220);
rect(0, 0, width, y);
//building
fill(color1);
rect(50, y-20, 0.1*width, 0.1*height);
rect(50+ 0.1*width, (y-10), 0.04*width, 0.08*height);
arc(50 + 0.05*width, y-20, 0.1*width, 0.08*height, PI, TWO_PI);
arc(50 + 0.1*width, y-10, 0.08*width, 0.04*height, PI, TWO_PI);
}
void draw() {}

//too many suns!
void mousePressed() {
if(mouseY < y) {
fill(color2, 210);
ellipse(mouseX, mouseY, 0.05*width, 0.05*height);
fill(244, 121, 5, 200);
ellipse(mouseX, mouseY, 0.03*width, 0.03*height);
}

float a = 0.02*width;
float b = 0.03*height;
float c = 0.01*width;
float d = 0.01*height;
float e = 0.02*height;


//too many D2's! (in shadow)
if(mouseY > y) {
fill(0, 180);
noStroke();
rect(mouseX, mouseY, a, b); //body
arc(mouseX+(c), mouseY, a, e, PI, TWO_PI); //head
arc(mouseX+(c), mouseY+(b), 0.03*width, e, PI, TWO_PI); //wheels
arc(mouseX+(c), mouseY+(d), 0.03*width, d, PI, TWO_PI); //arm attachment
rect(mouseX+(0.021*width), mouseY+(d), 0.002*width, e); //arm right
rect(mouseX-(0.004*width), mouseY+(d), 0.002*width, e); //arm left
}
}





 
