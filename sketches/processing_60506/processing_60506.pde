
float i;
 
int kreise = 23;
 
float ersterdurchmesser = 300; //300
float durchmesserdifferenz = 13 ; //13
 
float xVersatz = 13;
float yVersatz;
 
float geschwindigkeit = 0.002;
 
void setup()
{
  frameRate(90); //30
  size(800, 800);
  textFont(createFont("Sans", 11));
  smooth();
  noStroke();
}
 
void draw()
{
  background(255);
  translate(width/2, height/2);
  pushMatrix();
  rotate(-20);
  for(int j = 0; j < kreise; j++)
  {
    if(j % 2 == 0) fill(222, 237, 240); else fill(230, j * 175/kreise, 120); //42
    rotate(i);
    //ellipse(0, 0, ersterdurchmesser - j * durchmesserdifferenz, ersterdurchmesser - j * durchmesserdifferenz);
    rect(0,0, ersterdurchmesser - j * durchmesserdifferenz, durchmesserdifferenz - j *ersterdurchmesser);
    translate(xVersatz, yVersatz);
  }
  popMatrix();
  i += geschwindigkeit;
  translate(-width/2, -height/2);
  fill(84);
  //text("Press \'1\' for preset one (default) or \'2\' for preset two!", 20, 18);
}
 
void keyPressed()
{
  if(key == '1')
  {
    kreise = 46; //23
    durchmesserdifferenz = 10; //13
    xVersatz = 7; //13
    geschwindigkeit = 0.001; //0.002
  }
  if(key == '2')
  {
    kreise = 40; //30
    durchmesserdifferenz = 300; //10
    xVersatz = 80; //90 
    geschwindigkeit = 0.001; //0.002
  }
}
