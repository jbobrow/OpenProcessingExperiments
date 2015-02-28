
//Polly Lesaguis, CP1, mods 4/5, Penguin :)


PImage dog;
PImage dog2;
PImage bone;
PImage dog3;
PImage dog4;
PImage dog5;
int x = 100;
int y = 100;
void setup()
{
  size(500,500);
  frameRate(15);
  dog = loadImage ("http://www.webweaver.nu/clipart/img/nature/dogs/dalmatian-pup-pounce.png");
  dog2 = loadImage("http://www.how-to-draw-cartoons-online.com/image-files/cartoon_puppy.gif");
  bone = loadImage("http://www.how-to-draw-and-paint-smart.com/image-files/how-to-draw-a-dog-bone-step-7.jpg");
  dog3= loadImage("http://www.dreamstime.com/happy-dog-cartoon-thumb15136347.jpg");
  dog4= loadImage("http://www.stufftotweet.com/tweetthis/wp-content/plugins/wp-o-matic/cache/38d5e_250px-Puppy-intro.jpg");
  dog5 = loadImage("http://www.smallbiztrends.com/wp-content/uploads/2008/04/puppy.JPG");
}
void draw()
{
  
//dog1
background(255,255,255);
image(dog,x,y,100,100);

//ball
fill(255,0,0);
ellipse(x+100,190,10,10);


//dog2
image(dog2,0,random(66),100,100);

//bone
image(bone,4,100,40,40);

//dog 3
image(dog3,800-x,random(100),200,200);

//dog4
image(dog4,500-x,random(140),80,80);

//dog5
image(dog5,400,400,100,100);

int direction = int(random(0,4));
if(direction == 0)
 {
  x = x + 20; //right
 }
else if (direction ==5)
 {
  y = y - 20;
 }
}
