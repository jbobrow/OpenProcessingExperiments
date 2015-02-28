
int x, y, z;

void setup() {
size(500,500);
}

void draw() {
background(210,170,200);
fill(100,80,80);
noStroke();
rect(0,400,500,400);
stroke(0)
noFill();
bezier(300,425,315,415,317,400,330,150);
bezier(370,150,390,400,393,415,400,425);
fill(200,80,80)
noStroke();
rect(280,80,150,100)

}
