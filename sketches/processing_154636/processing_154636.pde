
float x, y, radius;
float alpha, counter, transparency;
color c;

color randomColor(){
float r = random(255);
float g = random(255);
float b = random(255);

color c = color (r, g, b);
return(c);
}

void setup(){
size (500, 500);

x = mouseX;
y = mouseY;
radius = 50;
c = randomColor();
counter = 0;
alpha = 0;
transparency = radians(1);
}


void update(){
println("Transparency = " +transparency);
if ((sin(transparency))<1 &&(sin(transparency))>0){
alpha++;
}
if ((sin(transparency))<0 &&(sin(transparency))>-1){
alpha--;
}


}



void draw(){
counter++;
transparency++;
update();
translate(250, -100);
rotate(radians(45));
  fill(random(255), random(255), random(255), alpha);
rect(width/2, height/2, 160 * (sin(counter)), 160 * (cos(counter)));

rect(width/2, height/2, 160 * (tan(counter)), 160 * (cos(counter)));
rect(width/2, height/2, 160 * (cos(counter)), 160 * (tan(counter)));




}
