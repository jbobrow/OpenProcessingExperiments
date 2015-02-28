

void setup(){
colorMode(HSB, 360, 100, 100); 
size(1200,500,P3D);
 mouseClicked();
}

void draw(){

}

void mousePressed()
{
  float randHue = random(360);
  float randHue2 = (randHue + 180) % 360;
  
  
  
  tint(randHue, random(80), 100);
  image(g,random(4,50),random(4,50));
  
  fill(randHue2, random( 50));
  noStroke();
  //stroke(255,70);
  ellipse(random(1200),random(500),100,100);
  ellipse(random(1200),random(500),500,500);
  

  
}

