
float liney, linex, mouseclick;
int linewidth=mouseY;
int sx=width/2;
int sy=height/2;
boolean p=false;
int branchpos;
int mx,my;

float r; 
float g; 
float b; 
float a; 
float diam; 
float x; 
float y;
int v;
int angle = 0;

int branchnum=10;

int mouseCounter=0;
//boolean branch1bool=false;
//int branch1posY,branch1posX;

boolean [] branchp= new boolean [branchnum];
int []branchposY= new int [branchnum];   //length

float haha=random(255);
//float hehe=random(80);
void setup()
{
  size (600, 900);
  background(0);
  smooth();
  for (int i=0; i<branchnum; i++) {
    branchp[i]=false;
    branchposY[i]=height/(i+1);
  }
}
void draw()
{
  r=random(255); 
  g=random(255); 
  b=random(255); 
  a=random(100); 
  diam=random(10); 
  //  x=random(width/2); 
  //  y=random(height); 
  x=random(-200, 400);
  y=random(100, 300)-350;
  // Use values to draw an ellipse 
  //stroke (haha, random(mouseX/10, mouseY/10), random(mouseX/10, mouseY), 20);
  stroke(255);

  ///////////************************/////////////
  // background(240);
  // stroke (haha, random(mouseX/10, mouseY/10), random(mouseX/10, mouseY), 20);
  //strokeWeight(mouseY%5);
  pushMatrix();
  translate(width/2, height/2+200);
  line(0, 0, 0, -400);  //trunk
  popMatrix();
  if (keyPressed) {
    noStroke(); 
    fill(r, g, b, a); 
    ellipse(x+300, y+500, diam, diam);
    
    angle += 15;
    float val = cos(radians(angle)) * 6;
    //println(val);
    for (int j = 0; j < 360; j += 45) {
      float xoff = cos(radians(j)) * val;
      float yoff = sin(radians(j)) * val;
      fill(r, g, b, a); 
        ellipse( xoff+mouseX,mouseY + yoff, val, val);
      }
      fill(255);
        ellipse( mouseX,mouseY ,2,2);
  }
  if (branchp[0]) {  //if first click
    //branchpos=branchposY[0];
    pushMatrix();
    translate(width/2, branchposY[0]);
    rotate(random(HALF_PI*.6, -2*PI/random(1, 6)));
    line(0, 0, 0, -height/8);//branch1

    translate(0, random(-20, -branchposY[0]));
    rotate(random(HALF_PI*.6, -2*PI/random(1, 6)));
    scale(random(.3, .7));
    line(0, 0, 0, -height/13);//branch1
    translate(0, random(-20, -branchposY[0]));
    rotate(random(HALF_PI*.6, -2*PI/random(1, 6)));
    scale(random(.3, .7));
    line(0, 0, 0, -height/18);//branch1

    popMatrix();
  }
  if (branchp[1]) {
    //branchpos=branchposY[1]-height/2;
    pushMatrix();
    translate(width/2, branchposY[1]);
    rotate(-QUARTER_PI);

    line(0, 0, 0, -height/6);//branch1
    translate(0, random(-height/6+30, -branchposY[1]));
    rotate(random(HALF_PI*.6, -2*PI/random(1, 6)));
    scale(random(.3, .7));
    line(0, 0, 0, -height/10);//branch1
    translate(0, random(-height/10+30, -branchposY[1]));
    rotate(random(HALF_PI*.6, -2*PI/random(1, 6)));
    scale(random(.3, .7));
    line(0, 0, 0, -height/18);//branch1
    popMatrix();
  }
  if (branchp[2]) {
    //branchpos=branchposY[1]-height/2;
    pushMatrix();
    translate(width/2, branchposY[2]);
    rotate(QUARTER_PI);

    line(0, 0, 0, -height/5);//branch1
    translate(0, random(-height/6+40, -branchposY[2]));
    rotate(random(HALF_PI*.8, -2*PI/random(1, 6)));
    scale(random(.9, .7));
    line(0, 0, 0, -height/10);//branch1
    translate(0, random(-height/10+30, -branchposY[2]));
    rotate(random(HALF_PI*.3, -2*PI/random(1, 6)));
    scale(random(.3, .7));
    line(0, 0, 0, -height/15);//branch1
    popMatrix();
  }
  
    if (branchp[3]) {
    pushMatrix();
    translate(width/2, branchposY[3]);
    rotate(-QUARTER_PI*89);

    line(0, 0, 0, -height/6);//branch1
    translate(0, random(-height/6+30, -branchposY[3]));
    rotate(random(HALF_PI*.3, -2*PI/random(1, 6)));
    scale(random(.3, .7));
    line(0, 0, 0, -height/10);//branch1
    translate(0, random(-height/10+30, -branchposY[3]));
    rotate(random(HALF_PI*.6, -2*PI/random(1, 6)));
    scale(random(.3, .7));
    line(0, 0, 0, -height/18);//branch1
    popMatrix();
  }
 
  println(branchposY[0]);
  println(branchposY[1]);
  println();
}

void mouseClicked() {
  if (mouseY>=height/2-200 && mouseY<=height/2+300 &&mouseX<=width/2+5 &&mouseX>=width/2-5) {
    mouseCounter++;

    if (mouseCounter==1) {
      branchp[0]=true;
      branchposY[0]=mouseY;
    }
   if (mouseCounter==2) {
      branchp[1]=true;
      branchposY[1]=mouseY;
    }
  if (mouseCounter==3) {
      branchp[2]=true;
      branchposY[2]=mouseY;
    }
        
  if (mouseCounter==4) {
      branchp[3]=true;
      branchposY[3]=mouseY;
    }
  }
}


