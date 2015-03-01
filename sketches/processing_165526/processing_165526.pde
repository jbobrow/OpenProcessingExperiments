



class Korean{
  
  PVector koreanPos=new PVector(0,0);
  PVector koreanVel=new PVector(5,5);
  float size;
  float xPos;
  float yPos;
  float speed;
  int j;
  //for changing mouth
  ArrayList<PVector> circle = new ArrayList<PVector>();
ArrayList<PVector> square = new ArrayList<PVector>();

// An ArrayList for a third set of vertices, the ones we will be drawing
// in the window
ArrayList<PVector> morph = new ArrayList<PVector>();

// This boolean variable will control if we are morphing to a circle or square
boolean state = false;


 
void define(){
    xPos=random(-30,1230);
  yPos=random(-30,830);
  size=3;
  speed=6;
  }
  
void update(float s, float h,float cc, float m, float w, int j){
 float choose;
  color haircolor=color(0);
  
  float starvingc=s;
  float hairc=h;
  float colorc=cc;
  float mouthc=m;
  float wordsc=w;
  int pos=10*j;
  //face
  noStroke();
  fill(254, 201, 169);
  ellipse(xPos+35, yPos+45, 70, 90);
  noStroke();
  fill(254, 201, 169);
  rect(xPos, yPos, 70, 50);
  
  
  if(starvingc<=1){
//starving
  noStroke();
  fill(180);
  ellipse(xPos+13, yPos+65, 15, 15);
  noStroke();
  fill(254, 201, 169);
  ellipse(xPos+12, yPos+66, 13, 17);
  noStroke();
  fill(180);
  ellipse(xPos+57, yPos+65, 15, 15);
  noStroke();
  fill(254, 201, 169);
  ellipse(xPos+58, yPos+66, 13, 17);
  }
  else{}

  
//choose hair

    if (hairc<=1) {
     
    if (colorc<=2) {
      haircolor=color(0);
    } else if (colorc>2&&colorc<=4) {
      haircolor=color(15, 32, 54);
    } else if (colorc>4) {
      haircolor=color(43, 8, 15);
    }
  //A hair
noStroke();
fill(haircolor);
triangle(xPos-10,yPos+20,xPos+35,yPos-20,xPos+80,yPos+20);
 noStroke();
fill(haircolor);
triangle(xPos-8,yPos+18,xPos+6,yPos-14,xPos+28,yPos+6);
 noStroke();
fill(haircolor);
 triangle(xPos-6,yPos+18,xPos+20,yPos-19,xPos+65,yPos+16);
  noStroke();
  fill(haircolor);
  triangle(xPos+40,yPos-10,xPos+75,yPos-10,xPos+70,yPos+25);
 noStroke();
 fill(haircolor);
 triangle(xPos-10,yPos+20,xPos+35,yPos-20,xPos+85,yPos+30);
    }
    else if(hairc>1&&hairc<=2){

    if (colorc<=2) {
      haircolor=color(0);
    } else if (colorc>2&&colorc<=4) {
      haircolor=color(15, 32, 54);
    } else if (colorc>4) {
      haircolor=color(43, 8, 15);
    }
  //B hair
noStroke();
fill(haircolor);
triangle(xPos-5,yPos+20,xPos+35,yPos-30,xPos+75,yPos+20);
noStroke();
fill(haircolor);
ellipse(xPos+35,yPos,80,60);
    }
    else if(hairc>2&&hairc<=3){
    if (colorc<=2) {
      haircolor=color(0);
    } else if (colorc>2&&colorc<=4) {
      haircolor=color(15, 32, 54);
    } else if (colorc>4) {
      haircolor=color(43, 8, 15);
    }
  //C hair
noStroke();
fill(haircolor);
 triangle(xPos-5,yPos+20,xPos+35,yPos-30,xPos+75,yPos+20);
noStroke();
fill(haircolor);
ellipse(xPos+35,yPos,90,60);
noStroke();
fill(haircolor);
rect(xPos-10,yPos,90,100);
noStroke();
 fill(254,201,169);
ellipse(xPos+35,yPos+45,60,70);
noStroke();
 fill(254,201,169);
 rect(xPos+5,yPos+9,60,30);
    }
    else if(hairc>3&&hairc<=4){
     
    if (colorc<=2) {
      haircolor=color(0);
    } else if (colorc>2&&colorc<=4) {
      haircolor=color(15, 32, 54);
    } else if (colorc>4) {
      haircolor=color(43, 8, 15);
    }
  //D hair
noStroke();
fill(haircolor);
triangle(xPos-5,yPos+20,xPos+35,yPos-30,xPos+75,yPos+20);
noStroke();
fill(haircolor);
ellipse(xPos+35,yPos,90,60);
noStroke();
fill(haircolor);
rect(xPos-10,yPos,90,100);
noStroke();
fill(254,201,169);
ellipse(xPos+35,yPos+45,60,70);
noStroke();
 fill(254,201,169);
rect(xPos+5,yPos+9,60,30);
noStroke();
fill(254,201,169);
triangle(xPos+31,yPos+9,xPos+34,yPos-3,xPos+37,yPos+9); 
    }
    else if(hairc>4&&hairc<=5){
    if (colorc<=2) {
      haircolor=color(0);
    } else if (colorc>2&&colorc<=4) {
      haircolor=color(15, 32, 54);
    } else if (colorc>4) {
      haircolor=color(43, 8, 15);
    }
  //E hair
noStroke();
fill(haircolor);
triangle(xPos-5,yPos+20,xPos+35,yPos-30,xPos+75,yPos+20);
noStroke();
fill(haircolor);
ellipse(xPos+35,yPos,90,60);
noStroke();
fill(haircolor);
rect(xPos-10,yPos,90,70);
noStroke();
fill(254,201,169);
ellipse(xPos+35,yPos+45,60,70);
noStroke();
 fill(254,201,169);
 rect(xPos+5,yPos+9,60,30);
noStroke();
fill(254,201,169);
triangle(xPos+31,yPos+9,xPos+34,yPos-3,xPos+37,yPos+9); 
    }
    else if(hairc>5&&hairc<=6){
      if (colorc<=2) {
      haircolor=color(0);
    } else if (colorc>2&&colorc<=4) {
      haircolor=color(15, 32, 54);
    } else if (colorc>4) {
      haircolor=color(43, 8, 15);
    }
  //F hair
noStroke();
fill(haircolor);
ellipse(xPos+35,yPos,90,60);
noStroke();
fill(254,201,169);
ellipse(xPos+35,yPos+45,60,70);
noStroke();
fill(254,201,169);
rect(xPos,yPos+9,70,30);
 noStroke();
fill(254,201,169);
triangle(xPos+31,yPos+9,xPos+34,yPos-3,xPos+37,yPos+9); 

    }
    else if(hairc>6){
      choose=random(0, 6);
    if (colorc<=2) {
      haircolor=color(0);
    } else if (colorc>2&&colorc<=4) {
      haircolor=color(15, 32, 54);
    } else if (colorc>4) {
      haircolor=color(43, 8, 15);
    }
  //G hair

    noStroke();
    fill(haircolor);
    ellipse(xPos+35, yPos, 90, 60);
    noStroke();
    fill(254, 201, 169);
    ellipse(xPos+35, yPos+45, 60, 70);
    noStroke();
    fill(254, 201, 169);
    rect(xPos, yPos+9, 70, 30);
    noStroke();
    fill(haircolor);
    ellipse(xPos+35, yPos-30, 30, 20);
    }


  //choose mouth
  
  if(mouthc<=1){
  //A mouth
 noStroke();
fill(0);
rect(xPos+27, yPos+65, 15, 2);
  }else if(mouthc<=2&&mouthc>1){

//B mouth
stroke(0);
fill(254, 201, 169);
ellipse(xPos+34, yPos+67, 10, 4);
  }else if(mouthc<=3&&mouthc>2){
//C mouth
stroke(0);
fill(254, 150,150);
ellipse(xPos+34, yPos+67, 13, 10);
  }else if(mouthc<=4&&mouthc>3){
//D mouth
float mouthheight=2;
for(mouthheight=2;mouthheight<=11;mouthheight=mouthheight+0.01){
stroke(0);
fill(254, 150,150);
ellipse(xPos+34, yPos+67, 13, mouthheight);
  }
  }
  else if(mouthc>4){
// E mouth
//for changing mouth===============================================
   // Create a circle using vectors pointing from center
  for (int angle = 0; angle < 360; angle += 9) {
    // Note we are not starting from 0 in order to match the
    // path of a circle.  
    PVector v = PVector.fromAngle(radians(angle-135));
    v.mult(10);
    circle.add(v);
    // Let's fill out morph ArrayList with blank PVectors while we are at it
    morph.add(new PVector());
  }

  // A square is a bunch of vertices along straight lines
  // Top of square
  for (int x = - 5; x < 5; x += 1) {
    square.add(new PVector(x, -5));
  }
  // Right side
  for (int y = -5; y < 5; y += 1) {
    square.add(new PVector(5, y));
  }
  // Bottom
  for (int x = 5; x > -5; x -= 1) {
    square.add(new PVector(x, 5));
  }
  // Left side
  for (int y = 5; y > -5; y -= 1) {
    square.add(new PVector(-5, y));
  }
  
  
  //==============================for changing mouth=========================
  
  float totalDistance = 0;
  
  // Look at each vertex
  for (int i = 0; i < circle.size(); i++) {
    PVector v1;
    // Are we lerping to the circle or square?
    if (state) {
      v1 = circle.get(i);
    }
    else {
      v1 = square.get(i);
    }
    // Get the vertex we will draw
    PVector v2 = morph.get(i);
    // Lerp to the target
    v2.lerp(v1, 0.1);
    // Check how far we are from target
    totalDistance += PVector.dist(v1, v2);
  }
  
  // If all the vertices are close, switch shape
  if (totalDistance < 0.1) {
    state = !state;
  }
  
  // Draw relative to center
  translate(xPos+35,yPos+65);
  strokeWeight(1);
  // Draw a polygon that makes up all the vertices
  beginShape();
  fill(254, 150,150);
  stroke(1);
  for (PVector v : morph) {
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
}


//choose text

if(wordsc<=1){
  textSize(14);
  fill(255);
text("Where are you?", xPos-10, yPos+100); 
}
else if(wordsc>1&&wordsc<=2){
 textSize(14);
  fill(255);
text("Sun of the Communist Future", xPos-40, yPos+100);  
}
else if (wordsc<3&&wordsc>=2){
   textSize(14);
  fill(255);
text("Dear Leader Kim Jong Un", xPos-20, yPos+100); 
}
else if (wordsc>3&&wordsc<=4){
   textSize(14);
  fill(255);
text("Sun of Socialism", xPos-25, yPos+100); 
}
else if (wordsc>4){
   textSize(14);
  fill(255);
text("Where are you?", xPos-10, yPos+100); 
}
//movement
if(d>10) {
  
  if(xPos>kim.xPos-190){
    speed=30;
    xPos=lerp(xPos, kim.xPos+pos/5, lerp);
  }else if(xPos<=kim.xPos-190){
    speed=30;
    xPos=lerp(xPos, kim.xPos-pos*5, lerp);}
    if(yPos>kim.yPos-130){
      speed=30;
    yPos=lerp(yPos, kim.yPos+pos/5, lerp);}
    else if(yPos<=kim.yPos+180){
      speed=30;
    yPos=lerp(yPos, kim.yPos-pos*5, lerp);
  }
}
  else{
    speed=0;
  } 
  
  if(xPos>kim.xPos-200&&xPos<kim.xPos&&yPos>kim.yPos-200&&yPos<kim.yPos)
  {
  speed=-speed*2;
  }
  
  //boundary
  
 
}//for update
}//for class

class Kim{
  float xPos;
  float yPos,reyePosx,leyePosx,eyePosy;
 float size=1;

void define(int _xPos,int _yPos){
  xPos=_xPos;
  yPos=_yPos;
  leyePosx=xPos-133;
  reyePosx=xPos-87;
  eyePosy=yPos-164;
  
  
  
  //boundary setting
  if(xPos<=160){
    xPos=160;
  leyePosx=27;
  reyePosx=73;
}
   if(xPos>=1601){
     xPos=1601;
     leyePosx=1468;
     reyePosx=1514;
   }
    if(yPos<=299){
    yPos=299;
  eyePosy=135;
}
    
}

void update(){
  //what does he look like
  //face
   noStroke();
  fill(254,201,169);
ellipse(xPos-110,yPos-135,220,200);
noStroke();
  fill(254,201,169);
  rect(xPos-199,yPos-280,180,100);

//hair
noStroke();
fill(0);
//quad(xPos-110,yPos-240,xPos-95,yPos-290,xPos-30,yPos-240,xPos-20,yPos-200);
rect(xPos-199,yPos-280,80,65);
noStroke();
fill(0);
//quad(xPos-110,yPos-240,xPos-95,yPos-290,xPos-30,yPos-240,xPos-20,yPos-200);
rect(xPos-99,yPos-280,80,65);

noStroke();
fill(254,201,169);
ellipse(xPos-139,yPos-245,60,48);
noStroke();
fill(254,201,169);
ellipse(xPos-149,yPos-212,60,60);
noStroke();
fill(254,201,169);
ellipse(xPos-81,yPos-245,60,48);
noStroke();
fill(254,201,169);
ellipse(xPos-61,yPos-212,60,60);
noStroke();
fill(254,201,169);
ellipse(xPos-100,yPos-212,60,60);

noStroke();
fill(0);
ellipse(xPos-155,yPos-270,100,50);
noStroke();
fill(0);
ellipse(xPos-65,yPos-270,100,50);

noStroke();
fill(0);
rect(xPos-199,yPos-212,20,3);

noStroke();
fill(0);
rect(xPos-32,yPos-212,13,3);

//eyebrow
noStroke();
fill(0);
quad(xPos-153,yPos-184,xPos-133,yPos-188,xPos-132,yPos-185,xPos-158,yPos-180);
noStroke();
fill(0);
quad(xPos-67,yPos-184,xPos-87,yPos-188,xPos-88,yPos-185,xPos-62,yPos-180);

//eyes
noStroke();
fill(255);
ellipse(leyePosx,eyePosy,30,30);
noStroke();
fill(255);
ellipse(reyePosx,eyePosy,30,30);
noStroke();
fill(0);
ellipse(leyePosx-(leyePosx-800)/64,eyePosy-(eyePosy-400)/32,5,5);
noStroke();
fill(0);
ellipse(reyePosx-(reyePosx-800)/64,eyePosy-(eyePosy-400)/32,5,5);

//nose
strokeWeight(2);
stroke(0);
fill(254,201,169);
ellipse(xPos-110,yPos-134,10,10);
noStroke();
fill(254,201,169);
ellipse(xPos-110,yPos-134,10,10);

//mouth
strokeWeight(2);
stroke(0);
fill(254,201,169);
ellipse(xPos-110,yPos-94,35,15);
noStroke();
  fill(254,201,169);
  rect(xPos-150,yPos-93,90,20);
strokeWeight(1);
stroke(0);
fill(254,201,169);
ellipse(xPos-110,yPos-55,30,30);
noStroke();
fill(254,201,169);
rect(xPos-140,yPos-64,60,25);


//MOVEMENT

}
}

//thanks to processing reference document and examples
//thanks to open resource. In this program I recited a part of the text input code from this website:
//http://www.learningprocessing.com/examples/chapter-18/example-18-1/

PImage flag;
int popularity=200;
Korean[] korean= new Korean[popularity];
Kim kim;
float d;
float lerp = .01;
float h,s,cc,w,m;
float[][] looks=new float[popularity][5];
PFont f;
String typing = "";
String saved = "";

void setup() {
  size(1200, 800);
  flag = loadImage("flag.png");
  smooth();
   f = createFont("Arial",16,true);
  
  for(int j=0;j<popularity;j++){
      looks[j][0]=random(2);
      looks[j][1]=random(7);
      looks[j][2]=random(6);
      looks[j][3]=random(5);
      looks[j][4]=random(5);
      
    }
    
  
  
  
  for (int i=0;i<korean.length;i++) {
    korean[i] = new Korean();
    korean[i].define();
  }
}

void draw() {
  background(255);
  image(flag, 0, 0);
 int indent = 25;
  
  // Set the font and fill for text
  textFont(f,24);
  fill(255);
  
  // Display everything
  text("Click blank to input the number of loyal citizens who are trying to find you. Press Enter to finish.\nYou can create or kill them as you want. Shake Kim Jong Un near the crowd to dispel the people.", indent, 40);
  text(parseInt(typing),indent,110);
  popularity=parseInt(saved);
  kim = new Kim();
  kim.define(mouseX,mouseY+50);
  kim.update();
  
  for(int j=0;j<popularity;j++){
//    for (int m=1; m<korean.length-1; m++) {
  d=dist(kim.xPos,kim.yPos,korean[j].xPos,korean[j].yPos);
  korean[j].update(looks[j][0],looks[j][1],looks[j][2],looks[j][3],looks[j][4],j);

}
for (int k=0; k<korean.length; k++) {
    for (int m=1; m<korean.length-1; m++) {
      if (dist(korean[k].xPos, 0, korean[m].xPos, 0) < (korean[k].size)/2
        ||
        dist(korean[k].yPos, 0, korean[m].yPos, 0) < (korean[k].size)/2 ) {
      }
    }
  }
  
  
}
  

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    saved = typing;
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key; 
  }
}



