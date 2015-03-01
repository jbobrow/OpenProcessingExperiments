

PImage frag; // image
float halflife3 = 2100;
void setup() {
  frameRate(900);
  background(0);
 size(1600, 900);//sets size
 frag = loadImage("399486.jpg"); //loads Gabe Newell 
}

void draw() { 
 //nothing in draw
}
void mouseDragged(){
paint(); 
}
void mousePressed(){
paint();
}
void paint(){
 for(int i=0;i < 500;i++){
 float xx = random(-130/2,130/2); // size of box
 float yy = random(-130/3,130/2);
 float yu = 0;
 float x = xx + mouseX; //locks box to mouse
 float y = yy + mouseY;
 color c = frag.get(int(x),int(y)); //gets color of pixel in image
 fill(c);
 stroke(c);
 strokeWeight(random(4)); // random thickness
 line(x,y,x+random(-5,5),y+random(-5,5));
}
}
float calculateDistance(float dx,float dy){
     return sqrt(pow(mouseX - dx,2) + pow(mouseY - dy,2));
}

