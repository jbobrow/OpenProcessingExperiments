
PImage mouth;
PImage tool1;
PImage tool2;
PImage smalltool1;
PImage smalltool2;
float s,angle,x1,y1,x2,y2,opac,blu,grn;
int clickCount1, clickCount2,clickCount3;



void setup(){
  size(800,800);
  mouth = loadImage("Mouth.jpg");
  tool1 = loadImage("tool1.png");
  smalltool1 = loadImage("smalltool1.png");
  tool2 = loadImage("tool2.png");
  smalltool2 = loadImage("smalltool2.png");
  imageMode(CENTER);
  background(255);
  s = 900;
  angle = 0;
  x1 = 1000;
  y1 = 1000;
  x2 =2000;
  y2 = 2000;
  clickCount1 = 0;
  clickCount2 = 0;
  grn = 255;
  blu = 255;
 clickCount3 = 0;
}

void draw(){
  image(mouth,width/2,height/2,s,s);
  s = 900 + 150*sin(radians(angle));
  angle++;
  image(smalltool1,40,30);
  image(smalltool2,40,80);
  image(tool1,x1,y1);
  image(tool2,x2,y2);
  opac = abs(255*sin(radians(angle)));
  tint(255,grn,blu);
 
 if (mousePressed &&(mouseX > 10 && mouseX < 70 && mouseY > 20 && mouseY < 60)){
   clickCount1 ++;
   clickCount2 --;
}

  if (clickCount1 >= 1){
    x1 = mouseX + 135;
    y1 = mouseY + 30;
  }else{
    x1 = 1000;
    y1 = 1000;
  }
  
   if (mousePressed &&(mouseX > 3 && mouseX < 80 && mouseY > 60 && mouseY < 100)){
   clickCount2 ++;
   clickCount1 --;
}

  if (clickCount2 >= 1){
   x2 = mouseX + 145;
   y2 = mouseY + 50;
  }else{
    x2 = 2000;
    y2 = 2000;
  }
 if (mousePressed && (x1 == mouseX + 135 && y1 == mouseY + 30)){
   ellipse(mouseX,mouseY,50,50);
   noStroke();
   fill(227,44,44,opac);
   opac -= .5;
   //blu --;
  //grn --;
   
   
}
   if (mousePressed && (x2 == mouseX + 145 && y2 == mouseY + 50)){
   ellipse(mouseX,mouseY,70,70);
   noStroke();
   fill(227,44,44,opac);
   opac -= .5;
   //blu --;
   //grn --;
   
}
  if(clickCount3 >= 10){
    blu --;
    grn --;
}
}
void mouseClicked(){
  clickCount3++;
    //tint(255,grn,blu);
  println(clickCount3);
}




  


