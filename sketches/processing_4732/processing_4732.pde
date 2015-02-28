
float recursions = 40;
float[] branchX = new float[1];
float[] branchY = new float[1];
float[] branchR = new float[1];
float[] tempR = new float[0];
float[] tempX = new float[0];
float[] tempY = new float[0];
float sw;

void setup(){
  sw = 30;
  branchR[0] = 270;
  branchX[0] = 400;
  branchY[0] = 700;
  size(800, 800);
  background(190, 235, 256);
  fill(255, 170);
  noStroke();
  drawCloud(150, 200, 300);
  drawCloud(700, 350, 200);
  //filter(BLUR, 8);
  fill(100, 200, 100);
  ellipse(400, 800, 1000, 300);
  smooth();
  //draw grass behind tree
  noFill();
  stroke(100, 200, 100);
  for(int i=0; i<width; i++){
    drawGrass(i, 655+((i-400)*(i-400))/2700, random(10)+15, boolean(int(random(2))));  
  }
  stroke(#764F14);
  //draw branches
  
  for(int i = 0; i<recursions; i++){
    strokeWeight(sw);
    sw -= 29/recursions;
    for(int j = 0; j<branchX.length; j++){
       if(i > 0){
         if(i % 5 == 0){
           int num = int(random(2)+2);
           for(int k = 0; k < num; k++){ 
             drawBranch(branchX[j], branchY[j], branchR[j], true, false);
           }
         } else{
           drawBranch(branchX[j], branchY[j], branchR[j], false, false); 
         }
       } else{
          drawBranch(branchX[j], branchY[j], branchR[j], true, true);
       }
     }
     branchX = tempX;
     tempX = new float[0];
     branchY = tempY;
     tempY = new float[0];
     branchR = tempR;
     tempR = new float[0];
  }
  //add leaves
  color[] leafColors = {#D56F2B, #D6593A, #F7BF6F, #F59D1B, #9E2525, #F97117};
  for(int i = 0; i<branchX.length; i++){
     noStroke();
     fill(leafColors[floor(random(leafColors.length))]);
     ellipse(branchX[i], branchY[i], random(4)+8, random(4)+8);
  }
  //add grass across tree
  stroke(100, 200, 100);
  for(int i = 0; i<40; i+=2){
    noFill();
     drawGrass(i+380, 720, 10+random(20), false);
  }
  
}
void draw(){}
void mouseClicked(){
  //if(mousePressed){
    branchX = new float[1];
    branchY = new float[1];
    tempX = new float[0];
    tempY = new float[0];
    setup();
    
  //}
}
void keyReleased(){
  if(key == ' '){
    saveImage("tree"); 
  }
}

void drawBranch(float x, float y, float r, boolean newBranch, boolean firstBranch){
  float rotation; 
  float lowerlimit;
  float upperlimit;
  int len = int(random(10)+7);
  float ang;
  if(firstBranch){
    len *= 1.2;
    ang = (r + random(10) - 5) * PI / 180;
    rotation = 0;
  } else {
     if(newBranch){ 
       len += 2;
         //angle cannot be less than 170, greater than 370
         //or deviate past 60 degrees of the parent branch
         if(r-170 < 60){ lowerlimit = r-170; } else{ lowerlimit = 60; }
         if(370-r < 60){ upperlimit = 370-r; } else{ upperlimit = 60; }
     } else{
         //same as before but with 10 degree deviation
         if(r-170 < 10){ lowerlimit = r-170; } else{ lowerlimit = 10; }
         if(370-r < 10){ upperlimit = 370-r; } else{ upperlimit = 10; }
     }
     rotation = random(upperlimit + lowerlimit)-lowerlimit;
     ang = (rotation + r) * PI / 180;
  }
   line(x, y, x+cos(ang)*len, y+sin(ang)*len);
   tempX = append(tempX, x+cos(ang)*len);
   tempY = append(tempY, y+sin(ang)*len);
   tempR = append(tempR, r+rotation);
}
void drawGrass(float x, float y, float len, boolean direction){
  float r = 3*PI/2;
  float X = x;
  float Y = y;
  float w = 2;
  strokeWeight(random(2)+1);
  if(direction) r += random(PI/10);
  else r-= random(PI/10);
  curve(x+len*(random(1)+1), y+len*2, x, y, x+cos(r)*len, y+sin(r)*len,  x, y);
}
void drawCloud(float x, float y, float s){
  for(int i = 0; i < 20; i++){
    ellipse(x+random(s)-s/2, y+random(s/5)-s/10, s, s*.8);
  }
}

void saveImage(String name){
  int s = second();
  int m = minute();
  int h = hour();
  int d = day();
  int mo = month();
  int y = year();
  
  String date = name+str(s)+str(m)+str(h)+str(d)+str(mo)+str(y);
  saveFrame(date+".png");
}

