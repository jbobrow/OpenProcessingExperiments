
int diam=50;
float a;
float b;

void setup(){
   size(900, 700);
}

void draw(){

a = map(mouseX+100, 0, width, 0, 255);
b = map(mouseY+100, 0, height, 0, 255);

 fill(0);
 for(int x=diam/30; x<width; x+=random(diam)){
   for(int y=diam/30; y<height; y+=random(diam)){
     int z = int(map (x, diam, width, 0, 255));
   
   noStroke();
   fill(b,z,a);
//   fill(strokeValue);
   rect(random(x),random(y),random(0,255),diam);
   }
 }
}


