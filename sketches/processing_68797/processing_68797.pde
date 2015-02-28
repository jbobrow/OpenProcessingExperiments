
float a1=10;
float a2=20;
float a3=30;
float a4=40;
int c=0;
float[] a = {
  10, 10, 10, 10
};

boolean vis=false;

boolean[] upKey = {
  false, false, false, false
};
boolean[] downKey = {
  false, false, false, false
};

ArrayList joints;
void setup() {
  joints = new ArrayList();
  background(20);
  size(800, 400);
}


void draw() {
  println("\n======\n");
  for (int i=0;i<4;i++) {
    print(upKey[i]+"\t");
  }
  println("\n");
  for (int i=0;i<4;i++) {
    print(downKey[i]+"\t");
  }
  println("\n======\n");

  for (int i=0;i<4;i++) {
    if (upKey[i]) {
      a[i]++;
    }
  }
  for (int i=0;i<4;i++) {
    if (downKey[i]) {
      a[i]--;
    }
  }


  background(20);
  pushMatrix();
  translate( (width/4)*3, (height/2));

  int memebrLen = 40;
  for (int i=0;i<4;i++) {
    fill(255);
    rotate(radians(a[i]));
    if (vis) {
      rect(0, -1, memebrLen, 2);
    }
    translate(memebrLen, 0);
  }

  Loc jt1 = new Loc((width/4)*3+cos(radians(a[0]))*memebrLen, 
  height/2+sin(radians(a[0]))*memebrLen);

  Loc jt2 = new Loc(jt1.getX()+cos(radians(a[1]+a[0]))*memebrLen, 
  jt1.getY()+sin(radians(a[1]+a[0]))*memebrLen);

  Loc jt3 = new Loc(jt2.getX()+cos(radians(a[2]+a[1]+a[0]))*memebrLen, 
  jt2.getY()+sin(radians(a[2]+a[1]+a[0]))*memebrLen);

  Loc jt4 = new Loc(jt3.getX()+cos(radians(a[3]+a[2]+a[1]+a[0]))*memebrLen, 
  jt3.getY()+sin(radians(a[3]+a[2]+a[1]+a[0]))*memebrLen);


  joints.add( jt1);
  joints.add( jt2);
  joints.add( jt3);
  joints.add( jt4);
  popMatrix();


  int ptr=0;
  
  for (int i=0;i<joints.size()/4;i++) {

    for (int jt=0;jt<4;jt++) {
      Loc temp = (Loc) joints.get(ptr++);
      noStroke();

      ellipse(temp.getX(), temp.getY(), random(3), random(3));
    }
  }
  
}

void keyPressed() {
  if(key == 'v'){
    vis=true;
  }
  if (key == ' ') {
    joints = new ArrayList();
  }
  if (key == 'q') {
    upKey[0] = true;
  }
  if (key == 'a') {
    downKey[0] = true;
  }

  if (key == 'w') {
    upKey[1] = true;
  }
  if (key == 's') {
    downKey[1] = true;
  }


  if (key == 'e') {
    upKey[2] = true;
  }
  if (key == 'd') {
    downKey[2] = true;
  }

  if (key == 'r') {
    upKey[3] = true;
  }
  if (key == 'f') {
    downKey[3] = true;
  }
}

void keyReleased() {
  if(key == 'v'){
    vis=false;
  }
  if (key =='q') {
    upKey[0] = false;
  }
  if (key == 'a') {
    downKey[0] = false;
  }
  if (key == 'w') {
    upKey[1] = false;
  }
  if (key == 's') {
    downKey[1] = false;
  }

  if (key == 'e') {
    upKey[2] = false;
  }
  if (key == 'd') {
    downKey[2] = false;
  }

  if (key == 'r') {
    upKey[3] = false;
  }
  if (key == 'f') {
    downKey[3] = false;
  }
}

class Loc {
  float x=0;
  float y=0;
  Loc(float x, float y) {
    this.x=x;
    this.y=y;
  }
  float getX() {

    return x-=2;
  }
  float getY() {
    return y;
  }
}


