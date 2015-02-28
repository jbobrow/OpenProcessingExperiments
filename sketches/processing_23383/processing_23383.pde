
public class Line {
  PVector p1, p2, dir1, dir2;
  float v = 1;
  
  public Line(PVector p1, PVector p2, PVector dir1, PVector dir2, float v) {
    this.p1 = p1;
    this.p2 = p2;
    this.dir1 = dir1;
    this.dir2 = dir2;
    this.v = v;
  }
  
  public void update() {
    p1.add(PVector.mult(dir1, v));
    p2.add(PVector.mult(dir2, v));
    
    if(p1.x <= 0)
      dir1.x = abs(dir1.x);
      
    if(p1.x >= width)
      dir1.x = -abs(dir1.x);
      
    if(p1.y <= 0)
      dir1.y = abs(dir1.y);
      
    if(p1.y >= height)
      dir1.y = -abs(dir1.y);
      
      
    if(p2.x <= 0)
      dir2.x = abs(dir2.x);
      
    if(p2.x >= width)
      dir2.x = -abs(dir2.x);
      
    if(p2.y <= 0)
      dir2.y = abs(dir2.y);
      
    if(p2.y >= height)
      dir2.y = -abs(dir2.y);
     
    r += rInc;
    g += gInc;
    b += bInc;
    
    if(r <= 0)
      rInc = random(0.04, 0.08);
    if(r >= 255)
      rInc = random(-0.04, -0.08);
      
    if(g <= 0)
      gInc = random(0.04, 0.08);
    if(g >= 255)
      gInc = random(-0.04, -0.08);
      
    if(b <= 0)
      bInc = random(0.04, 0.08);
    if(b >= 255)
      bInc = random(-0.04, -0.08);
  }
     
  float r = random(0, 255), g = random(0, 255), b = random(0, 255), rInc = random(-0.08, 0.08), gInc = random(-0.08, 0.08), bInc = random(-0.08, 0.08);

  public void paint() {    
      
    float angle = atan2(p2.y - p1.y, p2.x - p1.x), l = PVector.dist(p1, p2);
    if(angle < 0)
        angle += 2 * (float)Math.PI;
        
    noFill();
    beginShape();    
    stroke(r, g, b, 10);    
    float xInc = 1, angleInc = 2.5*TWO_PI / l, x = 0, a = angleInc, A = 20;
    for(int i = 0; i < l; i++, x += xInc, a += angleInc){
      float l1 = PVector.dist(new PVector(x, sin(a)*A), new PVector());            
      float angle2 = angle - atan2(sin(a)*A, x);
      vertex(l1 * cos(angle2) + p1.x, l1 * sin(angle2) + p1.y, 0);
      //println(l1 * cos(angle2) + p1.x + "," + l1 * sin(angle2) + p1.y);
    }
    endShape();
    
    println();
    
    /*beginShape(LINES);
      stroke(255, 0, 0);
      vertex(p1.x, p1.y, p1.z);
      vertex(p2.x, p2.y, p2.z);      
    endShape();*/
  }
}

