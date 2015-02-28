
void setup (){
size (800, 600);
background (250, 211, 15);
}

void draw (){
 noFill();
for (int y = 20; y <= 600; y += 30) {
for (int x = 20; x <= 600; x += 30) 
ellipse (800, 500, y, 600);
ellipse (600, 700, y, 600);
ellipse (50, 800, y, 600);
ellipse (300, 300, y, 500);
}

}


