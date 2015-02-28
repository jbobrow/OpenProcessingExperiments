
//Maddy C CP1 14/15 eight ball 
String [] answers = {"whatever you want, gurl","I think you need a hug <( ' v ' )>","do you have cake?","oh no you didn't!","he's definitely cheating","do I look fat?","may the force be with you","MYYYY PREECCIIIOOUUSS","um... look behind you..."}; 
int x=8;
Boolean ball=false;
void setup() 
{
  noLoop();
  size(200,200);
  background(255); 
}
void draw()
{
  if(ball==false)
  {
    stroke(0);
    fill(0);
    ellipse(100,100,200,200);
    fill(255);
    ellipse(100,50,130,80);
    ellipse(100,30,50,30);
    ellipse(100,65,80,40);
  }
  
  if(ball==true)
  {
    fill(0);
    ellipse(100,100,200,200);
    stroke(0,0,255);
    fill(0,0,255);
    triangle(70,50,130,50,100,80);
    fill(255);
    textAlign(CENTER);
    text(answers[int(random(0,9))],105,110);
  }
}
void mousePressed()
{
  ball=!ball;
  redraw();
}
