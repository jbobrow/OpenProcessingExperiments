
//Created by Adrian N. Malaver (anmalaver@gmail.com)

public class Spiral{
  PVector position = new PVector();
  float rotation = 1.4, rotInc = random(0.01, 0.05), lInc = random(0.985, 0.995), a = random(100, 255), l = 2;
  int flags;
  
  LinkedList<PVector> points = new LinkedList<PVector>();
  
  public Spiral(PVector position, float rotation, int flags){      
      this.position = position;
      this.rotation = rotation;
      this.flags = flags;
  }
  
  public void update(){
    rotation += rotInc;
    l *= lInc;
    
    position.x += l * cos(rotation);
    position.y += l * sin(rotation);
    
    if(points.size() < 250 && a > 0)
      points.add(new PVector(position.x, position.y, 0));
  }
  
  public void draw(){
    float c = 0, r = 2;     
    beginShape();    
    for(PVector v : points){
      stroke(((flags & 1) != 0) ? c : 0, ((flags & 2) != 0) ? c : 0, ((flags & 4) != 4) ? c : 0, a);
      noFill();
      vertex(v.x, v.y, v.z);      
      c += 1 / (float)points.size() * 255;
      r += 0.05;
    }  
    endShape();
    
    a -= 0.5;
  }
}

