
PImage img1;
PImage img2;
PImage img3;
PImage img4;
int s1=0;
int s2=0;
int s3=0;
int s4=0;

int x1=0;
int y1=0;
int x2=0;
int y2=156;
int x3=0;
int y3=y2*2;
int x4=0;
int y4=y2*3;
void setup(){
  size(650,640);
  img1=loadImage("stevenSeagal1.jpg");
  img2=loadImage("stevenSeagal2.jpg");
  img3=loadImage("stevenSeagal3.jpg");
  img4=loadImage("stevenSeagal4.jpg");

  
}
void draw(){
  background(0);
  strokeWeight(3);
  fill(100);
  rect(220,156,398,316);
  
  image(img1,0,0);
  image(img1,x1,y1);
  
  image(img2,0,156);
  image(img2,x2,y2);
  
  image(img3,0,156*2);
  image(img3,x3,y3);
  
  noTint();
  image(img4,0,156*3);
  image(img4,x4,y4);
  //prima immagine
  if(mousePressed && mouseX>0 && mouseX<198 && mouseY>0 && mouseY<156){
  //image(imageVariable,x,y,width,height);
    s1=1;
  }
  if(s1==1){
    tint(255,0,0);
    image(img1,mouseX,mouseY);
    noTint();
    x1=mouseX;
    y1=mouseY;
  }
  
  //seconda immagine
  if(mousePressed && mouseX>0 && mouseX<198 && mouseY>156 && mouseY<156*2){
  //image(imageVariable,x,y,width,height);
    s2=1;
  }
  if(s2==1){
    tint(255,0,0);
    image(img2,mouseX,mouseY);
    noTint();
    x2=mouseX;
    y2=mouseY;
  }
  
  //terza immagine
  if(mousePressed && mouseX>0 && mouseX<198 && mouseY>156*2 && mouseY<156*3){
  //image(imageVariable,x,y,width,height);
    s3=1;
  }
  if(s3==1){
    tint(255,0,0);
    image(img3,mouseX,mouseY);
    noTint();
    x3=mouseX;
    y3=mouseY;
  }
  
  //seconda immagine
  if(mousePressed && mouseX>0 && mouseX<198 && mouseY>156*3 && mouseY<156*4){
  //image(imageVariable,x,y,width,height);
    s4=1;
  }
  if(s4==1){
    tint(255,0,0);
    image(img4,mouseX,mouseY);
    noTint();
    x4=mouseX;
    y4=mouseY;
  }
  
}
void mouseReleased(){
s1=0;
s2=0;
s3=0;
s4=0;

}


