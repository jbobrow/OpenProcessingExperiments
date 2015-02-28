
void setup (){
size (800, 600);
background (250, 211, 15);
}

void draw (){
  smooth ();
 fill(71,10,90,70);
for (int y = 5; y <= 800; y += 30) {
for (int x = 5; x <= 800; x += 30) 
ellipse (x, y, 30, x);


}

}






