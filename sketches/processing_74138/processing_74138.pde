
void setup() {
  size(500, 500);
}

void draw() {
  
if(mousePressed) {
background(0);

fill(255);

//ground
rect(0,250,500,250);
//warrior
noStroke();
fill(0);
rect(mouseX - 25,250,50,80);
rect(mouseX - 15,330,30,30);

} else {
background(255);

fill(0);

//ground
rect(0,250,500,250);
//warrior
rect(mouseX - 25, 180, 50, 80);
rect(mouseX - 15, 150, 30, 30);

//arms
rect(mouseX + 15, 190, 30, 10);
rect(mouseX - 45, 190, 30, 10);

//sword
rect(mouseX + 40, 140, 10, 60);
rect(mouseX + 30, 170, 30, 10);
triangle(mouseX + 45, 130, mouseX + 50, 140, mouseX + 40, 140);

//shield
rect(mouseX - 45, 165, 10, 70);

}


}
