

import ddf.minim.*;
 PImage thanks;


/*You can fire the fireworks by clicking somewhere you want.
I translated the point of the sparks to make the distance from each other not equally.
I shifted the center of the center circle a little bit to get the effect of sparkling.
I set the color to be changed due to the place you click.
You can make the canvas back to black by delete key or backspace key.
You can change spark colors by keyboard input as follows
press 'r' = red
press 'y' = yellow
press 'w' = white
*/
//Global Variables
Minim minim;
AudioSample fireworksl;
AudioSample fireworksr;

 color sparkColor = color(0,height,100,10);
//setup()
void setup(){
  minim = new Minim(this);
  fireworksl = minim.loadSample("fireworksl.wav");
  fireworksr = minim.loadSample("fireworksr.wav");
  size(1000,600);
  colorMode(HSB,width, height, 100, 100);
  background(0);
  textSize(16);
  textAlign(CENTER);
  fill(#F2FA19);
  
   text("Please Click anywhere and you can fire a fireworks there and hear the sound.",width/2,50);
    text("Press 'r' in the keyboad and can change the color of spark to red.",width/2,80);
     text("Press 'w' in the keyboad and can change the color of spark to white. ",width/2,110);
      text("Press 'y' in the keyboad and can change the color of spark to yellow.",width/2,140);
       text("Press 'DELEAT' or 'Backspace' and can erase your drawings.",width/2,170);
        text("Press 'p' in the keyboad and can see an image.",width/2,200);
 text("Hope you enjoy＼(^o^)／",width/2,260);  
 thanks = loadImage("Final message.png");

}
void draw(){
  
if(mousePressed){
  background(0);
  for(int i = 0; i < 360; i+=10){
    float x = mouseX;
    float y = mouseY;
   pushMatrix();
    translate(x,y);  //shift the point where fireworks open to the mouse point
    rotate(radians(i));
  
  //make fire works
    
//center circles   
   for(int d = 0; d < 80; d+=20){
     noFill();
       strokeWeight(d);
     stroke(x,y,100,2);
   ellipse(d/2, d/2, d, d);
   }
   
  //red fire   
   for(int f=30; f <height;f+=30){   
   translate(0,f);  //for the effect of sparcles "the farther, the longer"
    noStroke();  
   fill(sparkColor);   //make the sparks transparent for making fantastic effect
   arc(0,f+50,30,30,0,PI);  //make the shape of sparks
   triangle(0,f,-15,f+50,15,f+50);
  //yellow fire
   fill(62*width/360,height,100,10);
   arc(0,f+30,10,10,0,PI);
   triangle(0,f,-5,f+30,5,f+30);
   if( x < 640){fireworksl.trigger();}
   if( x > 640){fireworksr. trigger();
   }
   }
   popMatrix();   

   printMatrix();

  }
}
}
//keyPressed()
void keyReleased(){
  if(key == DELETE || key == BACKSPACE) background(0);
  if(key == 's' || key == 'S') saveFrame("screenshot.png");
  if(key == 'p' || key == 'P') image(thanks,0,0); 
  
  switch(key){
    case 'r':
      sparkColor = color(0,height,100,10);
      break;
    case 'w':
      sparkColor = color(width,height/6,100,10);
      break;
    case 'y':
      sparkColor = color(48*width/360,height,100,10);
      break;
    
    
  }
}

