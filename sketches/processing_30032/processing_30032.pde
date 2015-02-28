
//Question 3

//As seen I haven't answered the question correctly, but I felt I had to use too much code from the internet to get I to work right. 

PImage online;

void setup() {
  size(200,200);  
  String url = "http://www.itu.dk/people/kasper/BITP-2011/00_Exam/sunflower.jpeg"; //Had to get picture from url, because of the hosting I chose.
  online = loadImage(url, "jpeg");
  noLoop();
}

void draw() {
  image(online, 0, 0);
  noStroke();
  fill(255,0,0,100);      //Red overlay
  rect(0,0,100,100);
  fill(0,0,255,100);      //Blue overlay
  rect(100,0,100,100);
  fill(255,255,0,100);    //Yellow overlay
  rect(0,100,100,100);
  fill(0,255,0,100);      //Green overlay
  rect(100,100,100,100);
}



