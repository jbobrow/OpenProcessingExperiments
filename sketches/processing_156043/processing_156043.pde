
void setup(){
size(800,500);
background(4, 13, 69);
}

void draw(){
  float aaa = map(sin(frameCount*0.05), -0.5, 0.5, 0, height);
                               
  float bbb = map(cos(frameCount*0.05), -1, 1, 0, height);
  
  float ccc = map(cos(frameCount), -1, 1, -frameCount, frameCount);


  println(aaa);
  strokeWeight(0.05);

  stroke(random(158), random(140), random(212));
  line (ccc, aaa, 400, 250);
  line (-ccc, bbb, 400, 250);
  
  }


