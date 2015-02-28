
PShape logo;

void setup()

{
 size(500,500);
logo= loadShape("logo.svg");
shapeMode(CENTER);
smooth();
logo.disableStyle();
}

void draw()

{
 background (255);
float mx = map(mouseX, mouseY, width, 100,1000);
//fill(255,250,90);
shape(logo, width/2,height/2,mx,mx);
}

