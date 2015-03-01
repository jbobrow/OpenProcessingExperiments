
float angle=0;

void setup(){
size(2000,2000);
background(2,250,250);
smooth();}

void draw(){
  if (mousePressed) {
fill(0);
//fill(random(255),random(255),random(255)); 
} else {
//fill(random(255),random(255),random(255));  
fill(color(105, 235, 209));
}
strokeWeight(2);
translate(mouseX,mouseY);
rotate(angle);
rect(-15,-15,30,30);
angle +=0.1;

}


