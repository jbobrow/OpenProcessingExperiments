
//Jordan Leung 4,5 Computer Programming 
boolean mode= false; 
String lines[] = { "outlook not so good" , "don't count on it" , "my sources say no" ,"without a doubt"
 , "reply hazy, try again",
 "it is certain" ,
"my reply is no" ,
"as I see it yes" ,
"most likely" ,
"you may rely on it" ,
"cannot predict now" ,
"better not tell you now" ,
"very doubtful" , "outlook good" ,
"yes definitely" ,
"concentrate and ask again" };
int i= 0;
void setup()
{
noLoop();
size(500,500);

}

void draw()
{
  background(0);
if(mode== true)
{
  noStroke();
  fill(100,100,100);
 ellipse(250,220,350,350);
 fill(255);
 ellipse(250,140,170,150);
  fill(0,0,255);
    triangle(250,160,200,120,300,120);
  i= int(random(0,16));
  stroke(255);
  text(lines[i],300,250);

}
else
{
   noStroke();
  fill(100,100,100);
 ellipse(250,220,350,350);
  fill(255);
 ellipse(250,140,170,150);
 noFill();
 stroke(0,0,0);
 strokeWeight(5);
 ellipse(250,140,40,40);
 ellipse(250,100,35,40);
 
}
}
void mouseClicked ()
{ 

 
  mode= !mode;
redraw();
}
