
//hw 12, suzanne1, suzanne choi
//2013 copyrights. suzanne choi. all rights reserved.

PImage b;
int [] suicideattempt={3,1};
int [] mentalhealth={29, 17};
int [] depression={25,10};

void setup()
{
size(400,400);
b= loadImage("boygirl.jpg");
background (b);
smooth();
}

void draw()
{
suicide();
mentalhealth();
depression();
showdata(mouseY);
}

void suicide()
{
  noStroke();
  fill(86,90,85);
  rect(0,height*.86,width,height*.1);
  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("suicide ratio", width/2, height*.92);
}

void mentalhealth()
{
  noStroke();
  fill(131,180,107);
  rect(0,height*.76,width,height*.1);
  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("mental health prob.", width/2, height*.82);
}

void depression()
{
  noStroke();
  fill(122,139,175);
  rect(0,height*.66,width,height*.1);
  fill(255);
  textSize(15);
  textAlign(CENTER);
  text("depression rate", width/2, height*.72);
}

void showdata(int y)
{
 if (y > height*.66 && y < height*.75)
 {fill (255);
 textSize(20);
 text(depression[0], width*.31, height*.52);
 text (depression[1],width*.66,height*.52);
 text("%", width*.36, height*.52);
 text ("%",width*.71,height*.52);}
 
 else if ( y > height*.76 && y < height*.85)
 {fill (255);
 textSize(20);
 text(mentalhealth[0], width*.31, height*.52);
 text (mentalhealth[1],width*.66,height*.52);
 text("%", width*.36, height*.52);
 text ("%",width*.71,height*.52);}
 
 else if (y> height*.86 && y< height*.95)
 {
 fill (255);
 textSize(20);
 text(suicideattempt[0], width*.32, height*.52);
 text (suicideattempt[1],width*.68,height*.52);}

 else{
 noStroke(); 
 fill (234,76,108); 
 ellipse (width*.32,height*.5,75,75);
 fill(16,166,178);
 ellipse (width*.68,height*.5,60,60);}
}




