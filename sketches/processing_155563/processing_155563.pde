
float a=12;
void setup(){
   size(800,400);

}
void draw(){
  background(255);
  frameRate(10);
  translate(400,200);

for (int i = 0; i <= 4000; i += 2) { 

smooth();
fill((11 + (i * 100)%104), 183 + (i * 100)%2, 209 + (i * 100)%1);
rect(27, -106, -2.5, 255);
rotate(a);

translate(i/5,0);

}
a=a+0.0001;
}


