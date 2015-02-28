
color[] cool = {#363333, #007C7C, #00C8C8, #FFFFFF, #FFD300};
color [] palette = cool;


float x, y;
float radiusCircle = 100;

size(600, 600);
translate(width/2, height/2);
background(palette[0]);
smooth();
ellipseMode(RADIUS);
rectMode(CENTER);

stroke(palette[1]);
noFill();
ellipse(0, 0, radiusCircle, radiusCircle);

//Draw dots in a spiral
//I CANT MAKE THIS INTO A SPIRAL?! I don't know what peice I'm missing? I've gone over
//it again and again
fill(palette[1]);
float radiusSpiralDots = 10;
stroke(palette[2]);
strokeWeight(5);
for(float angle = 0; angle < 8*PI; angle += .1){
    radiusSpiralDots =+ 0.5;
    x = cos(angle) * radiusSpiralDots;
    y = sin(angle) * radiusSpiralDots;
    point(x, y);
}
