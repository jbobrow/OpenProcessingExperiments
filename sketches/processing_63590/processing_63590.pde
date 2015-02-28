
  
void setup (){
  size (640,427);
  PImage img;

  img =loadImage("IMG_2592.JPG");
    image(img,0,0);
    noCursor();
     
}

void draw(){
  frameRate(10);
  PImage img;
  img =loadImage("IMG_2592.JPG");
    image(img,0,0);
    int x=int(random(-1000,1000));
    int y=int(random(-1000,1000));
    int w=int(random(-1000,1000));
    int v=int(random(-1000,1000));
    int a=int(random(-20,20));
    int b=int(random(-20,20));
    int c=int(random(-20,20));
    int d=int(random(-20,20));
 if (mousePressed && (mouseButton==LEFT)) {
   smooth();
   noStroke();
   fill(135+a,206+b,250+c,70+d);
   triangle(379,170,x,v,y,w);
}
else if (mousePressed && (mouseButton==RIGHT)){
     smooth();
   noStroke();
   fill(235+a,69+b,0+c,80+d);
   triangle(379,170,x,v,y,w);
}
else if (mousePressed && (mouseButton==CENTER)){
  smooth();
   noStroke();
   fill(235+a,69+b,0+c,80+d);
   triangle(379,170,x,v,y,w);
      fill(135+a,206+b,250+c,70+d);
   triangle(379,170,v,x,w,y);
}
}

