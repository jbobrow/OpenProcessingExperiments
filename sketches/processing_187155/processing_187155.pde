
PImage webImg1;
PImage webImg2;
void setup(){
  size(1286,744);
  String url1="http://s5.postimg.org/qbtuxgb13/assignment_7b_faces.jpg";
  webImg1=loadImage(url1,"jpg");
  String url2="http://s5.postimg.org/rup92fhlj/assignment_7b_mustache_adjusted.png";
  webImg2=loadImage(url2,"png");
}
void draw(){
  image(webImg1,0,0);
  if(mousePressed==true)
  {
    image(webImg2,mouseX,mouseY);
  }
}

