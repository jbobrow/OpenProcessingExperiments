
int lab[][];
int labW;
int labH;

float meX;
float meZ;
float meAn = 0;
float sc = 500;
float h = 20;
boolean transparent = false;

void setup() {
  size(800,500,P3D);
  resetMatrix();
  background(0);
  String lines[] = loadStrings("level1.lab");
  labW=lines[0].length();
  labH=lines[0].length();
  meX=labW/2;
  meZ=labH/2;
  lab = new int[labW][labH];
  
  for(int z=0;z<labW;z++) {
    for(int x=0;x<labW;x++) {
      lab[x][labW-z-1]=int(lines[z].charAt(x))-48;
    }

  }

  for(int z=0;z<labW;z++) {
    for(int x=0;x<labW;x++) {
      print(lab[x][labW-z-1]);
    }
    println();
  }
  
  print(meX+"\t"+meZ+"\t"+labW+"\t"+labH+"\t");
}


void draw() {
//  pushMatrix();
  lights();
  translate(width/2,100,500);
//  meAn=(float(mouseX)-width/2)/50;
  rotateY(meAn);
//  translate(pX(meX-labW/2),0,-pZ(meZ-labH/2));
  translate(-32*sc*(meX-labW/2),0,32*sc*(meZ-labH/2));
  scale(sc);
  translate(0,h,0);
  background(0);
  noStroke();
//  directionalLight(0, 0, 0, -1,0,1);
//  emissive(0, 26, 51);
//  translate(pX(labW/2),2*height/3,pZ(labH/2));
//  popMatrix();
//  translate(0,100,0);
  drawLab();
  testing();
}

void keyPressed() {
  float newMeX=meX;
  float newMeZ=meZ;
  if(key=='w' || keyCode==UP) {
    newMeX=meX+0.2*sin(meAn);
    newMeZ=meZ+0.2*cos(meAn);
  }
  if(key=='s' || keyCode==DOWN) {
    newMeX=meX-0.2*sin(meAn);
    newMeZ=meZ-0.2*cos(meAn);
  }
  if(key=='a') {
    newMeX=meX+0.2*sin(meAn-PI/2);
    newMeZ=meZ+0.2*cos(meAn-PI/2);
  }
  if(key=='d') {
    newMeX=meX-0.2*sin(meAn-PI/2);
    newMeZ=meZ-0.2*cos(meAn-PI/2);
  }
  if(keyCode==LEFT) {
    meAn-=PI/16;
    //meX+=0.4*sin(meAn-PI/2);
    //meZ+=0.4*cos(meAn-PI/2);
  }
  if(keyCode==RIGHT) {
    meAn+=PI/16;
    //meX-=0.4*sin(meAn-PI/2);
    //meZ-=0.4*cos(meAn-PI/2);
  }
  
  if(lab[int(newMeX+0.3)][int(meZ+0.5)]!=0 || lab[int(newMeX+0.7)][int(meZ+0.5)]!=0) {
    newMeX=meX;
    //meZ=newMeZ;
  }
  if(lab[int(meX+0.5)][int(newMeZ+0.3)]!=0 || lab[int(meX+0.5)][int(newMeZ+0.7)]!=0) {
    //meX=newMeX;
    newMeZ=meZ;
  }
  
  meX=newMeX;
  meZ=newMeZ;
  
  if(keyCode==32) {
    transparent = transparent?false:true;
  }
  
  println(meX+"\t"+meZ+"\t"+meAn+"\t"+sin(meAn)+"\t_"+cos(meAn)+"\t ar: "+int(meX+0.5)+";"+int(meZ+0.5)+"\t ar: "+lab[int(meX+0.5)][int(meZ+0.5)]+"\t"+transparent);
}

float sX(float x) {
  x=x*width/labW;
  return(x);
}

float sZ(float z) {
  z=z*width/labH;
  return(z);
}

float pX(float x) {
  x=(x-labW/2)*width/labW;
  return(x);
}

float pZ(float z) {
  z=(-z+labH/2)*width/labH;
  return(z);
}

void brick(int x, int y) {
  pushMatrix();
  translate(pX(x),0,pZ(y));
  box(sX(1),60,sZ(1));
  popMatrix();
}

void testing() {
  pushMatrix();
  noFill();
  stroke(0,255,0);
  box(100,200,100);
  popMatrix();
}


void drawLab() {
  stroke(100);
  if(transparent) {
    noFill();
  } else {
    fill(220);
  }
  for(int z=0;z<labW;z++) {
    for(int x=0;x<labW;x++) {
     if(lab[x][z]==1) {
       brick(x,z);
     } 
    }
  }
}

