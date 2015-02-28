
class segment {
  PMatrix3D orientation;
  float length;
  float diameter;
  boolean extended = false;
  segment() {
    orientation = new PMatrix3D();
    length = height/5;
    diameter = 32;
  }
  segment(segment parent) {
    orientation = parent.orientation.get();
  }
  void extend() {
    if(extended==false){
      extended = true;
      segment extensionA = new segment(this);
      extensionA.orientation.translate(0,0,length);
      extensionA.orientation.rotateX(PI/16);
      extensionA.orientation.rotateZ(PI*3/4);
      extensionA.length = length*0.8;
      extensionA.diameter = sqrt(sq(diameter/2)*2/3)*2;
      segmentList = (segment[]) append(segmentList, extensionA);
      segment extensionB = new segment(this);
      extensionB.orientation.translate(0,0,length);
      extensionB.orientation.rotateX(-PI/6);
      extensionB.length = length*0.6;
      extensionB.diameter = sqrt(sq(diameter/2)/3)*2;
      segmentList = (segment[]) append(segmentList, extensionB);
    }
  }
  void render() {
    beginShape(TRIANGLE_STRIP);
    int resolution = 6;
    for (int i=0;i<resolution+2;i++) {
      float angle = i*TWO_PI/resolution;
      PVector vertices = new PVector(
      diameter/2*cos(angle), diameter/2*sin(angle), i%2*length);
      orientation.mult(vertices, vertices);
      vertex(vertices.x, vertices.y, vertices.z);
    }
    endShape();
  }
}
segment[] segmentList;
void setup() {
  size(800, 600, P3D);
  noStroke();
  fill(0,255,0);
  segmentList = new segment[1];
  segmentList[0] = new segment();
  for(int j=0;j<7;j++){
    for(int i=segmentList.length-1;i>=0;i--){
      segmentList[i].extend();
    }
  }
}
void draw() {
  background(0);
  lights();
  translate(width/2, height);
  rotateX(PI/2);
  rotateZ(frameCount*TWO_PI/60/10);
  for(int i=0;i<segmentList.length;i++){
    segmentList[i].render();
  }
}



