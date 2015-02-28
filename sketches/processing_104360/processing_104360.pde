
int x;
boolean stop;
boolean reset1;
float mouseWidth;
float mousecolor1;
float mousecolor2;
boolean dragging;
void setup(){
  size(400,600);
  background(255);
  rectMode(CORNER);
  noStroke();
  x=0;
  stop=false;
  mouseWidth=0;
  mousecolor1=random(200);
  mousecolor2=0;
  frameRate(5);
  dragging = false;
  colorMode(HSB);
  reset1 = false;
}

void draw (){
    if(x<100  && stop==false){
      if(dragging && pmouseX!=mouseX){
      //HORIZONTAL
      fill(mousecolor1, mousecolor2 , (mousecolor1+mousecolor2)/255, 120 );
      rect(x, 0, (int)mouseWidth, height);
      rect(200-(int)mouseWidth-x, 0, (int)mouseWidth, height);
      rect(x+200, 0, (int)mouseWidth, height);
      rect(400-(int)mouseWidth-x, 0, (int)mouseWidth, height);
      //VERTICAL
      rect(0, x, width, (int)mouseWidth);
      rect(0, 200-(int)mouseWidth-x, width, (int)mouseWidth);
      rect(0, 200+x, width, (int)mouseWidth);
      rect(0, 400-(int)mouseWidth-x, width, (int)mouseWidth);
      rect(0, 400+x, width, (int)mouseWidth);
      rect(0, 600-(int)mouseWidth-x, width, (int)mouseWidth);
      //
      pushMatrix();
      translate(0,-50);
      rotate(radians(10));
      fill(0,255);
      rect(0,100,200,2);
      fill(mousecolor1, mousecolor2 , (mousecolor1+mousecolor2)/255, 200);
      rect(x, 0, (int)mouseWidth, 100);
      rect(200-(int)mouseWidth-x, 0, (int)mouseWidth, 100);
      rect(0, x, 200, (int)mouseWidth);
      popMatrix();
      pushMatrix();
      translate(200,-15);
      rotate(radians(-10));
      fill(0,255);
      rect(0,100,200,2);
      fill(mousecolor1, mousecolor2 , (mousecolor1+mousecolor2)/255, 200);
      rect(x, 0, (int)mouseWidth, 100);
      rect(200-(int)mouseWidth-x, 0, (int)mouseWidth, 100);
      rect(0, x, 200, (int)mouseWidth);
      popMatrix();
      if(x+mouseWidth>100){
        x=100-x;
        stop=true;
      }else{
        x+=mouseWidth;
      }  
    }
  }if(stop==true){
    ellipseMode(CENTER);
    colorMode(RGB);
    fill(255,255,255,200);
    //ellipse(200,30,40,40);
    ellipse(200,180,40,40);
    ellipse(200,330,40,40);
    ellipse(200,480,40,40);
    fill(0,0,0,255);
    //ellipse(200,30,30,30);
    ellipse(200,180,30,30);
    ellipse(200,330,30,30);
    ellipse(200,480,30,30);
    rect(160,80,2,height);
    rect(240,80,1,height);
    //fill(200,200,200,250);
    //triangle(-50,0,150,80,200,0);
    //triangle(450,0,250,80,200,0);
    stop=false;
    x=201;
  }if (reset1 == true){
    fill(255,255,255,255);
    rect(0,0, width, height);
    mouseWidth=0;
    x=0;
    reset1=false;
  }
}
void mouseDragged(){
  if(pmouseX!=mouseX){
  mouseWidth=map(mouseX, 0,width,1,50);
  mousecolor1=map(mouseX/2, 0, width/2,100,200);
  mousecolor2=map(mouseY, 0,height,0,255);
  dragging=true;
  }
}
void mouseClicked(){
  if(x>=200){
    reset1=true;
  }
}
