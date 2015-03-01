
 void setup() { 
  size (600,600);
  strokeWeight(2);
  frameRate(3);
}
  
  void draw() {
    for (int i=0; i<100; ++i) {
      if (i==50) {
        stroke(random(200), random(200), random(200));
      }
  line(10,10,random(10,width-10),random(10,height-10));
  line(width - 10, height - 10, random(10,width-10), random(10, height-10));
  line(width-10,10,random(10,width-10),random(10,height-10));
   line(10, height-10 ,random(10,width-10),random(10,height-10));
  
}
}
