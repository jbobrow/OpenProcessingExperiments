
class Bar{
  ArrayList rectVertex;
  float w = 10;
  color c = color(0,200,0,200);
  
  Bar(){
    rectVertex = new ArrayList();
  }
  
  void addRect(float x,float y,float z,float px,float py,float pz){
    this.rectVertex.add(new Rectangle(x,y,z,px,py,pz));
    if(rectVertex.size() > 500){
      rectVertex.remove(0);
    }
  }
  
  void draw(){
    int len = rectVertex.size();
    for(int i = 0;i < len;i++ ){
      Rectangle rec = (Rectangle)rectVertex.get(i);
      rec.draw();
    }
  }
}

class Rectangle{
  PVector pos;
  PVector ppos;
  float w = 10;
  color c = color(random(255),random(255),random(255),random(255));
  
  Rectangle(float x,float y,float z,float px,float py,float pz){
    this.pos = new PVector(x,y,z);
    this.ppos = new PVector(px,py,pz);
  }
  
  void draw(){
    stroke(0);
    fill(this.c);
    beginShape();       
    vertex(this.pos.x,this.pos.y-this.w,this.pos.z);
    vertex(this.pos.x,this.pos.y+this.w,this.pos.z);
    vertex(this.ppos.x,this.ppos.y+this.w,this.ppos.z);
    vertex(this.ppos.x,this.ppos.y-this.w,this.ppos.z);
    endShape(CLOSE);
  }
}

