
size(400,400);
colorMode(HSB,360,100,100);
background(281,70,70);
strokeWeight(3);
fill(238,100,100);
stroke(100,100,100);
int x=265;
int y=78;


if (x<=150 || y==77){
  line(2,20,20,2);
} else if(x>=250){
  ellipse(200,200,50,50);
  line(47,29,348,123);
  line(175,24,373,100);
  stroke(50,85,85);
  fill(357,70,70);
  ellipse(300,240, 80,200);
  ellipse(50,300,200,120);
  stroke(60,100,100);
  line(120,120,50,70);
  line(50,70,50,120);
} else if(x>150){
  ellipse(45,45,28,38);
  ellipse(200,200,50,50);
  line(47,29,348,123);
  line(175,24,373,100);
  stroke(5,8,85);
  fill(57,70,70);
  ellipse(300,240, 80,200);
  ellipse(50,300,200,120);
  stroke(360,50,50);
  line(120,120,50,70);
  line(50,70,50,120);
}

