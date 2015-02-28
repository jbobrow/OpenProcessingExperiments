
float noiseScale=0.05;


void setup(){
size(500, 500);
  frameRate(5);
  smooth();
}

void draw (){
    background(255);
    rect1();
    rect2();
    rect3();
    rect4();
}

void rect1(){

for (int x = 0; x <= 100; x += 20) {
  for (int y = 0; y <= 100; y += 10) {
     float noiseVal = noise((mouseX+x)*noiseScale, 
                            mouseY*noiseScale);
    strokeWeight(noiseVal*8);
    rect(x,y,100,100);
    fill(random(200,256),random(x,255),random(0,255));
  

}}
}

void rect2(){

for (int a = 200; a <= 400; a += 50) {
  for (int b = 0; b <= 100; b += 30) {
    float noiseVal = noise((mouseX+b)*noiseScale, 
                            mouseY*noiseScale);
    strokeWeight(noiseVal*20);
    rect(a,b,200,200);
    fill(random(b,256),random(0,a),random(a,256));
}}
}
void rect3(){

for (int a = 0; a <= 100; a += 50) {
  for (int b = 200; b <= 300; b += 25) {
        float noiseVal = noise((mouseX+a)*noiseScale, 
                            mouseY*noiseScale);
    strokeWeight(noiseVal*15);
    rect(a,b,200,200);
   fill(random(a,256),random(b,256),random(0,256));
}}
}

void rect4(){

for (int a = 300; a <= 400; a += 10) {
  for (int b = 280; b <= 400; b += 10) {
        float noiseVal = noise((mouseX+a)*noiseScale, 
                            mouseY*noiseScale);
    strokeWeight(noiseVal*10);
    rect(a,b,100,100);
    fill(random(a/2,256),random(0,255),random(10,200));
}}
}


