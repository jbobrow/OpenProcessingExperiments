

void setup () {
size (500, 500);
background (255);
smooth();
}
void draw () {
//use a mouse press to run the program

if (mousePressed) {
//use two for loops to fill the pattern

for (int x = 0; x<width; x +=20) {
for (int y = 0; y<height; y+=20) {
fill (random(14), random(11), random(126), 20);//set a random color
rect (x, y, 20, 20);
noStroke ();
}

}
}
}

void keyPressed (){
 
 if (key == 's' ){
   
 }
  
}
