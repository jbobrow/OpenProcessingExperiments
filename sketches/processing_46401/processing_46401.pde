
PImage i1;
PImage i2;

 
void setup(){
  size(1024,256);
  i1=loadImage("first.jpg");
  i2=loadImage("second.jpg");
 
}
void draw (){
background (i1);
//winter dots  
 fill(141,182,237,70);
 noStroke();
 ellipse (random(0,245), random(0,256),30,30);
 delay(170);
 fill(47,71,103,70);
 noStroke();
 ellipse (random(0,245), random(0,256),50,50);
 delay(170);
 fill(39,109,203,70);
 noStroke();
 ellipse (random(0,245), random(0,256),70,70);
 delay(170);
//spring dots
 fill(152,122,201,70);
 noStroke();
 ellipse (random(290,500), random(0,256),30,30);
 fill(120,183,145,70);
 noStroke();
 ellipse (random(290,500), random(0,256),50,50);
 fill(203,144,176,70);
 noStroke();
 ellipse (random(290,500), random(0,256),70,70);
 //fall dots
  fill(227,118,46,50);
 noStroke();
 ellipse (random(550,745), random(0,256),30,30);
 fill(185,36,46,50);
 noStroke();
 ellipse (random(550,745), random(0,256),50,50);
 fill(8,49,5,50);
 noStroke();
 ellipse (random(550,745), random(0,256),70,70);
//summer dots
  fill(42,240,29,50);
 noStroke();
 ellipse (random(800,1024), random(0,256),30,30);
 fill(5,199,250,50);
 noStroke();
 ellipse (random(800,1024), random(0,256),50,50);
 fill(250,230,5,50);
 noStroke();
 ellipse (random(800,1024), random(0,256),70,70);
}

void mouseMoved(){
  background(i2);
//winter dots  
 fill(141,182,237,70);
 noStroke();
 ellipse (random(0,245), random(0,256),30,30);
 delay(170);
 fill(47,71,103,70);
 noStroke();
 ellipse (random(0,245), random(0,256),50,50);
 delay(170);
 fill(39,109,203,70);
 noStroke();
 ellipse (random(0,245), random(0,256),70,70);
 delay(170);
//spring dots
 fill(152,122,201,70);
 noStroke();
 ellipse (random(290,500), random(0,256),30,30);
 fill(120,183,145,70);
 noStroke();
 ellipse (random(290,500), random(0,256),50,50);
 fill(203,144,176,70);
 noStroke();
 ellipse (random(290,500), random(0,256),70,70);
 //fall dots
  fill(227,118,46,50);
 noStroke();
 ellipse (random(550,745), random(0,256),30,30);
 fill(185,36,46,50);
 noStroke();
 ellipse (random(550,745), random(0,256),50,50);
 fill(8,49,5,50);
 noStroke();
 ellipse (random(550,745), random(0,256),70,70);
//summer dots
  fill(42,240,29,50);
 noStroke();
 ellipse (random(800,1024), random(0,256),30,30);
 fill(5,199,250,50);
 noStroke();
 ellipse (random(800,1024), random(0,256),50,50);
 fill(250,230,5,50);
 noStroke();
 ellipse (random(800,1024), random(0,256),70,70);
 
 
    
}



