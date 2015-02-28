
/*
Assignment 1
Name: Jenny Mott
E-mail: jmott@brynmawr.edu
Course: CS 110-01
Submitted: 9/11/2012

The beginning sketch thing.  I don't know, man.
it's supposed to be a fly, but i'm not sure it'll come out that way.
*/
void setup(){
   size(500,500);
   background(131,141,160);
}
void draw() {
  ellipseMode(CENTER);
  stroke(0);
//drawin' the wings
  fill(171,205,211);
  ellipse(150,125,150,175);
  ellipse(350,125,150,175);
  line(175,175,115,50);
  line(290,275,385,50);
//drawin' the head-body
  fill(7,16,33);
  ellipse(width/2, height/2,250,250);
//drawin' the eyes
  fill(15,34,72);
  ellipse(187.5,250,125,150);
  ellipse(312.5,250,125,150);
  stroke(150);
  line(200,215,205,220);
  line(200,215,195,215);
  line(195,215,190,220);
  line(190,220,190,225);
  line(190,225,195,230);
  line(195,230,200,230);
  line(200,230,205,225);
  line(205,225,205,220);
//drawin' the legs
  stroke(0);
  fill(7,16,33);
  line(290,320,400,415);
  line(400,415,300,450);
  line(210,320,150,415);
  line(150,415,200,450);
//he's pretty crafty
  line(300,350,315,400);
  line(200,350,185,400);
//how many legs do flys have?
  line(315,350,325,395);
  line(215,350,200,395);
//annoyingbzz i'mafly
}
