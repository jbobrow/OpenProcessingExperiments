
PVector randomColor(){
  return new PVector(random(200), random(200), random(200,255));
}

void setup() {
  size(800, 400);
  background(0); 
  noFill();
  strokeWeight(.5);
  
  float xMin = 0;
  float xMax = width;
  float yMin = height * 0.25;
  float yMax = height * 0.75;
  
  int patchSize = 20;
  int pathSize = 20;
  int patchCount = 5;
  
  float heightStep = (yMax-yMin) / patchCount;

  Path start;
  Path end = new Path(randomColor());
  end.generateRandCrv(pathSize, xMin, xMax, yMin, yMin + heightStep);

  for(int i = 1; i <= patchCount; i++)
  {
      float y1 = yMin + i * heightStep;
      float y2 = yMin + (1+i) * heightStep;
    
      start = end;
      end = new Path(randomColor());
      end.generateRandCrv(pathSize, xMin, xMax, y1, y2);
  
      BPatch patch = new BPatch(patchSize, start, end);
      patch.display();
      
      start = end;
      end = new Path(randomColor());
      end.generateRandCrv(pathSize, xMin, xMax, y1, y2);
  
      patch = new BPatch(patchSize, start, end);
      patch.display();
  }
}




float blendCrv(float t, float start, float end){
  return t * start + (1.0 - t) * end;
}  

PVector blendCrv(float t, PVector start, PVector end){
  return new PVector(blendCrv(t,start.x,end.x), blendCrv(t,start.y,end.y), blendCrv(t,start.z,end.z));
}

Bezier blendCrv(float t, Bezier start, Bezier end){
  Bezier resultCrv = new Bezier();
  resultCrv.p0 = blendCrv(t, start.p0, end.p0);
  resultCrv.p1 = blendCrv(t, start.p1, end.p1);
  resultCrv.p2 = blendCrv(t, start.p2, end.p2);
  resultCrv.p3 = blendCrv(t, start.p3, end.p3);
  resultCrv.c = blendCrv(t, start.c, end.c);
  return resultCrv;
}

class BPatch{
  Bezier[] curves;
  int count;
 
  BPatch(int size, Path startPath, Path endPath){
    int pathSize = min(startPath.listSize(), endPath.listSize());
    count = size * pathSize;
    
    curves = new Bezier[count];
    
    float s = 1.0 / size;
    for(int i = 0; i < pathSize; i++){
      Bezier startCurve = (Bezier)startPath.curves.get(i);
      Bezier endCurve = (Bezier)endPath.curves.get(i);
      
      for(int j = 0; j < size; j++){
        curves[i*size+j] = blendCrv(s*j, startCurve, endCurve);
      }    
    }
  }
  
  void display(){
    for(int i = 0; i < count; i++){
      curves[i].display();
    }
  }
}





class Bezier{
  PVector p0;
  PVector p1;
  PVector p2;
  PVector p3;
  PVector c;
  
  void generateRandCrv(float xMin, float xMax, float yMin, float yMax){
    p0 = new PVector(xMin, random(yMin, yMax));
    p1 = new PVector(random(xMin, xMax), random(yMin, yMax));
    p2 = new PVector(random(xMin, xMax), random(yMin, yMax));
    p3 = new PVector(xMax, random(yMin, yMax));
  } 
  
  void display(){
    stroke(c.x, c.y, c.z);
    strokeCap(SQUARE);
    bezier(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  }
}

class Path{
  PVector c;
  ArrayList curves;
  
  Path(PVector c){
    this.c = c;
    curves = new ArrayList();
  }
  
  void generateRandCrv(int size, float xMin, float xMax, float yMin, float yMax){
    float step = (xMax-xMin) / size;
    float x = xMin + step;
    
    Bezier b = new Bezier();
    b.generateRandCrv(x - step, x, yMin, yMax);
    addCurve(b);
    
    for(int i = 1; i < size; i++){
      x += step;
      addCurve(x, yMin, yMax);
    }
  }
  
  int listSize() { 
    return curves.size(); 
  }
  
  void addCurve(Bezier b){
    b.c = c;
    curves.add(b);
  }
  
  void addCurve(float x, float yMin, float yMax){
    Bezier result = new Bezier();
    
    Bezier last = (Bezier)curves.get(curves.size()-1);

    result.generateRandCrv(last.p3.x, x, yMin, yMax);
    result.c = c;
    result.p0 = new PVector(last.p3.x, last.p3.y);
    
    //make it a smooth joint
    PVector v = new PVector(last.p3.x, last.p3.y);
    v.sub(last.p2); 
    v.add(result.p0);
    result.p1 = v;
    
    curves.add(result);    
  }
}

