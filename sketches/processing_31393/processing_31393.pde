
PImage picturecurrent;
PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image6;
PImage image7;
float x;
float y;
float dia = 50;
float radius = dia/2;
color col = color(200);
  
  
void setup() {  
  size(500,500);
  background(255);

  frameRate(99999999);
 picturecurrent= loadImage("foofa.jpg");
 picturecurrent.resize(500,500);  
   image1 = loadImage("foofa.jpg");
   image1.resize(500,500);
   image2 = loadImage("lancerock.jpg");
   image2.resize(500,500);
   image3 = loadImage("DownloadedFile.jpeg");
   image3.resize(500,500);
   image4 = loadImage("DownloadedFile-1.jpeg");
   image4.resize(500,500);
   image5 = loadImage("brobee.jpg");
   image5.resize(500,500);
   image6 = loadImage("yo_gabba_gabba_muno-11871.jpg");
   image6.resize(500,500);
   image7 = loadImage("tv_new_yo_gabba_gabba.jpg");
   image7.resize(500,500);
}
  
void draw() { 

float x = 450;
float y = 450;

 
   fill(200,20,5);
text("Press z to start", 50,450);
  
   
   if(keyPressed == true) { 
    if(key == 'z'){
    
   
    background (picturecurrent );
    background(image1);
    fill(random(255), random(255), random(255));
  
    textSize(20);
    text("Hey guys! Hows it going?", 400, 100);
    text("Press a to continue", 300, 450);
    }
    }
 


  if(keyPressed == true) {
    if(key == 'a'){
    background (picturecurrent );
    background(image2);
    fill(random(255), random(255), random(255));
  
    
    textSize(20);
    text("Amazing!", 400, 100);
    text("Press s to continue", 300, 450);
    }
  }
  if(keyPressed == true) { 
    if(key == 's'){
    //add some interaction
   
    background (picturecurrent );
    background(image3);
    fill(random(255), random(255), random(255));

    textSize(20);
    text("Fantastic", 400, 100);
    text("Press d to continue", 300, 450);
    }
  }
     if(keyPressed == true) { 
    if(key == 'd'){
    //add some interaction
   
    background (picturecurrent );
    background(image4);
    fill(random(255), random(255), random(255));

    textSize(20);
    text("Better than \n the rest!", 380, 100);
    text("Press f to continue", 300, 450);
    }  
  }
     if(keyPressed == true) { 
    if(key == 'f'){
    //add some interaction
   
    background (picturecurrent );
    background(image5);
    fill(random(255), random(255), random(255));

    textSize(20);
    text("Excellent!", 400, 100);
    text("Press g to continue", 300, 450);
    }
    }
    
      if(keyPressed == true) { 
    if(key == 'g'){
    //add some interaction
   
    background (picturecurrent );
    background(image6);
    fill(random(255), random(255), random(255));

    textSize(20);
    text("Phenomenal!", 375, 100);
    text("Press h to continue", 300, 450);
    }
      }
 if(keyPressed == true) { 
    if(key == 'h'){

   
    background (picturecurrent );
    background(image7);
    fill(random(255), random(255), random(255));
    
    textSize(17);
    text("Yay! \n Everyone's happy!", 350, 100);

    }
 }

}


