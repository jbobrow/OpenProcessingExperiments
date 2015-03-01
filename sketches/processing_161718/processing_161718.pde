
size(300,300);

colorMode(HSB);
for(int i=0;i<300;i++){
  stroke(276,i*1.0,240);
  line(i,i,0,300);
  line(i,i,300,0);
}
PFont myFont =loadFont("ACaslon-AltBold-48.vlw");
textFont(myFont);
fill(255);
textSize(36);
textLeading(48);
textAlign(CENTER);
text("TOMORROW",150,70);
text("IS",150,120);
text("ANOTHER",150,170);
text("DAY",150,220);
text(".",150,270);





