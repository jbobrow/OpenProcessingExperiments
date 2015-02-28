
int aumenta=10;
void setup(){
size(600,600);
background(156,142,255);
}
void draw(){ 
line(height/2,width/2,mouseX,mouseY);
aumenta++;
stroke(random(68.6),random(169),random(10));
strokeWeight(random(20));
}
