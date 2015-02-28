
int dir;
int chdir;
int mcirc;
int chmcirc;

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  //background(50,5,100);
  background(0);
  size(800, 800);
  strokeWeight(.1);
  smooth();
  dir=0;
  chdir=1;
  mcirc=0;
  chmcirc=1;
}
void draw() {

  fill(50, 10, 100, 10);
  if (mousePressed) {
    noFill();
  }
  rect(0, 0, height, width);
  stroke(0);
fill(50,10,100,75);
quad(mouseX,mouseY,pmouseX,pmouseY,pmouseY,pmouseX,mouseY,mouseX);{
    //if(mousePressed)



  dir+=1;
  mcirc+=1;
  chmcirc--;
  noFill();
if(mousePressed){  
        quad(400,chmcirc*3+400,mcirc*3+400,400,400,mcirc*3+400,chmcirc*3+400,400);
        quad(400,chmcirc*5+400,mcirc*5+400,400,400,mcirc*5+400,chmcirc*5+400,400);
        quad(400,chmcirc*7+400,mcirc*7+400,400,400,mcirc*7+400,chmcirc*7+400,400);
        quad(400,chmcirc*9+400,mcirc*9+400,400,400,mcirc*9+400,chmcirc*9+400,400);
        quad(400,chmcirc*11+400,mcirc*11+400,400,400,mcirc*11+400,chmcirc*11+400,400);}
        else{chmcirc=0;
              mcirc=0;}
  noStroke();
  for (int k=10;k<720;k+=75) {
    noStroke();
    fill(0, 80, 40, 5);
    if (mousePressed) {
      noFill();
      stroke(0, 0, 0, 50);
    }
    triangle(k, 0, k+100, 0, k+50, 100);
    triangle(k, 800, k+100, 800, k+50, 700);
    if (mouseY>200 && mouseY<600 && mouseX>200 && mouseX<600) {
      triangle(k, 0, k+100, 0, k+50, mcirc*10+100);
      triangle(k, 800, k+100, 800, k+50, chmcirc*10+700);
    }else{
      mcirc=0;
      chmcirc=0;
    }
    if (mcirc>=400) {
      mcirc=0;
    }
  }  
}

  for (int i=0;i<800;i+=45){
    for (int j=0;j<5;j+=5) {
      noFill();
      ellipse(i, j, 300, dir);
      ellipse(i, j+800, 300, dir);
      ellipse(j+400, i, 800, dir/3);
      stroke(0);
      ellipse(i,j+400,250,dir/2);
      ellipse(i,j+200,150,dir/2);
      ellipse(i,j+600,150,dir/2);
      


      dir+=chdir;
      if (dir>height*2) {
        chdir=-1;
      }
      if (dir<height/1.1) {
        chdir=1;
      }
      if (dir>200) {
        stroke(dir/3, dir/3, 50);
      }
    }
  }       
}

