
//import processing.opengl.*;

car mycar1;
car mycar2;
bullet mybullet;
boolean fire=false;
int count=0;
boolean test=false;
int rand1 = (int)(Math.random()*900);
PFont f;
int shots;
float m;
int beg=0;
boolean stop=false;

void setup()
{
  size(900, 300);//,OPENGL);  
  mycar1= new car(0, 100, 3, 127);
  mycar2= new car(0, 200, 2, 255);
  f= loadFont("C:/Users/rkamthe/Documents/Processing/test/moving_text/data/Andalus-48.vlw");
}

void draw()
{
  if (stop==false)
  {
    if (beg==0)
    {
      background(0);
      fill(255, 255, 0);
      textFont(f);
      textAlign(CENTER);
      text("new game", width/2, height/2);
      shots=0;
      if (mousePressed)
      {
        beg=1;
      }
    }
    else
    {
      background(0);
      mycar1.display();
      mycar1.drive();
      mycar2.display();
      mycar2.drive();

      if (fire==true)
      {

        mybullet.display1(); 
        mybullet.fire();
        test=true;
        collisionCheck();
      }
    }
  }
  if (shots==20)
  {
    try {
      gameOver();
      //stop=false;
    } 
    catch (InterruptedException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }
}


public void mousePressed() 
{  

  if (beg==1 && shots<20)
  {
    mybullet= new bullet(mycar2.xpos, mycar2.ypos);
    fire=true;
    shots++;
  }
  //if(shots==20){

  //}
}


public void collisionCheck()
{
  if (test && mybullet.b_xpos<(mycar1.xpos+10) && mybullet.b_xpos>(mycar1.xpos-10) && mybullet.b_ypos<(mycar1.ypos+10) && mybullet.b_ypos>(mycar1.ypos-10)) {// && mybullet.b_xpos<width && mybullet.b_ypos<height){

    mycar1.nodisplay();
    count++;
    test=false;
    int rand2 = (int)(Math.random()*900);
    mycar1= new car(rand2, 100, 3, 127);
    println("hits:" +count);
    println("shots: "+shots);
    m=(((float)count/(float)shots)*100);
    println("accuracy: "+(((float)count/(float)shots)*100));
  }
  else return;
}


public void mouseDragged()
{
  mycar2.speed= (float) (mycar2.speed+.1);
  mycar1.speed= (float) (mycar1.speed-.01);
}


public void mouseReleased()
{
  mycar2.speed= 2;
  mycar1.speed=3;
}


public class car {
  float xpos;
  float ypos;
  float speed;
  float c;

  car(float p, float q, float r, float s) {
    xpos= p;
    ypos= q;
    speed= r;
    c= s;
  }

  public void display()//displays objects
  {

    fill(c);
    rectMode(CENTER); 
    rect(xpos, ypos, 20, 20);
  }

  public void nodisplay()
  {//objects color is changed to background color
    fill(0);
    rectMode(CENTER); 
    rect(xpos, ypos, 20, 20);
  }

  public void drive()//increases speed in x direction
  {
    if (xpos<width)
      xpos= xpos+speed;
    else
      xpos=0;
  }
}


public class bullet
{

  public float b_xpos;
  public float b_ypos;
  public float speed;
  public float c1;


  bullet(float p, float q) 
  {
    b_xpos= p;
    b_ypos= q;
    speed= 2;
    //c1= 255;
  }



  public void display1()
  {

    fill(255);
    rectMode(CENTER); 
    rect(b_xpos, b_ypos, 10, 10);
  }

  public void fire()
  {
    if (b_ypos<height)
    {
      b_ypos= b_ypos-2*speed;
    }
  }
}


public void gameOver() throws InterruptedException
{

  if (beg!=0)
  {
    background(0);
    fill(255, 255, 0);
    textFont(f);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
    m=(((float)count/(float)shots)*100);
    text("Accuracy:"+m+"%", width/2, height/4);
  }
}


