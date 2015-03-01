
int diam=50;
float a;
float b;

void setup(){
   size(900, 700);
}

void draw(){

a = map(mouseX-100, 0, width, 0, 255);
b = map(mouseY-100, 0, height, 0, 255);

 fill(0);
 for(float x=random(0,5); x<width; x+=diam){
   for(float y=random(0,5); y<height; y+=diam){
     int z = int(map (x, diam, width, 0, 255));
   
   noStroke();
   fill(b,z,a);
//   fill(strokeValue);
   triangle(mouseX, mouseY, random(width),random(height), random(width),random(height));
   }
 }
}


