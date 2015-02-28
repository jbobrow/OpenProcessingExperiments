
//Jeffrey Chen  CP1  Eight Ball November 16,2012
//URL: http://www.openprocessing.org/user/21148
String phrases[] = {
  "outlook not so good ", 
  "don't count on it ", 
  "my sources say no ", 
  "without a doubt ", 
  "reply hazy, try again ", 
  "it is certain ", 
  "my reply is no ", 
  "as I see it yes ", 
  "you may rely on it ", 
  "cannot predict now  ", 
  "better not tell you now ", 
  "very doubtful ", 
  "outlook good  ", 
  "yes definitely ", 
  "concentrate and ask again"
};
boolean mode = true;

void setup(){
  size(400,400);
  noLoop();
  textAlign(CENTER);
  textSize(20);
}
void draw(){
  int n= int(random(17));
  
  if(mode==true){
    fill(225,175,0);
    rect(0,0,width,height);
    
    fill(200,0,0);
    text("Think of a yes/no question then click on\nthe 8 on the ball to get an answer", (width/2.0), (height-55));
    stroke(0);
    fill(0,0,30);
    ellipse(200,170,250,250);
    fill(255);
    ellipse(width/2.0, height/2.0-100, 140, 80);
    strokeWeight(6);
    ellipse(200, height/2.0-117, 60, 25);
    ellipse(200,height/2.0-85, 90, 40);
    strokeWeight(1);
  }
  else if(mode==false){
    fill(225,175,0);
    rect(0,0,width,height);
    stroke(0);
    fill(0,0,30);
    ellipse(200,170,250,250);
    fill(119, 14, 227);
    triangle(140, 90, 260, 90, 195, 120);
    fill(255);
    text(phrases[n], width/2.0, height/2.0);
    fill(0);
    rect(0, 455, 500, 120);
    fill(200,0,0);
    text("Click on the triangle to ask another question", width/2.0, height-50);
  }
}
void mousePressed()
{
    mode = !mode;
    redraw();
  
}



