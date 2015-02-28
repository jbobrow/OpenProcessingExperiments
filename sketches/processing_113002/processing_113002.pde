
int[] starX = new int[100];
int[] starY = new int[100];
color[] starColor = new color[1000];
PImage moon;
PImage back;
float xpos;
float ypos;
float xvel = 2;
float yvel = 1;
int imwidth;
int imheight;
PFont main;



 

void setup() {
  size(800, 640);
  smooth();
  noCursor();
  frameRate(30);
    for (int i = 0; i < 100; i++) {
    starX[i] =(int)random(width);
    starY[i] = (int)random(height);
    starColor[i] = color((int)random(0,120));
  }
  moon= loadImage("moon.png");
  back = loadImage("back.png");
  shapeMode(CENTER);
  imageMode(CENTER);
  
  xpos=width/2;
  ypos=height/2;
  imwidth=back.width;
  imheight=back.height;
  image(back,xpos, ypos);
  main = loadFont("main.vlw");
}
  

 
void draw() {
  
  
  background(13,30,53);
  
  //background
  
    for (int i = 0; i < 100; i++) {
      
    //fill(random(100,255));
    if (random(10) < 1) {
      starColor[i] = (int)random(100,160);
    }
    fill(starColor[i]);
    ellipse(starX[i], starY[i], 3, 3);
  }
        //background --moon
  tint(255,255,255,random(210,255));
  image(moon,width/2+250,height/2-250);

 //vector background
 
  float x,y;
  //  xpos=mouseX;
  //  ypos=mouseY;
  // 
  //  x=map(xpos,0, width,(width/2)+((imwidth-width)/2),(width/2)-((imwidth-width)/2));
  //  y=map(ypos,0, height,(height/2)+((imheight-height)/2),(height/2)-((imheight-height)/2));
 
  x=mouseX;
  y=mouseY;
  if(abs(x-xpos)>xvel) {
 
    if (x>xpos) {
      xpos+=xvel;
    }
    else
    {
      xpos-=xvel;
    }
  }
  if(abs(y-ypos)>yvel) {
    if (y>ypos) {
      ypos+=yvel;
    }
    else
    {
      ypos-=yvel;
    }
  }
 
  image(back,map(xpos,0, width,(width/2)+((imwidth-width)/2),(width/2)-((imwidth-width)/2)), map(ypos,0, height,(height/2)+((imheight-height)/2),(height/2)-((imheight-height)/2)));
  
  textFont(main,24); //(name,size)
  fill(255);
  text("I hate human !                              I want to scare them out. ",width/2-120,height/2-160,300,600); 

  
  //mousepressed starts
    if( mousePressed == true){
     fill(255);
     
    }else{
      fill(255,random(30));
  }
  
  // ghost head
  noStroke();
  arc(mouseX, mouseY-25, 50, 50,PIE+0.14,2*PIE+0.285);
   
  // ghost body
  beginShape();
  vertex(mouseX-25, mouseY-25);
  bezierVertex(mouseX-25, mouseY-25, mouseX+25, mouseY-25, mouseX+25, mouseY-25);
  bezierVertex(mouseX+25, mouseY, mouseX+25, mouseY+25, pmouseX+25, pmouseY+50);
  vertex(pmouseX+20, pmouseY+45);
  vertex(pmouseX+15, pmouseY+50);
  vertex(pmouseX+10, pmouseY+45);
  vertex(pmouseX+5, pmouseY+50);
  vertex(pmouseX, pmouseY+45);
  vertex(pmouseX-5, pmouseY+50);
  vertex(pmouseX-10, pmouseY+45);
  vertex(pmouseX-15, pmouseY+50);
  vertex(pmouseX-20, pmouseY+45);
  vertex(pmouseX-25, pmouseY+50);
  bezierVertex(pmouseX-25, pmouseY+25, mouseX-25, mouseY, mouseX-25, mouseY-25);
  endShape();
   
  // ghost face
  fill(3,23,43);
  ellipse(mouseX-9, mouseY-25, 10, 12);
  ellipse(mouseX+9, mouseY-25, 10, 12);
  ellipse(mouseX, mouseY-8, 12, 10);
}

      
  
void mousePressed() {
  println("Boo!");
}



