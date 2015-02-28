
PImage i1;
PImage i2;

 
void setup(){
  size(800,200);
  i1=loadImage("first.jpg");
  i2=loadImage("second.jpg");
 
}
void draw (){
background (i1);
//winter dots  
 fill(141,182,237,100);
 noStroke();
 ellipse (random(0,200), random(0,200),30,30);
 delay(170);
 fill(47,71,103,100);
 noStroke();
 ellipse (random(0,200), random(0,200),50,50);
 delay(170);
 fill(39,109,203,100);
 noStroke();
 ellipse (random(0,200), random(0,200),70,70);
 delay(170);
//spring dots
 fill(152,122,201,100);
 noStroke();
 ellipse (random(200,400), random(0,200),30,30);
 fill(120,183,145,100);
 noStroke();
 ellipse (random(200,400), random(0,200),50,50);
 fill(203,144,176,100);
 noStroke();
 ellipse (random(200,400), random(0,200),70,70);
 //fall dots
  fill(227,118,46,100);
 noStroke();
 ellipse (random(400,600), random(0,200),30,30);
 fill(185,36,46,100);
 noStroke();
 ellipse (random(400,600), random(0,200),50,50);
 fill(8,49,5,100);
 noStroke();
 ellipse (random(400,600), random(0,200),70,70);
//summer dots
  fill(42,240,29,100);
 noStroke();
 ellipse (random(600,800), random(0,200),30,30);
 fill(5,199,250,100);
 noStroke();
 ellipse (random(600,800), random(0,200),50,50);
 fill(250,230,5,100);
 noStroke();
 ellipse (random(600,800), random(0,200),70,70);
}

void mouseMoved(){
  background(i2);

}



