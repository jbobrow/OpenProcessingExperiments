
List arm = new List();
PFont font;
void setup(){
  size(800, 600);

  arm.add(new Bone(200,200,0.1));
  arm.add(new Bone(50, 0, 0.5));
  arm.add(new Bone(50, 0, -0.2));

  font = loadFont("Inconsolata-12.vlw");
  textFont(font, 12);
}


void draw(){
  update();
  background(145);
  strokeWeight(5);
  stroke(#FFD700);

  drawBone(arm, 0);
}

void drawBone(List bones, int index){
  Bone bone = (Bone) bones.get(index);
  pushMatrix();
  translate(bone.x,bone.y);
  rotate(bone.angle);
  line(0,0,50,0);
  text(round(degrees(bone.angle)),0,0);
  if(index < bones.size() - 2) drawBone(bones,index + 1 );
  popMatrix();
}

void update(){
  CCDResult result = iterateChain(arm, new PVector(mouseX, mouseY), 0.01);
  if(result.status != CCD_EXCEPTION && result.status != CCD_FAILURE)
    arm = result.bones;
}

