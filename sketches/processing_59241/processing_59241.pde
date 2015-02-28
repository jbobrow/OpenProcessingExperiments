
float[] spheres = new float[16];
String[] words = {"something happens.","circle","wonders","why","he","is","here.","circle","wonders","if","he","ever","was","a","square.","this is doubtful."};
boolean[] collected = new boolean[16];

color bGround=color(0), pColor=color(255);
int borderWeight=5,x,y,borderColor=255, deathCount=0, collectCount=0;
float xVel=0, yVel=0;
boolean U=false,D=false,L=false,R=false,redBorder=false,centerGrav=true,end=false,bounce=true;

void setup() {
  size(601,601);
  background(bGround);
  x=width/2;
  y=17+2*borderWeight;
  ellipseMode(CENTER);
  smooth();
  for(int i=0;i<16;i++) {
    spheres[i] = random(0,3.14159);
    collected[i] = false;
  }
  textFont(loadFont("Courier10PitchBT-Bold-22.vlw"));
  textAlign(CENTER);
}

void draw() {
  fill(bGround);
  strokeWeight(borderWeight);
  if(collectCount!=16){
  if(frameCount%20==0) redBorder=!redBorder;
  if(redBorder) stroke(255,0,0);
  else stroke(255);
  }
  else {stroke(255);end=true;}
  rect(borderWeight,borderWeight,width-2*borderWeight,height-2*borderWeight);
  strokeWeight(0);
  stroke(0);
    for(int i=0;i<16;i++) {
      if(collected[i]) {
        fill(255-int(float(abs(16-i))/16*255),int(float(abs(16-i))/16*255),255-int(float(abs(8-i))/8*255)/*,255-int(abs(200-(380*spheres[i]/6.28))/200*255)*/);
        text(words[i],width/2,75+i*30);
      }
    }
    for(int i=0;i<16;i++) {
      if(i%2==0){
        if(i%4==0) spheres[i]+=random(.01,.03);
        else spheres[i]+=random(0,.02);
      }
      else {
        if((i-1)%2==0){
        if((i-1)%4==0) spheres[i]-=random(.01,.03);
        else spheres[i]-=random(0,.02);
        }
      }
      if(!collected[i]) {
        fill(255-int(float(abs(16-i))/16*255),int(float(abs(16-i))/16*255),255-int(float(abs(8-i))/8*255)/*,255-int(abs(200-(380*spheres[i]/6.28))/200*255)*/);
        ellipse((width/2-50)*cos(spheres[i])+width/2,(height/2-50)*sin(spheres[i])+height/2,20,20);
      if(x+xVel+20>(width/2-50)*cos(spheres[i])+width/2&&x+xVel-20<(width/2-50)*cos(spheres[i])+width/2) {
        if(y+yVel+20>(height/2-50)*sin(spheres[i])+height/2&&y+yVel-20<(height/2-50)*sin(spheres[i])+height/2) {
        collected[i]=true;
        if(bounce){
        xVel=-xVel;
        yVel=-yVel;
        }
         if(centerGrav){D=true;U=false;L=false;R=false;}
         else{U=false;D=false;L=false;R=false;}
         centerGrav=!centerGrav;
         collectCount++;
        }
      }
      }
    }
  update();
  move();
  display();
}

void display() {
  fill(pColor);
  stroke(0);
  strokeWeight(1);
  ellipse(x,y,30,30);
  fill(0);
  text(deathCount,x,y+7);
}
  
void update() {
  if(centerGrav) {
  if (U&&-10<yVel) yVel-=.25;
  if (D&&10>yVel) yVel+=.25;
  if (L&&-10<xVel) xVel-=.25;
  if (R&&10>xVel) xVel+=.25;
  
  if (x<width/2) {xVel+=.2;
    if (x>=width/4&&xVel>0) xVel-=.1;
  }
  if (x>width/2) {xVel-=.2;
    if (x<=3*width/4&&xVel<0) xVel+=.1;
  }
  if (y<height/2) {yVel+=.2;
    if (y>=height/4&&yVel>0) yVel-=.1;
  }
  if (y>height/2) {yVel-=.2;
    if (y<=3*height/4&&yVel<0) yVel+=.1;
  }
  
  }
  else {
  if (U&&-10<yVel) yVel-=.2;
  else if (yVel<0) yVel+=.1;
  if (D&&10>yVel) yVel+=.2;
  else if (yVel>0) yVel-=.1;
  if (L&&-10<xVel) xVel-=.2;
  else if (xVel<0) xVel+=.1;
  if (R&&10>xVel) xVel+=.2;
  else if (xVel>0) xVel-=.1;
  }
}

void move() {
  if (17+borderWeight<x+xVel&&x+xVel<width-borderWeight-17) {x+=(int)xVel;}
  else {
  if(!end) {x=width/2+1;y=height/2+1;deathCount++;}
  else {centerGrav=false;xVel=-xVel*.9;}
  }
  if (17+borderWeight<y+yVel&&y+yVel<height-borderWeight-17) {y+=(int)yVel;}
  else {
  if(!end) {x=width/2-1;y=height/2-1;deathCount++;}
  else {centerGrav=false;yVel=-yVel*.9;}
  }
}

void colorChange() {
  pColor=color((int)random(255),(int)random(255),(int)random(255));
}

void keyPressed() {
   if (key=='p') {bounce=!bounce;}
  if(centerGrav) {
   if (key=='w') {U=true;}
   if (key=='s') {D=true;}
   if (key=='a') {L=true;}
   if (key=='d') {R=true;}
  }
  else {
  if (key=='w') {U=true;D=false;L=false;R=false;}
  if (key=='s') {D=true;U=false;L=false;R=false;}
  if (key=='a') {L=true;U=false;D=false;R=false;}
  if (key=='d') {R=true;U=false;D=false;L=false;}
  }
}

void keyReleased() {
  if(centerGrav){
  if (key=='w') {U=false;}
  if (key=='s') {D=false;}
  if (key=='a') {L=false;}
  if (key=='d') {R=false;}
  }
}

