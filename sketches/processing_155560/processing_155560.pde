
void setup(){
   size(800,400);

}
void draw(){
  frameRate(1);
  translate(400,200);

for (int i = 0; i <= 4000; i += 2) { 

smooth();
fill((103 + (i * 100)%104), 183 + (i * 100)%2, 209 + (i * 100)%1);
rect(27, -106, -2.5, 255);
rotate(12);
translate(i/5,0);

}

}


