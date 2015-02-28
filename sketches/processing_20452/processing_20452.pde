
//classic random walk

void setup() {
  size(600,600);
}

float x = random(200,400);
float y = random(200,400);
float Vertical = 0;
float Horizontal = 0;
int one = 0;
float b = 0;






void draw() {
  strokeWeight(one);
  stroke(b);
  line(x + random(-10,10) + Horizontal, y += random(-10,10) + Vertical,x += random(-10,10) + Horizontal, y += random(-10,10) + Vertical); 
 
    

}

void keyPressed() {

if( keyCode == UP){
Vertical-= .5;
}
else if( keyCode == LEFT){
Horizontal-= .5;
}
else if( keyCode == RIGHT){
Horizontal+= .5;
}
else if( keyCode == DOWN){
Vertical += .5;
}
if(key == 's'){
b -= 20;
}
else if(key == 'a'){
b += 20;
}
else if(key == '1'){
one++;
}
else if(key == '2'){
if(one == 1){
one = one;
} else one--;
}
}


