
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
if(mouseY< y){








 
 
