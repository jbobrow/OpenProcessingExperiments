
PImage lost;
PImage lost2;
PImage lost3;
float timer = 0;
float hue = 0;
float s = 1;
PFont myFont;

void setup()

{
  size (500, 500);
  lost = requestImage("lost.JPG");
  frameRate(55);
  lost2 = requestImage("lost2.jpg");
  lost3 = requestImage("lost3.jpg");
  myFont = createFont("Georgia", 50);
  colorMode(HSB,50,150,95);
}

void draw()

{
  timer += 1;
  
  if (lost.width > 0)
{
  image(lost,0,0, width, height);
}

//lines over the picture
{
  stroke(random(10), 220, random(150));
  strokeWeight(8);
  line(104, 250, 111, 147);
  line(100, 168, 196, 60); 
  line(169, 66, 253, 66);
  line(377, 252, 378, 314);
  line(378, 314, 293, 407);
  strokeWeight(4);
  line(276, 123, 265, 151);
  line(283, 126, 278, 155);
  line(190, 398, 223, 368);
  line(211, 367, 223, 368);
  line(221, 380, 223, 368);
  strokeWeight(8);
  noFill();
  ellipse(236, 247, 55, 55);
  ellipse(174, 424, 55, 55);
  ellipse(151, 282, 55, 55);
  ellipse(285, 104, 40, 40);
}
//phase 2 rect change
  if(timer > 200)
  {
    pushMatrix();
    noStroke();
    fill(hue,500,random(100));
    translate(random(500),250);
    rectMode(CENTER);
    scale(s + random(-4.0,8.0));
    rect(0,random(-200,200),random(5,15),random(5,15));
    popMatrix();
     
  pushMatrix();
  noStroke();
  fill(hue,50,random(150));
  translate(random(500),250);
  rectMode(CENTER);
  scale(s + random(-8.0,8.0));
  rect(0,random(-300,300),random(5,15),random(5,15));
  popMatrix();
  
  if(timer > 325)
 {
  if (lost2.width > 0)
{
  image(lost2,0,0, width, height);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  stroke(0);
  text("PUSH", width/5, height/5);
}
  }
// "noise" to change
  if (timer > 400)
{
  
  for (int i = 0; i < 500; i++) 
 {
  float r = random(50);
  stroke(r*5);
  line(500, i, 0+r, i);
   }

  String[] words = { "a", "b", "c", "d" };
  int index = int(random(words.length));  // Same as int(random(4))
  println(words[index]);  // Prints one of the four words
  
}
//phase 3 hatch
  if (timer > 475)
 {
  
  if (lost3.width > 0)
  {
    image(lost3,0,0, width, height);
  }
}
//last page hatch and numbers
  if (timer > 500)
{
  image(lost3, 0, 0); 
  tint(0, 153, 204, 126); 
  image(lost3, 50, 0);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  stroke(0);
  text("4, 8, 15, 16, 23, 42", width/2.5, height/5);
}
//reset
if (timer > 550)
{
  timer = 0;
}


}
   


println("x: " + mouseX + " y: " + mouseY);



}
 




