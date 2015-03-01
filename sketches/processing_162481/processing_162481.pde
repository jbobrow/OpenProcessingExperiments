
size(500,500);
colorMode(RGB);
for (int i = 0;i<500;i++){
float R=i+200;
float G=i-10;
 float B=i/2;
 noStroke();
stroke(R,G,B,110);
line(i,0,i,600);
}
PFont font;
font = loadFont("CooperBlackMS-48.vlw");
textFont(font);
textSize(72);
textAlign(CENTER);
text("Tell",200,100);
text("me",300,300);
text("Yes !",400,190);


