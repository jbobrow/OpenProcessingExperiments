
float speed = 1.6;
float myimage;
void setup () {
 
size(399,399);
landscape= loadImage("http://kathyhofmann.files.wordpress.com/2013/01/copy-kathy-hofmann_koskonong-creek_11x11_200711.jpg");
}
void draw() {
myimage=myimage+speed ;
image(landscape,0,myimage);
if (myimage > 100) {myimage=-10;
}
float base = height * 0.75;
float scalar = 0.8; 
 
textSize(32);  
float a = textAscent() * scalar;  
line(0, base-a, width, base-a);
text("Land", 0, base);  
 
textSize(64);  
a = textAscent() * scalar; 
line(40, base-a, width, base-a);
text("Scape", 80, base);  
}

