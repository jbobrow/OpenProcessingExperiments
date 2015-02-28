
PShape logo;
PShape xmark;
float val;
float x, y;

void setup() {
size(800,800);
smooth();
shapeMode(CENTER);
xmark = loadShape("x.svg");
logo = loadShape("logo1.svg");
x = width/2;
y = height/2;

}

void draw() {

rect(0,0, width, height);
float mx = constrain(mouseY, 100, 800);
fill(255, 20);
float diameter = map(mouseY, 500, width, 400, 200);
shape(logo, x+200-val, y+200-val, diameter*2, diameter);
val = map(mx+mouseX,0,width, 0,200);

if(diameter >= 400){
stroke(20);
}
else
{
shape(xmark, width/2,height/2, 800, 800);
}



}

void mousePressed()
{
  saveFrame("scaling-##.tif");  
}

