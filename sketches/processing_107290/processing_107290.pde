
/* @pjs preload="bg.jpg"; */
PImage img;
void setup() {
size(1422, 800); // 16:9 aspect ratio, nice
img = loadImage("bg.jpg");
background(img);
};
void draw() {
strokeWeight(4); // thicker lines
ellipseMode(CENTER); //measured from the center
noFill(); // hollow wheels
ellipse(125,775,50,50); //back wheel
ellipse(250,775,50,50); //front wheel

stroke(0,0,255); // blue bike
line(250,775,225,675); // stearing collum
line(165,700,230,700); // top, front frame
line(230,700,175,775); // bottom, front frame
line(175,775,125,775); // bottom, back frame
line(165,700,125,775); // top, back frame
line(175,775,165,690); // support
line(225,675,235,670); // handle bar
line(235,670,225,665); // more handle bar


stroke(0); // black lines again
fill(0); // black seat
quad(150,690,175,690,170,680,150,680); //seat

stroke(130); // Gray for mountains
fill(130); // more gray
triangle(1000,800,1150,600,1300,800); 
triangle(1300,650,1400,800,1200,800);

stroke(255); //snow
fill(255); //more snow
triangle(1150,600,1112,650,1187,650);//used line forumla calc to find the other 
triangle(1300,650,1266,700,1333,700);//two points for the snow, math is hard

};











