
// special thanks for clarification of the perspective:
// http://www.arcsynthesis.org/gltut/Positioning/Tut04 Perspective Projection.html

// observer is at (0,0,0)
// projection plane is at z = planePos


// remove border and background
var body = document.getElementsByTagName("body")[0];
body.style.background = "none";


parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");
// remove code transparency
parent.document.getElementById("sourceCodeContainer").setAttribute("style", "opacity: 1");


float planePos = 200;

Cube cube;

void setup() {
  size(500,500);
  cube = new Cube(0, 0, 500, 200);
}

void draw() {
  background(0);
  externals.context.clearRect(0,0,width,height);// part of the canvasAPI that creates a clear rect
  fill(0,100);
  rect(0,0,width,height);
  stroke(200);
  translate(width/2, height/2);
  ellipseMode(CENTER);
//  ellipse(0,0,10,10);
//  line(-width/2, 0, width/2, 0);
//  line(0, -height/2, 0, height/2);
  
  cube.draw();
  cube.update();
}

PVector project(PVector v) {
  PVector ans = PVector.mult(v,(planePos/v.z));
  ans.set(ans.x, -ans.y, ans.z);
  return ans;
}
class Cube {
  
  final float sqr = 1.4142135;
  final float PIQ = PI/4;
  
  float x;
  float y;
  float z;
  
  float s;
  float a1;
  float a2;
  
  Cube(float x, float y, float z, float s) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.s = s;
    
  }
  
  void draw() {
    
    fill(0,0,200,60);
    ellipseMode(CENTER);    
    PVector u1 = new PVector(s*sqr*cos(  PIQ+a1)+x, s+y, s*sqr*sin(  PIQ+a1)+z);
    PVector u2 = new PVector(s*sqr*cos(3*PIQ+a1)+x, s+y, s*sqr*sin(3*PIQ+a1)+z);
    PVector u3 = new PVector(s*sqr*cos(5*PIQ+a1)+x, s+y, s*sqr*sin(5*PIQ+a1)+z);
    PVector u4 = new PVector(s*sqr*cos(7*PIQ+a1)+x, s+y, s*sqr*sin(7*PIQ+a1)+z);
    
    PVector v1 = new PVector(s*sqr*cos(  PIQ+a1)+x, -s+y, s*sqr*sin(  PIQ+a1)+z);
    PVector v2 = new PVector(s*sqr*cos(3*PIQ+a1)+x, -s+y, s*sqr*sin(3*PIQ+a1)+z);
    PVector v3 = new PVector(s*sqr*cos(5*PIQ+a1)+x, -s+y, s*sqr*sin(5*PIQ+a1)+z);
    PVector v4 = new PVector(s*sqr*cos(7*PIQ+a1)+x, -s+y, s*sqr*sin(7*PIQ+a1)+z);
    
//    println(u1.x+"\t, "+u1.y+"\t, "+u1.z);
//    println(u2.x+"\t, "+u2.y+"\t, "+u1.z);
//    println(u3.x+"\t, "+u3.y+"\t, "+u1.z);
//    println(u4.x+"\t, "+u4.y+"\t, "+u1.z);
    
    ellipse( project(u1).x, project(u1).y, 10, 10);
    ellipse( project(u2).x, project(u2).y, 10, 10);
    ellipse( project(u3).x, project(u3).y, 10, 10);
    ellipse( project(u4).x, project(u4).y, 10, 10);
    
    ellipse( project(v1).x, project(v1).y, 10, 10);
    ellipse( project(v2).x, project(v2).y, 10, 10);
    ellipse( project(v3).x, project(v3).y, 10, 10);
    ellipse( project(v4).x, project(v4).y, 10, 10);
    
    line(project(u1).x, project(u1).y, project(v1).x, project(v1).y);
    line(project(u2).x, project(u2).y, project(v2).x, project(v2).y);
    line(project(u3).x, project(u3).y, project(v3).x, project(v3).y);
    line(project(u4).x, project(u4).y, project(v4).x, project(v4).y);
    
    line(project(u1).x, project(u1).y, project(u2).x, project(u2).y);
    line(project(u2).x, project(u2).y, project(u3).x, project(u3).y);
    line(project(u3).x, project(u3).y, project(u4).x, project(u4).y);
    line(project(u4).x, project(u4).y, project(u1).x, project(u1).y);
    
    line(project(v1).x, project(v1).y, project(v2).x, project(v2).y);
    line(project(v2).x, project(v2).y, project(v3).x, project(v3).y);
    line(project(v3).x, project(v3).y, project(v4).x, project(v4).y);
    line(project(v4).x, project(v4).y, project(v1).x, project(v1).y);
    
    beginShape(); //top
    vertex(project(u1).x, project(u1).y);
    vertex(project(u2).x, project(u2).y);
    vertex(project(u3).x, project(u3).y);
    vertex(project(u4).x, project(u4).y);
    endShape();
    
    beginShape(); //bottom
    vertex(project(v1).x, project(v1).y);
    vertex(project(v2).x, project(v2).y);
    vertex(project(v3).x, project(v3).y);
    vertex(project(v4).x, project(v4).y);
    endShape();
    
    beginShape();
    vertex(project(u1).x, project(u1).y);
    vertex(project(u2).x, project(u2).y);
    vertex(project(v2).x, project(v2).y);
    vertex(project(v1).x, project(v1).y);
    endShape();
    
    beginShape();
    vertex(project(u2).x, project(u2).y);
    vertex(project(u3).x, project(u3).y);
    vertex(project(v3).x, project(v3).y);
    vertex(project(v2).x, project(v2).y);
    endShape();
    
    beginShape();
    vertex(project(u3).x, project(u3).y);
    vertex(project(u4).x, project(u4).y);
    vertex(project(v4).x, project(v4).y);
    vertex(project(v3).x, project(v3).y);
    endShape();
    
    beginShape();
    vertex(project(u4).x, project(u4).y);
    vertex(project(u1).x, project(u1).y);
    vertex(project(v1).x, project(v1).y);
    vertex(project(v4).x, project(v4).y);
    endShape();
    
  }
  
  void update() {
    a1+=0.01;
  }
  
}

