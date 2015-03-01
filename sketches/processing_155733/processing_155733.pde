
/*
//////////////////////////////
 Learning Processing by 
 Creating a "Character"
//////////////////////////////
 */
//Define size of screen
int x=600;
int y=600;
size(600, 600);
/////////////////////////////////////////////////
//Draw a large circle. By default, the first two parameters 
//set the location, and the third and fourth parameters set 
//the shape's width and height.
//Note that a circle has a same width and hight
//
int a=x/2;
int b=y/2;
int c=x;
//int d=c; circle
fill(3,3,3);
ellipse(a, b, c, c);
///////////////////////////////////////////////////
////Making the Lines
stroke(255);
for (int i = 0; i < 1000; i = i+5) {
  line(0, i, 600, i);
  line(i, 0, i, 600);
}
///////////////////////////////////////////////////
////Making the trignometrical lines
////x = a+r cos t
////y = b+r sin t
////where (a,b) is center of circle
stroke(227,2,36);
for (float i = 0; i < 1; i+=.01) {
  line(300*cos(i*2*PI)+300, 300*sin(i*2*PI)+300, 300-300*cos(i*2*PI), 300-300*sin(i*2*PI));
}
///////////////////////////////////////////////////
///////////////////////////////////////////////////
////END
///////////////////////////////////////////////////
///////////////////////////////////////////////////





