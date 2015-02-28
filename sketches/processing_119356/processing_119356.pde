
PFont sans;
PFont times;

PImage a;
PImage b;
float timer;

void setup()
{
  size(500,350);
  sans = createFont("Comic Sans MS",40);
  times = createFont("Times New Roman",40);
  colorMode(HSB,360,100,100);
  frameRate(10);
  
  a=loadImage("1.jpg");
  b=loadImage("2.jpg");
  
}

void draw()
{
  

  timer +=1;
 
  
  if(timer<35)
 { 
   image(a,0,0);
  textSize(25);
  textFont(times);
  fill(0,0,0,10+(timer*5));
  pushMatrix();
  translate(timer*4,0);
  text("Quiet", 30, 50);
  popMatrix();
  pushMatrix();
  translate(timer*2,10);
  text("Relaxed", 20,100);
  popMatrix();
  pushMatrix();
  translate(100-timer,0);
  text("Hard Working",150,275);
  popMatrix();
  pushMatrix();
  translate(timer*3,0);
  text("Intelligent",100,340);
  popMatrix();
  
  fill(0,0,0,10);
  pushMatrix();
  translate(timer*4,0);
  text("Quiet", 140, 219);
  popMatrix();
  pushMatrix();
  translate(timer*2,10);
  text("Relaxed", 340,189);
  popMatrix();
  pushMatrix();
  translate(100-timer,0);
  text("Hard Working",0,180);
  popMatrix();
  pushMatrix();
  translate(timer*3,0);
  text("Intelligent",130,120);
  popMatrix();
 }
   
  if(timer>35)
  {
    image(b,0,0);
  textFont(sans);
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("whoa", 50,50);
  popMatrix();
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("omg",400,100);
   popMatrix();
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("no",19,170);
   popMatrix();
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("wow",250,340);
   popMatrix();
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("drA A THign",40,250);
   popMatrix();
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("yELLS",29,320);
   popMatrix();
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("smfh",350,179);
   popMatrix();
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("yoooooooo",300,280);
   popMatrix();
  pushMatrix();
  fill(random(360),100,100);
  translate(random(-3,3),random(-3,3));
  text("aAAAAAAAAA",10,94);
  popMatrix();
  }
  
  if(timer>70)
  {
    timer=0;
  }
  
}


