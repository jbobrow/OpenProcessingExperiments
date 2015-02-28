
PImage tag1;
PImage tag2;
PImage tag3;
PImage tag4;
PImage tag5;
PImage tag6;
PImage tag7;
PImage tag8;
PImage tag9;
PImage tag10;
PImage tag11;

PImage nacht1;
PImage nacht2;
PImage nacht3;
PImage nacht4;
PImage nacht5;
PImage nacht6;
PImage nacht7;
PImage nacht8;
PImage nacht9;
PImage nacht10;

void setup() {
  size(500,467);
  
  tag1= loadImage("1.png");
  tag2= loadImage("2.png");
  tag3= loadImage("3.png");
  tag4= loadImage("4.png");
  tag5= loadImage("5.png");
  tag6= loadImage("6.png");
  tag7= loadImage("7.png");
  tag8= loadImage("8.png");
  tag9= loadImage("9.png");
  tag10= loadImage("10.png");
  tag11= loadImage("11.png");
  
  nacht1= loadImage("n1.png");
  nacht2= loadImage("n2.png");
  nacht3= loadImage("n3.png");
  nacht4= loadImage("n4.png");
  nacht5= loadImage("n5.png");
  nacht6= loadImage("n6.png");
  nacht7= loadImage("n7.png");
  nacht8= loadImage("n8.png");
  nacht9= loadImage("n9.png");
  nacht10= loadImage("n10.png");
}
 void draw () {
   image(tag1,0,0);
   if(mouseX > 50 && mouseX < 160 && mouseY > 200 && mouseY <320)
   {  cursor(HAND);}
   else {
     cursor(ARROW);
   }
   if(mouseX > 50 && mouseX < 160 && mouseY > 200 && mouseY < 320 && mousePressed== true)
    {
     image(tag3, 0, 0);
    }
     if(mouseX > 160 && mouseY > 200&&  mousePressed == true)
    {
  image(tag4, 0, 0);
    }
     if(mouseX > 230 && mouseY > 200&&  mousePressed == true)
    {
  image(tag5, 0, 0);
   if(mouseX > 260 && mouseY > 200&&  mousePressed == true)
    {
  image(tag6, 0, 0);
    }
     if(mouseX > 290 && mouseY > 200&&  mousePressed == true)
    {
  image(tag7, 0, 0);
    }
     if(mouseX > 330 && mouseY > 200&&  mousePressed == true)
    {
  image(tag8, 0, 0);
    }
     if(mouseX > 370 && mouseY > 200&&  mousePressed == true)
    {
  image(tag9, 0, 0);
    }
     if(mouseX > 410 && mouseY > 200&&  mousePressed == true)
    {
  image(tag10, 0, 0);
    }
     if(mouseX > 450 && mouseY > 200 &&  mousePressed == true)
    {
  image(tag1, 0, 0);
    }
    }
    if(mouseX > 420 && mouseY > 0 && mouseY <150 &&  mousePressed == true)
    {
  image(nacht1, 0, 0);
    }
    if(mouseX > 420 && mouseX< 460 && mouseY > 10 && mouseY <60 )
    {
  cursor(HAND);
    }
    
   if(mouseX < 420 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht2, 0, 0);
    }
       if(mouseX < 370 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht3, 0, 0);
    }
      if(mouseX < 335 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht4, 0, 0);
    }
       if(mouseX < 300 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht5, 0, 0);
    }
       if(mouseX < 250 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht6, 0, 0);
    }
       if(mouseX < 200 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht7, 0, 0);
    }
       if(mouseX < 150 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht8, 0, 0);
    }
       if(mouseX < 100 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht9, 0, 0);
    }
       if(mouseX < 50 && mouseY <150  &&  mousePressed == true)
    {
  image(nacht10, 0, 0);
    }
 }



