

public void setup() {
  size(1280, 720, P2D);
  
  noStroke();
  fill(0, 1);  
}
  
public void draw() {    
  background(int(random(0,255)),int(random(0,255)),int(random(0,255)),int(random(0,255)));
  for (int i = 0; i < 10000; i++) {
    float x = random(width);
    float y = random(height);
    rect(x, y, 30, 30);
    fill(int(random(0,255)),int(random(0,255)),int(random(0,255)),int(random(200,255)));    
  }
  if (frameCount % 10 == 0) println(frameRate);
}


void keyPressed(){
  
  
  if(key == 's'){
    
        println("OKAY");
    save("capture.tif");
    
    delay(100); 
    
  }
}
