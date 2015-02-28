
/* @pjs preload="portrait.jpg"; */
PImage img;
void setup(){
  img = loadImage("portrait.jpg");
  size(710,710);
  background(0);
  smooth();
}
void draw(){
  tint(122,186,221);
  image(img,0,0);
  img.filter(POSTERIZE,20);
  fill(250,245,197);
  ellipse(520,20,40,40);
  strokeWeight(4);
  stroke(232,44,57);
  line(375,425,420,350);
  line(375,425,450,445);
  line(375,425,340,490);
  line(375,425,330,400);
  line(375,425,390,490);
  line(375,425,352,340);
  stroke(247,174,27);
  line(375,425,455,370);
  line(375,425,440,460);
  line(375,425,310,450);
  line(375,425,305,400);
  line(375,425,365,350);
  stroke(242,204,47,160);
  line(315,315,375,425);
  line(375,425,385,340);
  line(375,425,300,360);
  line(375,425,410,345);
  line(375,425,315,475);
  line(375,425,300,425);
  line(375,425,445,410);
  line(375,425,400,475);
  line(375,425,380,480);
  line(375,425,355,500);
  line(375,425,450,350);
  line(375,425,440,480);
  fill(250,245,197); 
  noStroke();
  int time;
  time = second();
  for(time=0;time<60;time = time + 3){
  translate(20,-5);
  ellipse(100,100,15,15);
  }
}


