
/* @pjs preload="1.png"; */
size(500,500);
colorMode(RGB);
for (int i = 0;i<500;i++){
float R=i+200;
float G=i-10;
 float B=i/2;
 noStroke();
stroke(R,G,B,70);
line(i,0,i,500);
}
PImage haha =loadImage("1.png");
for(int h=100;h<500;h=h+120){
  image(haha,30,30,h,h);

}



