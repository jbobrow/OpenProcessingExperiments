
float x, y, radius;
float transparency, alpha, beta, counter;
color c, d;

color randomColor(){
float r = random(255);
float g = random(255);
float b = random(255);

color c = color (r, g, b);
color d = color (r, g, b);
return(c);

}

void setup(){
size (500, 500);
d = randomColor();
c = randomColor();
x = mouseX;
y = mouseY;
radius = 75;
alpha = 0;
transparency = radians(1);
counter = radians(0);
beta = 255;
}


void update(){
  transparency+= radians(1);
  if((sin(transparency))<=1 && (sin(transparency))>=0){
   alpha++;
   beta--;
  }
  if((sin(transparency))<=-0 &&(sin(transparency)) >=-1){
   alpha--; 
   beta++;
  }
}

void draw(){
background(125, 150, 125); 
update();
counter += radians(1);
print("Beta = " +beta);
println(" Alpha = " +alpha);

noStroke();

fill(c, alpha);
ellipse(width/2, height/2, 80 * sin(counter), -80 * sin(counter));

fill(d, beta);
ellipse(width/2, height/2, -80 * sin(counter), 80 * sin(counter));

if (mousePressed == true){
c = randomColor(); 
d = randomColor();
mousePressed = false;
}


}


