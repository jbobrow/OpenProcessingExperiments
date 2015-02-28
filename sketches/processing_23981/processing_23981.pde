


void setup () {

  //size of the window
  size(500,500);
  smooth();
  frameRate (15);
}


void draw () {

  int x = mouseX;
  int y = mouseY;


  //background
  background (225,x,y);
  ellipseMode(CENTER);
  rectMode(CENTER);

  for (int c= 0; c<=width; c+=30) {
    stroke(0);
    line(0,c,width,c);
  }

  for (int d= 0; d<=height; d+=30) {
    stroke(0);
    line(d,0,d,height);
  }


  if ((x>width/2)) {

    //zoog's body
    stroke(0);
    fill(152);
    rect(x,y,50,100);

    //zoog's ears
    stroke(0);
    fill(152);
    rect(x-50,y-50,30,20);
    rect(x+50,y-50,30,20);

    //zoog's head
    stroke(0);
    fill(90);
    rect(x,y-50,90,60);

    //zoog's eyes
    fill(x,0,y);
    ellipse(x-19,y-55,abs(x-pmouseX),abs(y-pmouseY));
    ellipse(x+19,y-55,abs(x-pmouseX),abs(y-pmouseY));

    //zoog's mouth
    fill(x,y,0);
    rect(x,y-32,abs(x-pmouseX),10);

    //zoog's hands
    stroke(0);
    line(x+30,y-10,pmouseX+55,pmouseY+30);
    line(x-30,y-10,pmouseX-55,pmouseY+30);

    //zoog's legs
    stroke(0);
    line(x-20,y+50,pmouseX-50,pmouseY+100);
    line(x+20,y+50,pmouseX+50,pmouseY+100);
  }
  else {

    //zoog's body
    stroke(0);
    fill(152);
    rect(x,y,50,100);

    //zoog's ears
    stroke(0);
    fill(152);
    rect(x-50,y-50,abs(x-pmouseX),abs(y-pmouseY));
    rect(x+50,y-50,abs(x-pmouseX),abs(y-pmouseY));

    //zoog's head
    stroke(0);
    fill(90);
    rect(x,y-50,90,60);

    //zoog's eyes
    fill(x,0,y);
    ellipse(x-19,y-55,20,20);
    ellipse(x+19,y-55,20,20);

    //zoog's mouth
    fill(x,y,0);
    rect(x,y-32,60,10);

    //zoog's hands
    stroke(0);
    line(x+30,y-10,pmouseX+55,pmouseY+30);
    line(x-30,y-10,pmouseX-55,pmouseY+30);

    //zoog's legs
    stroke(0);
    line(x-20,y+50,pmouseX-50,pmouseY+100);
    line(x+20,y+50,pmouseX+50,pmouseY+100);
  }

  //biuncing ball
  int a = 50;
  int b = 50;

  a = int(random(0,500));
  b = int(random(0,500));

  fill(0,250,150);
  ellipse(a,b,20,20);

  a++;
  b-=1;
  println(a);
}






