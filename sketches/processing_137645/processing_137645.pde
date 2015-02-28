

float period = 5; //the speed at which the image swings
float amplitude = 0.5; // the amount the image can swing


void setup()
{
  size(400,300); // creat frame
}

void draw()
{
  background(200); //clears anything in the background
  translate(width/2,20); //moves the image without creating a new one
  float angle = motion(); //sets the pivot point of the pendulum
  rotate(angle); //rotates the image at the point angle
  pendulum(); //tells it what to rotate
}

void pendulum()//sets up the variable pendulum
{
  stroke(100); //defines a line
  strokeWeight(10); //gives it a width
  line(0,0,0,150); // where line is positioned and length of it
  stroke(250); 
  strokeWeight(8);//two lines above create white circle at top of pendulum arm
  point(0,0); //gives circle a point to be placed at
  fill(0,0,0);
  ellipse(0,200,100,100); //start of person on ball 
  fill(250,159,205);
  ellipse(-20,50,40,40);
  rect(-30,80,50,70);
  ellipse(-30,135,30,30);
  quad(20,120,70,170,60,180,20,140);
  quad(60,180,72,175,80,230,60,230);//end of person on ball
}

float motion()
{
 float time = norm(millis(),0,1000); //time of swing in seconds
 float fraction = norm(time,0,period); //time is period
 float shm = sin(fraction*TWO_PI); //simple harmonic motion multiply by 360 degrees/2pi radians
 float angle = shm*amplitude; //angle it swings at is 
 return angle; 
}


