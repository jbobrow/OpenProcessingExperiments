
int[] numbers = new int[50];

void setup () {
 size(255*4,255*2);
 frameRate(10);
}
void draw() {
  noStroke();
  for (int i = 0; i < screenWidth; i+=random(5,25)) {
      for (int j = 0; j < screenWidth; j+=random(5,25)) {
          fill(noise(mouseX/4, random(1))*255,noise(mouseY/2,  random(1))*255,noise(j*i*(noise(mouseX,mouseY,random(8))))*255);
          
          
         if(boolean(int(random(5)))) {
           rect(i,j, i+random(5,25), j+random(5,25));
         }
      }
  }
  //println(screenWidth);
  println(noise(20));
  //colorMode(HSB, 100, 10, 100);
  //background(mouseX/4,mouseY/2,123);
  
}
