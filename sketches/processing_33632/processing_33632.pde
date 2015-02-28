
void setup(){
size(700,400);
smooth();

}

void draw(){
background(200);
stroke(0);
float d= dist(mouseX,mouseY,350,200);
strokeWeight(d/15);
fill(255);
ellipse(width/2,height/2,d*2,d);
strokeWeight(d/20);
fill(153,82,162);
ellipse(width/2,height/2,d,d);
fill(0);
noStroke();
ellipse(width/2,height/2,d/3,d/3);
}
                
                
