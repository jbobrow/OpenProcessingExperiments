
int i;                       //loop variable

void setup(){
  size(500,500);             //window size
  background(0);             //black
  frameRate(5);              //how fast it goes
  strokeWeight(2);           //line size
}

void draw(){
  
  if(random(0,1)<.5)         //probablility of color- red to white
  {stroke(255,255,255);}    //white line
    else
  {stroke(145,215,247);}    //blue line

  for(i=0; i< 15; i++){     //line range
    line(
    random(0,500),          //top range
    random(0,500),          //left range
    random(250,0),          //bottom range
    random(215,0));         //right range
  }
  
  //triangle
  noStroke();               //no stroke
  fill(255,255,0);          //yellow
  quad(250, 110+20, 330, 300+20, 250, 250+20, 170, 300+20);//star
  triangle(160,170+20,340,170+20,250,250+20);//star
  fill(0);                  //black
  rect(232,200,10,20);      //star eyes
  rect(260,200,10,20);      //star eyes

  textSize(50);             //size
fill(0);                    //black for text
text("BELIEVE", 155, 130);  //believe text
}

