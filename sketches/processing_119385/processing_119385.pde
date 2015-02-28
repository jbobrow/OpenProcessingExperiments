
PImage shyImage;
PImage loudImage;
PFont sans;
PFont times;
float timer = 0;
float s = 0;
   
 
void setup()
{
  size(600,500);
  background(0,0,255);
  frameRate(10);
  sans = createFont("Comic Sans MS",40);
  times = createFont("Times New Roman",40);
  shyImage = requestImage("shy.png");
  loudImage = requestImage("loud.jpg");
}
 
void draw()
{
   stroke(255);
   timer += 1;
   

  if (timer <15)
  {
  image(shyImage, 175,150/2);
  textSize(15);
  textFont(times);
  pushMatrix();
  fill(255);
  text("Go Getter", 160,70);
  text("Calm", 320,70);
  
  
  pushMatrix();
  translate(165, 165);
  rotate(radians(270));
  text("Quiet", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(165, 370);
  rotate(radians(270));
  text("Soft Spoken", 0, 0);
  popMatrix();

  
 pushMatrix();
  translate(410, 80);
  rotate(radians(90));
  text("Smart", 0, 0);
  popMatrix();
 
  pushMatrix();
  translate(410, 200);
  rotate(radians(90));
  text("Conformed", 0, 0);
  popMatrix();

  
  text("Inside the Box",175,410);
  text("",130,120);
  popMatrix();
  
 }
  
  
  
  if(timer > 50)
  {
  textSize(18);
  textFont(sans);
  pushMatrix();  
  image(loudImage, 0, 0);
  fill(random(255),random(255), random(255));
  
  pushMatrix();
  translate(55, 240);
  rotate(radians(290));
  text("FUN", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(30, 50);
  rotate(radians(25));
  text("LOUD", 0, 0);
  popMatrix();
 
  pushMatrix();
  textSize(22);
  translate(310, 225);
  rotate(radians(8));
  text("MOVIES", 0, 0);
  popMatrix();
 // text("LOUD", 30, 50);
 
  pushMatrix();
  translate(425, 45);
  rotate(radians(50));
  text("CRAZY", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(285,245);
  rotate(radians(8));
  text("DISNEY", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(260,270);
  rotate(radians(8));
  text("VIDEO GAMES", 0, 0);
  popMatrix();
  
  //text("CRAZY", 460, 50);
  //text("FUN",30, 240);
  text("NERDY", 35, 305);
  
  pushMatrix();
  translate(500, 431);
  rotate(radians(290));
  text("GAMER", 0, 0);
  popMatrix();
  //text("GAMER", 431, 431);
  textSize(50);
  text("KNOW IT ALL",15, 460);
  popMatrix();
  }
 println("x: " + mouseX + " y: " + mouseY);
}



