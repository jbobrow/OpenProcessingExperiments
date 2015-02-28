
Mocap mocap1;
Mocap mocap2;
Mocap mocap3;
MocapInstance[] instances;
float rX, rZ, vX, vZ;

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  camera(0.0f, 300.0f, 600.0f, 0.0f, 0.0f, 0.0f, 0.0f, -1.0f, 0.0f);
  smooth();
  mocap1 = new Mocap("01.hrc", "01_01.t3d", 8f, 2);
  mocap2 = new Mocap("139.hrc", "139_12.t3d", 8f, 2);
  mocap3 = new Mocap("139.hrc", "139_13.t3d", 8f, 2);

  instances = new MocapInstance[4];

  instances[0] = new MocapInstance(mocap1, new PVector(100, 0, 200), color(255, 0, 0));
  instances[1] = new MocapInstance(mocap2, new PVector(0, 0, 0), color(0, 255, 0));
  instances[2] = new MocapInstance(mocap3, new PVector(-100, 0, -200), color(0, 0, 255));
  instances[3] = new MocapInstance(mocap3, new PVector(400, 0, -200), color(0, 255, 255));
  instances[3].currentFrame = 120;
}

void draw() {
  background(70, 100, 255);
//  lights();
  rotations();
  drawGroundPlane(1000);
  for( int i=0; i< instances.length; i++ ) {
    instances[i].nextFrame();
    instances[i].draw();
  }

}

void rotations() {
  rX += vX;
  rZ += vZ;
  vX *= .95;
  vZ *= .95;

  if (mousePressed) {
    vX += (mouseY - pmouseY) * .01;
    vZ += (mouseX - pmouseX) * .01;
  }

  rotateX(radians(-rX));
  rotateY(radians(-rZ));
}

void drawGroundPlane( int size ) {
  noStroke();
  fill( 255, 50 );
  beginShape();
  vertex( -size, 0, -size ); 
  vertex( size, 0, -size ); 
  vertex( size, 0, size ); 
  vertex( -size, 0, size ); 
  endShape();
}

class MocapInstance {

  private Mocap mocap;
  private PVector translation = new PVector();
  private PVector rotation = new PVector();
  public int currentFrame;
  private color clr;

  public MocapInstance(Mocap mocap) {
    this.mocap = mocap;
  }

  public MocapInstance(Mocap mocap, PVector translation) {
    this.mocap = mocap;
    this.translation = translation;
  }

  public MocapInstance(Mocap mocap, PVector translation, PVector rotation) {
    this.mocap = mocap;
    this.translation = translation;
    this.rotation = rotation;
  }

  public MocapInstance(Mocap mocap, PVector translation, color clr) {
    this.mocap = mocap;
    this.translation = translation;
    this.clr = clr;
  }

  public void nextFrame() {
    currentFrame = (currentFrame+1)  % mocap.numFrames;
  }

  public void draw() {
    pushMatrix();
    translate( translation.x, translation.y, translation.z );
    if ( rotation.x != 0.0f ) rotateX( rotation.x );
    if ( rotation.y != 0.0f ) rotateY( rotation.y );
    if ( rotation.z != 0.0f ) rotateZ( rotation.z );
    stroke( clr );
    strokeWeight(5);
    ArrayList skeleton = mocap.getSkeletonLines(currentFrame);

    for( int i=0; i < skeleton.size(); i++ ) {
      Line bone = (Line)skeleton.get(i);
      line(bone.p1.x, bone.p1.y, bone.p1.z, bone.p2.x, bone.p2.y, bone.p2.z);
    }
    popMatrix();
  }
}

class Mocap {

  private HashMap hiearchy = new HashMap();
  private Joint rootJoint;
  public int numFrames = 0;
  public float scale;
  public int skipCount;

  public Mocap(String hrcFile, String t3dFile) {
    this(hrcFile, t3dFile, 1.0f, 1);
  }

  public Mocap(String hrcFile, String t3dFile, float scale) {
    this(hrcFile, t3dFile, scale, 1);
  }

  public Mocap(String hrcFile, String t3dFile, float scale, int skipCount) {
    this.scale = scale;
    this.skipCount = skipCount;
    loadHiearchy(hrcFile);
    loadMotion(t3dFile);
  }

  public void loadHiearchy(String filename) {
    String[] hrcLines = loadStrings(filename);
    for (int i=0; i < hrcLines.length; i++ ) {
      String line = hrcLines[i];
      String[] joints = line.split(" ");
      // Add joints if they don't exist in hiearchy
      for (int j = 0; j < joints.length; j++) {
        if (hiearchy.get(joints[j]) == null) {
          Joint jnt = new Joint();
          jnt.name = joints[j];
          hiearchy.put(jnt.name, jnt);
          if (rootJoint == null) {
            rootJoint = jnt;      // First joint is root joint
          }
        }
      }

      // Add children
      Joint parentJoint = (Joint)hiearchy.get(joints[0]);
      for (int ci = 1; ci < joints.length; ci++) {
        Joint child = (Joint)hiearchy.get(joints[ci]);
        parentJoint.children.add(child);                    
      }
    }
  }

  public void loadMotion(String filename) {
    String[] t3dLines = loadStrings(filename);

    String[] fieldNames;

    String headerLine = t3dLines[0];
    if (!headerLine.startsWith("%")) {
      println("Invalid header for t3d file");
      return;
    }

    numFrames = t3dLines.length - 1;
    fieldNames = headerLine.substring(2).split(" ");

    int frameNumber = 0;
    for (int i = 1; i < t3dLines.length; i += 2) {
      String[] frameInfo = t3dLines[i].split(" ");
      for (int j = 2; j < frameInfo.length; j++) {
        String[] parsedField = fieldNames[j].split(":");
        String jointName = parsedField[0];
        String fieldPos = parsedField[1];

        Joint joint = (Joint)hiearchy.get(jointName);
        if (joint == null) {
          println("Unable to find joint: " + jointName);
        } 
        else {
          if (frameNumber >= joint.positions.size()) {
            PVector v = new PVector();
            joint.positions.add(v);
          }
          PVector v = (PVector)joint.positions.get(frameNumber);
          if (fieldPos.equals("X")) {
            v.x = Float.parseFloat(frameInfo[j]) * scale;
          } 
          else if (fieldPos.equals("Y")) {
            v.y = Float.parseFloat(frameInfo[j]) * scale;
          } 
          else if (fieldPos.equals("Z")) {
            v.z = Float.parseFloat(frameInfo[j]) * scale;
          }
        }
      }
      frameNumber++;
    }
    numFrames = rootJoint.positions.size();
  }

  public ArrayList getJointPositions(int frameNumber) {
    ArrayList positions = new ArrayList();
    int frame = frameNumber % numFrames;
    Iterator i = hiearchy.values().iterator();
    while( i.hasNext() ) {
      Joint j = (Joint)i.next();
      PVector v = (PVector)j.positions.get(frame);                
      positions.add(v);
    }
    return positions;
  }

  public ArrayList getSkeletonLines(int frameNumber) {
    ArrayList lines = new ArrayList();
    int frame = frameNumber % numFrames;
    addSkeletonLine(lines, rootJoint, frame);
    return lines;
  }

  private void addSkeletonLine(ArrayList lines, Joint parent, int frame) {
    PVector parentPos = (PVector)parent.positions.get(frame);
    for( int i=0; i < parent.children.size(); i++ ) {
      Joint child = (Joint)parent.children.get(i);
      Line line = new Line();
      line.p1 = parentPos;
      line.p2 = (PVector)child.positions.get(frame);
      lines.add(line);
      addSkeletonLine(lines, child, frame);
    }
  }
}

class Line {
  public PVector p1;
  public PVector p2;
}

class Joint {
  public String name;
  public ArrayList children = new ArrayList();
  public ArrayList positions = new ArrayList();
}











