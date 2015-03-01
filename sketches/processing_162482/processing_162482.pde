
 size(500,500);
background(246,16,85);
colorMode(RGB);
for (int i = 100;i<255;i++){
float R=i%2+50;
float G=i;
 float B=i/2;
 noStroke();
 fill(R,G,B,50);
 ellipse(i*1.8,i/3+100,100,100);

}
colorMode(RGB);
for (int i = 100;i<255;i++){
float R=i;
float G=i-10;
 float B=i+100;
 noStroke();
 fill(R,G,B,80);
 ellipse(i/2,i+100,100,100);

}
colorMode(RGB);
for (int i = 100;i<255;i++){
float R=i+120;
float G=i-10;
 float B=i/2;
 noStroke();
 fill(R,G,B,50);
 ellipse(500-i,i+200,100,100);

}


