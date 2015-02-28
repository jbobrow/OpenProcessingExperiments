
int x;
int y;
float rotIndex;
float rotIndex1;
PFont fontA;
float circle1X;
float circle1Y;
float reX;
float reY;
float OrgX = 230;
float OrgY = 230;
int colorValue;
int colorValue1;

void setup(){
  size (600,600);
 // background(255);
  x = 300;
  y = 300;
  fontA = createFont("Arial",40);
  textFont(fontA,40);

}

void draw(){
  smooth();
  circle1X = OrgX;
  circle1Y = OrgY;
  background(255);
  colorValue = color(0);
  colorValue1= color(0);
   
    if(mousePressed){
      circle1X = mouseX;
      circle1Y = mouseY;
     if (mouseX<300 && mouseY < 300){
       colorValue = color(100);
       colorValue1 = color(random(100));
     }
     if (mouseX<300 && mouseY >300){
       colorValue = color(255,191,69);
       colorValue1 = color(255,random(200),69);
     }
      if (mouseX>300 && mouseY <300){
       colorValue = color(84,194,183);
       colorValue1 = color(84,194,random(200));
     }
      if (mouseX>300 && mouseY > 300){
       colorValue = color(228,172,207);
       colorValue1 = color(228,random(200),207);
     }     
    }    
   
  fill(colorValue);//mid circle
  pushMatrix();
  rotIndex +=0.02;
  noStroke();
  translate(300,300);
  rotate(rotIndex);
  ellipse(0, 0, 300, 300);
  //up rect
  //rotate(PI/3.0);
  fill(colorValue1);
  rect(X+200,Y-200,100,100);
  rect(X+100,Y-300,100,100);
  //white circle
  fill(255);
  ellipse(X+100,Y,100,100);
   fill(colorValue);
   popMatrix();
   //fill(colorValue1);
   ellipse(circle1X,circle1Y,30,30);
   stroke(colorValue);
   line (circle1X,circle1Y,0,0);
   line (circle1X,circle1Y,0,60);
   line (circle1X,circle1Y,0,120);
   line (circle1X,circle1Y,0,180);
   line (circle1X,circle1Y,0,240);
   line (circle1X,circle1Y,0,300);
   line (circle1X,circle1Y,0,360);
   line (circle1X,circle1Y,0,420);
   line (circle1X,circle1Y,0,480);
   line (circle1X,circle1Y,0,540);
   line (circle1X,circle1Y,0,600);
   line (circle1X,circle1Y,60,0);
   line (circle1X,circle1Y,120,0);
   line (circle1X,circle1Y,180,0);
   line (circle1X,circle1Y,240,0);
   line (circle1X,circle1Y,300,0);
   line (circle1X,circle1Y,360,0);
   line (circle1X,circle1Y,420,0);
   line (circle1X,circle1Y,480,0);
   line (circle1X,circle1Y,600,0);
   line (circle1X,circle1Y,600,60);
   line (circle1X,circle1Y,600,120);
   line (circle1X,circle1Y,600,180);
   line (circle1X,circle1Y,600,240);
   line (circle1X,circle1Y,600,300);
   line (circle1X,circle1Y,600,360);
   line (circle1X,circle1Y,600,420);
   line (circle1X,circle1Y,600,480);
   line (circle1X,circle1Y,600,540);
   line (circle1X,circle1Y,600,600);
   line (circle1X,circle1Y,60,600);
   line (circle1X,circle1Y,120,600);
   line (circle1X,circle1Y,180,600);
   line (circle1X,circle1Y,240,600);
   line (circle1X,circle1Y,300,600);
   line (circle1X,circle1Y,360,600);
   line (circle1X,circle1Y,420,600);
   line (circle1X,circle1Y,480,600);
   line (circle1X,circle1Y,540,600);
   
   if(keyPressed){
    background(0);
       rotIndex1 -=0.03;
  fill(255);//mid circle
  pushMatrix();
  noStroke();
  translate(300,300);
  rotate(rotIndex1);
  rectMode(CENTER);
  rect(0, 0, 300, 300);
  fill(255);
  ellipse(X+200,Y-200,100,100);
  ellipse(X+100,Y-300,100,100);
  //white circle
  fill(0);
  ellipse(X+100,Y,100,100);
  popMatrix();
   stroke(random(255));
   line (circle1X,circle1Y,0,0);
   line (circle1X,circle1Y,0,60);
   line (circle1X,circle1Y,0,120);
   line (circle1X,circle1Y,0,180);
   line (circle1X,circle1Y,0,240);
   line (circle1X,circle1Y,0,300);
   line (circle1X,circle1Y,0,360);
   line (circle1X,circle1Y,0,420);
   line (circle1X,circle1Y,0,480);
   line (circle1X,circle1Y,0,540);
   line (circle1X,circle1Y,0,600);
   line (circle1X,circle1Y,60,0);
   line (circle1X,circle1Y,120,0);
   line (circle1X,circle1Y,180,0);
   line (circle1X,circle1Y,240,0);
   line (circle1X,circle1Y,300,0);
   line (circle1X,circle1Y,360,0);
   line (circle1X,circle1Y,420,0);
   line (circle1X,circle1Y,480,0);
   line (circle1X,circle1Y,600,0);
   line (circle1X,circle1Y,600,60);
   line (circle1X,circle1Y,600,120);
   line (circle1X,circle1Y,600,180);
   line (circle1X,circle1Y,600,240);
   line (circle1X,circle1Y,600,300);
   line (circle1X,circle1Y,600,360);
   line (circle1X,circle1Y,600,420);
   line (circle1X,circle1Y,600,480);
   line (circle1X,circle1Y,600,540);
   line (circle1X,circle1Y,600,600);
   line (circle1X,circle1Y,60,600);
   line (circle1X,circle1Y,120,600);
   line (circle1X,circle1Y,180,600);
   line (circle1X,circle1Y,240,600);
   line (circle1X,circle1Y,300,600);
   line (circle1X,circle1Y,360,600);
   line (circle1X,circle1Y,420,600);
   line (circle1X,circle1Y,480,600);
   line (circle1X,circle1Y,540,600);
     
   }
   
}
void mouseReleased() {
  OrgX = mouseX;
  OrgY = mouseY;
   ellipse(OrgX,OrgY,30,30);
  }

            
                
