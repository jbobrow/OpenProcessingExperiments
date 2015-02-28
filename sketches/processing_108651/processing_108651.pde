
/* cached colors */
color skin = color(249,227,209);
color lightMauve = color(222,208,200);
color mauve = color(199,163,163);
color brown = color(120,95,86);
color blue = color(179,186,193);
color white = color(255,255,255);
color grey = color(120,120,120);

/* overall */
size(600,600); //cache later bc open processing needs size first
background(lightMauve);
int bgWidth = 600;
int bgHeight = 600;

/* wallpaper */
int lineInterval = 150; //must divide bgWidth
stroke(white);

//left to right wallpaper diagonal lines
for (int i = -bgWidth; i < bgWidth; i += lineInterval) {
  line(i,0,bgWidth+i,bgWidth);
}

//right to left wallpaper diagonal lines
for (int i = 0; i < 2*bgWidth; i += lineInterval) {
  line(i,0,-bgWidth+i,bgWidth);
}

int dotSize = 12;
int dotInterval = lineInterval/2;
int cols = bgWidth/lineInterval;
int rows = bgHeight/dotInterval;
fill(blue);
noStroke();

//wallpaper dot/diamond things
for (int j = 0; j <= rows; j++) {
  for (int i = 0; i <= cols; i++) {
    int x;
    int y = j * dotInterval;
    if (j % 2 == 1) { //odd rows, no x offset
      x = i * dotInterval * 2;
    } else { //even rows, yes x offset
      x = dotInterval + (i * dotInterval * 2);
    }
    //diamond top
    triangle(x,y-(dotSize/1.5),x-(dotSize/2),y,x+(dotSize/2),y);
    //diamond bottom
    triangle(x,y+(dotSize/1.5),x-(dotSize/2),y,x+(dotSize/2),y);
  }
}

/* face */
fill(skin); //skin color
ellipse(300,250,350,390); //head
ellipse(130,280,70,70); //left ear
ellipse(470,280,70,70); //right ear
rect(260,400,80,100); //neck

fill(brown); //hair/mustache color
arc(300,370,100,60,radians(180),radians(360)); //mustache

stroke(brown);
strokeWeight(5);
ellipseMode(CORNER);

//hair on left
ellipse(111,190,60,70); 
beginShape(); 
curveVertex(112,220);
curveVertex(112,220);
curveVertex(116,200);
curveVertex(136,160);
curveVertex(143,155);
curveVertex(146,180);
curveVertex(161,201);
curveVertex(161,201);
endShape(CLOSE);

//hair on right
ellipse(489 - 60,190,60,70);
beginShape(); 
curveVertex(bgWidth - 112,220);
curveVertex(bgWidth - 112,220);
curveVertex(bgWidth - 116,200);
curveVertex(bgWidth - 136,160);
curveVertex(bgWidth - 143,155);
curveVertex(bgWidth - 146,180);
curveVertex(bgWidth - 161,201);
curveVertex(bgWidth - 161,201);
endShape(CLOSE);

noStroke();
ellipseMode(CENTER);

fill(199,163,163); //nose color
triangle(300,250,280,340,320,340); //nose bridge
arc(300,340,40,40,radians(0),radians(180)); //nose tip

noFill();
stroke(lightMauve); //glasses rim color
strokeWeight(2);
ellipse(240,300,80,80); //left lens
ellipse(360,300,80,80); //right lens
line(280,300,320,300); //bridge

stroke(grey); //eyes color
strokeWeight(2);
arc(240,280,50,20,radians(20),radians(160)); //left eye
arc(360,280,50,20,radians(20),radians(160)); //right eye

/* shirt */
noStroke();
fill(mauve); //shirt color
ellipse(300,650,420,300); //shirt

fill(skin); //skin color
arc(300,500,80,80,radians(0),radians(180)); //exposed neck dip

noFill();
stroke(blue); //shirt collar color
strokeWeight(12);
beginShape(); //shirt collar
curveVertex(250,345);
curveVertex(255,506);
curveVertex(300,546);
curveVertex(345,506);
curveVertex(350,345);
endShape();
