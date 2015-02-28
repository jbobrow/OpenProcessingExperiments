
// TJ Bel

// Abstract sketch with rectangles and circles of sand and water colors.


color[] sandandwater = {#7DBDB3, #C2FFF9, #8CDCE3, #B2A587, #D6C6AA};
color[] palette = sandandwater;
float counter = 0;

void setup(){
 size(1050, 700);
 background(palette[0]);
}

void draw(){
 while(counter < 3000){
   stroke(palette[int(random(3, 5))]);
   strokeWeight(int(random(6, 14)));
   fill(palette[int(random(0, 3))]);
   float x = random(width);    
   float y = random(height);
   float d = random(60, 340);
   rect(x, y, d, d);
   ellipse(x, y, d, d);
   counter += random(-1, +2);
 }
}




