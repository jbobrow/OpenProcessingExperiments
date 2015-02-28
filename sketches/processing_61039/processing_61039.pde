
Animation check7;
Animation dino7;
class Animation{
 PImage[] images;
 int imageCount;
 int frame;
Animation (String imagePrefix, int count, int padding, String extension){
imageCount = count;
 images = new PImage[imageCount];
  for(int i = 0; i < imageCount; i++){
String filename = imagePrefix + nf(i, padding) + extension;
 images[i] = loadImage(filename);
 }
 }
void display(float xPos, float yPos){
  frame = (frame+1) % imageCount;
  image(images[frame], xPos, yPos); 
 }
 }
import ddf.minim.*;
AudioPlayer player;
Minim minim;
void setup(){
   size(640, 360, P3D);  //set the size of the display area
  frameRate(7);   
  check7 = new Animation("check7/DinoAntwoordAnimation", 284, 5, ".png");  //instantiate a copy of an animated sprite using our nifty new animation class
  dino7 = new Animation("dino7/DinoDanceAnimation", 125, 5, ".png"); //instantiate another for another
 minim = new Minim(this);  
  player = minim.loadFile ("Soundtrack/05 Fatty Boom Boom.mp3", 2048);   
 player.play();
 }
void draw(){
 check7.display(0, 0);
 dino7.display(170, 65);
 }


