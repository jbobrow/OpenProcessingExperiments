
void setup(){
   size(1800,1800);
   background(#FFFFFF);
   frameRate(1);
}

void draw(){
background(#ff0000);
    stroke(#FFFFFF);
    for (int i = 0; i < 4; i++){
         fill(randomColor());
         shaperoonies();
    }
} 

color randomColor(){
    color c = color(#FFFFFF);
    return c;
}

void shaperoonies(){
    rect(random(800),random(800),random(800),random(800));
    ellipse(random(800),random(800),random(800),random(800));
    ellipse(random(800),random(800),random(800),random(800));
    ellipse(random(800),random(800),random(800),random(800));
    line(random(800),random(800),random(800),random(800));
}
