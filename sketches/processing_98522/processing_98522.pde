
int T = -330;//Int code for movement of Blossom

void setup(){//Setup of screen
  size(800,800);//Size of screen
  background(0);//Background color
  fill(0);//Color of stroke line
  strokeWeight(7);//Stroke weight, size of lines
}

void draw(){//Code call out
  T = T+1;//Int movement and pace of character
  T = min(0, T);//Location of where it stops
  fill(245,104,158);//Color of dress
  rect(330+T,450+T,150,250);//Dress code of Blossom
  fill(255);//Strip on dress code 
  rect(330+T,540+T,150,50);//Location of strip for dress
  smooth();//To make the rest of character smooth
  fill(245,222,222);//Color of Blossom skin tone
  ellipse(400+T,300+T,390,350);//Head code of  Blossom
  ellipse(300+T,550+T,50,200);//Left arm code for Blossom
  ellipse(500+T,550+T,50,200);//Right arm code for Blossom
  fill(255);//Pupil of Blossom left eye color
  ellipse(280+T,300+T,150,150);//Code for Blossom left eye
  fill(245,104,158);//Pink strip of Blossom left eye color
  ellipse(290+T,300+T,130,140);//Pink strip of Blossom left eye
  fill(0);//Black eye part of Blossom left eye color
  ellipse(295+T,300+T,105,105);//Code for black part of left eye
  fill(255);//White part of left eye color
  ellipse(295+T,300+T,65,65);//Code for left eye in pupil
  fill(255);//Pupil of Blossom right eye color
  ellipse(520+T,300+T,150,150);//Code for Blossom right eye
  fill(245,104,158);//Pink strip of Blossom right eye color
  ellipse(530+T,300+T,130,140);//Pink strip of Blossom right eye
  fill(0);//Black eye part of Blossom right eye color
  ellipse(535+T,300+T,105,105);//Code for black part of right eye
  fill(255);//White part of right eye color
  ellipse(535+T,300+T,65,65);//Code for right eye in pupil
  fill(0);//COlor for Blossom mouth
  ellipse(400+T,400+T,100,100);//Code for location of mouth
  fill(255);//Color for Blossoms one tooth
  rect(385+T,350+T,30,35);//One tooth location 
  fill(124,117,117);//Color for a part of braces on tooth
  rect(385+T,360+T,30,10);//Code for bracket and location
  fill(0,245,230);//Blue part of bracket on tooth
  rect(392+T,360+T,15,10);//Locaation of blue part on bracket
}



