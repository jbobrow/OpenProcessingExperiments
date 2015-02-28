
int x,y;
color fireColor=color(215,90,30);
color iceColor=color(255);
color fireColorBg=color(190,220,240);
color iceColorBg=color(255,225,60);
color bg;
int n=12;
PShape flake;

void setup() {
size(400,400);
frameRate(12);
flake=loadShape("snowflake.svg");
background(255);
}

void draw() {
  fill(bg,100);
  rect(0,0,width,height);  

  for(int i=0;i<n; i++) {
    flake.disableStyle();
    if(mousePressed) { stroke(fireColor); fill(fireColor); bg=color(iceColorBg); }
    else { stroke(iceColor); bg=color(fireColorBg);}
    x=int(random(350));
    y=int(random(350));
    shape(flake, x, y, 50, 50);
  }
}

