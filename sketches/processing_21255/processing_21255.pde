
PImage ground;
PImage people;
PImage soldiers;
PImage prayer;
PImage celebration;
PImage flag;


void setup(){
  size(900,700);
  background(0);
  ground = loadImage("floor.png");
  people = loadImage("people2.jpg");
  soldiers = loadImage("soldiers.png");
  prayer = loadImage("prayer.jpg");
  celebration = loadImage("celebration.gif");
  flag = loadImage("flag.png");
}

void draw(){
   //image(ground,350,125);
    frameRate(15);
  
if(mousePressed){
  image(celebration,0,0);
  image(people,0,113);
  //these are my fireworks below, right now, it's a flashing effect, i would like for it to look more like the firework in the image
  noFill();
  strokeWeight(5);
  stroke(random(230,255),random(0,70),random(0,100));
  arc(random(0,900),random(113,270),60,60,random(3.14,3.61),random(3.93,4.71));
  fill(random(230,255),random(0,70),random(0,100));
  rect(random(0,900),random(113,270),5,random(5,40));
  rect(random(0,900),random(113,270),5,random(5,20));
  ellipse(random(0,900),random(113,270),random(5,10),random(5,10));
  ellipse(random(0,900),random(113,270),random(5,10),random(5,10));
}

else{
   image(soldiers,0,-450);
   image(prayer,0,100);
 if(keyPressed){
   if(key=='f'||key=='F'){
     image(flag,random(0,800),random(113,500));
   }
 }
}

}


