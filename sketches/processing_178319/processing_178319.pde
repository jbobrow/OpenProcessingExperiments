
//Global Variables
import ddf.minim.*;
Minim minim;
AudioPlayer boomerang;
AudioPlayer bells;
PImage[] photo = new PImage[6];//Photo array
float angle;
int x;

//Setup 
void setup() { 
 
   size(1080, 720);
   for (int i = 0; i < photo.length; i ++){ //assign photos to array
     photo[i] = loadImage( i +".jpg");
     frameRate(30);
   }
   for(int i=0; i  < photo.length; i ++) //make sure photos fit in canvas
   {
   photo[i].resize(1080,720);
   }   
   minim = new Minim(this);
   boomerang = minim.loadFile("Boomerang.mp3"); //assign audio file
   boomerang.play(); //play sound
   boomerang.loop(); //loop sound


}
//Display and Rotate Photos 
void draw() {
 x = int(random(6)); //randomize the photo

  angle += 50; //increment angle by 50

//rotate image
 pushMatrix();

 translate(width/2, height/2);
 rotate(radians(angle));
 translate(-photo[x].width/2, -photo[x].height/2);
 image(photo[x], 0, 0);

 popMatrix();
 
}
void keyPressed(){
  if(key==' '){//if Spacebar pressed
    bells = minim.loadFile("bells.mp3");//assign audio file
    boomerang.pause();//pause looping audio
    bells.play();//play bells
    noLoop();//stop the rotating image
    image(photo[x], 0, 0);    
  }
}
void mouseReleased(){
  boomerang.play();//play audio again
  boomerang.loop();
  loop();//begin rotating photo
}



