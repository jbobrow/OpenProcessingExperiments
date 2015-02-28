
color[] cool = {#363333, #007C7C, #00C8C8, #FFFFFF, #FFD300};
color [] palette = cool;


float x, y;
float radiusCircle = 50;

size(600, 600);
frameRate(2);
translate(width/2, height/2);
background(palette[0]);
smooth();
ellipseMode(RADIUS);
rectMode(CENTER);

stroke(palette[1]);
strokeWeight(2);
ellipse(mouseX, mouseY, radiusCircle/6, radiusCircle/6);

//Draw dots in a spiral
//I CANT MAKE THIS INTO A SPIRAL?! I don't know what peice I'm missing? I've gone over
//it again and again
fill(palette[1]);
float radiusSpiralDots = 20;
stroke(palette[2]);
strokeWeight(5);
for(float angle = 0; angle < 8*PI; angle += .05){
    radiusSpiralDots += 0.5;
    x = cos(angle) * radiusSpiralDots;
    y = sin(angle) * radiusSpiralDots;
    point(x, y);
}

void draw(){
fill(palette[1]);
stroke(palette[2]);
ellipse(mouseX-300, mouseY-300, radiusCircle, radiusCircle);
fill(palette[3]);
stroke(palette[4]);
ellipse(pmouseX-300, pmouseY-300, radiusCircle/2, radiusCircle/2);

}
