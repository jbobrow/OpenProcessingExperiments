
/* @pjs preload="runner.gif";*/
/* @pjs preload="middleground.gif";*/
/* @pjs preload="background.gif";*/

PImage runner;
PImage middleground;
PImage background;

void setup() {
  size(1000, 500);
  runner = loadImage("runner.gif");
  middleground = loadImage("middleground.gif");
  background = loadImage("background.gif");
}

void draw() {
  float backgroundX=map(mouseX, 0, 1000, 0, -100);
  image(background, backgroundX, 0);
  
  float middlegroundX=map(mouseX, 0, 1000, -50, -500);
  image(middleground, middlegroundX, 0);

  image(runner, mouseX, 200);
}


/*My friend did trust me with the file.
He didn't know what he was supposed to figure out, so he said he couldn't figure it out.
He was amazed by the fact that a designer student learned about parallax and others concepts about digital canvas drawing. He thought the interaction was very positive. He said now he can trust even more in my creative skills.
He said everything can be improved. He thinks that it would be great if I took more time in this project.
*/
