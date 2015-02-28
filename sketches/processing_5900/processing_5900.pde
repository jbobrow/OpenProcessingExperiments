
float prvRotate=0;
int rotateAmt=15;

void setup(){

  size(320,240,P2D);
  background(0);
  //smooth();
  frameRate(24);
}

void draw(){
  
  //PFont myFont=loadFont("Font.vlw");
  //recordar que la fuente toca declararla en el draw

  PImage feedback=get();
  //textFont(myFont);

  pushMatrix();
  tint(230,230,255);
  int transXAmt=(int)(mouseX/2+random(width/10));
  int transYAmt=(int)(mouseY/2+random(width/10));
  translate(transXAmt ,transYAmt);

  if(mousePressed){
    rotateAmt=-rotateAmt;
  }

  prvRotate=(rotateAmt-prvRotate)*0.5+prvRotate;
  rotate(radians(prvRotate));

  translate(-transXAmt,-transYAmt);
  scale(0.95);
  // background(0);//para eliminar los artefactos en los bordes :D
  image(feedback,0,0);
  //textSize(random(width/50)+width/8);
  //textAlign(CENTER);
  //fill(200);
  //text("Space Monkey",width/2,height/3*2);
  popMatrix();

  stroke(255,200);
  noFill();
  strokeWeight(width/200);
  if(frameCount%3==0 /* && (keyPressed==true && key!= 'b')*/){
    rect(random(width/4,width/2)+width/4,random(height/4,height/2)+height/4,width/2,height/2);
    //stroke(0,150);
    //rect(random(0,width/2)+width/4,random(0,height/2)+height/4,width/2,height/2);


  }
  //saveFrame("feedbackTst1.####.jpg");
}


