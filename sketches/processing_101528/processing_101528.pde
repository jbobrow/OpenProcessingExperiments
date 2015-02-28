
/* @pjs preload="cozy_place.jpg"; */
// allow-file-access-from-files
// disable-web-security

Maxim maxim;
AudioPlayer player;
AudioPlayer player2;

PImage summer_img, spring_img, autumn_img, winter_img, cozy_place_img;
int season;
int winter=1,spring=2,summer=3,autumn=4;

void setup()
{
  size(768,768);
  cozy_place_img = loadImage("cozy_place.jpg");
  background(cozy_place_img);
   
  //size(cozy_place_img.width, cozy_place_img.height);
  maxim = new Maxim(this);
  player = maxim.loadFile("enya.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("jungle.wav");
  player2.setLooping(true);
  player.volume(0.25);
  
  summer_img = loadImage("summer_leaf.png");
  spring_img = loadImage("spring_flower.png");
  autumn_img = loadImage("autumn_leaf.png");
  winter_img = loadImage("winter_leaf.png");
  
  rectMode(CENTER);
  season = summer;
}

void draw()
{
   //draw "buttons"
  fill(0,8); //8-alpha-transperancy
  rect(width/6, height-50, width/7, 40);
  rect(width/6 * 2, height-50, width/7, 40);
  rect(width/6 * 3, height-50, width/7, 40);
  rect(width/6 * 4, height-50, width/7, 40);
  rect(width/6 * 5, height-50, width/7, 40);
  
  //fill text in the buttons
  textFont(loadFont("FranklinGothic-Demi-25.vlw"),25); 
  String Str = "Clear All";
  fill(255,0,0);
  text(Str, width/6 - (textWidth(Str)/2) , height-40);
  Str = "Winter";
  fill(255);
  text(Str, width/6 * 2 - (textWidth(Str)/2) , height-40);
  Str = "Spring";
  fill(#FF6600);
  text(Str, width/6 * 3 - (textWidth(Str)/2) , height-40);
  Str = "Summer";
  fill(0,255,0);
  text(Str, width/6 * 4 - (textWidth(Str)/2) , height-40);
  Str = "Autumn";
  fill(#FFFF00);
  text(Str, width/6 * 5 - (textWidth(Str)/2) , height-40);
//  
}

void mouseDragged()
{
  player.play();
  player2.play();
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
 if (mouseButton == RIGHT) //right button
  {
    brush3(mouseX, mouseY,speed, speed,lineWidth);
  }
  else
  {
    if (season == summer) { image(summer_img, mouseX, mouseY, speed*2, speed*2);}
    if (season == winter) { image(winter_img, mouseX, mouseY, speed*2, speed*2);}
    if (season == autumn) { image(autumn_img, mouseX, mouseY, speed*2, speed*2);}
    if (season == spring) { image(spring_img, mouseX, mouseY, speed*2, speed*2);}
  }
 
  player.setFilter((float) mouseY/height*5000,mouseX / width);
  //player2.setFilter((float) mouseY/height*5000,mouseX / width);
  
  player2.ramp(1.,1000);
  player2.speed((float) mouseX/(float) width/2);
}

void mouseReleased()
{
   player2.stop();
   player2.ramp(0.,1000);
}
  
void mousePressed() {
  player2.stop();
  
  //println(mouseY + " > " + (height-50-40) + " " + mouseX + " > " + (width/7*5) + " season: " + season);
  
  //clear all button - rect(width/6, height-50, width/7, 40);
  
  //double click to choose
  if (mouseY > height-50-40 && mouseX > (width/7*5))  { season=autumn; } //3
  else if  (mouseY > height-50-40 && mouseX > (width/7*4))  { season=summer;  } //2
  else if  (mouseY > height-50-40 && mouseX > (width/7*3))  { season=spring;  } //1
  else if  (mouseY > height-50-40 && mouseX > (width/7*2))  { season=winter;  } //4
  else if  (mouseY > height-50-40 && mouseX > (width/7))  {  background(cozy_place_img);  }

  else if (mouseEvent.getClickCount()==2) //double click
  {
    image(flower_img, mouseX, mouseY);
  }
}


void brush3(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth/4);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(20),0+random(20),0,0);
  rotate(random(px));
  line(0+random(10),0+random(10),0,0);
  rotate(random(px));
  line(0+random(20),0+random(20),0,0);
  popMatrix();

  return;
}




