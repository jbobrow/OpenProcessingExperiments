
int x=0;
int y=0;
float uppos;
float downpos;
boolean jump=false;
float leftpos;
float rightpos;
float lidpos=0;
void setup() {
  size(400,400);
  background(235);
  noStroke();
  smooth();
  frameRate(30);
  //no variable
}
void draw() {
  background(204);
  fill(0);
  stroke(0);
  strokeWeight(4);

  line(240+x,170,270+x,200);
  line(130+x,170,100+x,200);
  noStroke();
  leftpos=map(mouseX,0,width,145,195);
  rightpos=map(mouseX,0,width,175,220);
  uppos=map(mouseY,0,height,105,125);
  downpos=map(mouseY,0,height,105,125);
  rect(width/2-60+x,100,90,50); //head
  rect(width/2-60+x,155,90,80); //body
  rect(width/2-55+x,240,20,20); //feet
  rect(width/2+5+x,240,20,20); //feet
  fill(255);
  // rect(170,100,60,50);
  ellipse(leftpos+x,uppos,5,5);
  ellipse( rightpos+x,downpos,5,5);
  if(mousePressed==true||jump==true) {
    jump=false;
    background(204); //clean
    fill(100);
    rect(width/2-60+x,100,90,50); //head
    rect(width/2-60+x,155,90,80); //body
    rect(width/2-55+x,240,20,30); //feet
    rect(width/2+5+x,240,20,30); //feet
    fill(255);
    ellipse(leftpos+x,110,5,5);
    ellipse( rightpos+x,110,5,5);
    stroke(4);

    strokeWeight(4);
    stroke(100);
    line(240+x,170,270+x,140);
    line(130+x,170,100+x,140);
    noStroke();
    fill(245);
    triangle(185+x,130,175+x,140,195+x,140);
  }
  if(keyPressed) {
    if(key=='d') {
      x+=4;
    }
    else if(key=='a') {
      x-=4;
    }
    else if (key=='w'){
    jump=true;
    }
     else if (key=='s'){
       fill(255);
      rect(width/2-60+x,100,90,50); //head
    rect(width/2-60+x,155,90,80); //body
    rect(width/2-55+x,240,20,30); //feet
    rect(width/2+5+x,240,20,30); //feet
    stroke(255);
      line(240+x,170,270+x,200);
  line(130+x,170,100+x,200);
    }
  }


  ///////font area
  PFont font;
  font = loadFont("AppleGothic-48.vlw"); 
 
  fill(0, 102, 153);
  text("press 'w' or click me! I will jump. ",100, 20);
   text("press 'a' to left; press 'd' to right ",100, 40);
    text("press 's' I rest! ",100, 60);
  }


