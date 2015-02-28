
int x=0;//Int for body
int dir=5;//Int for direction

void setup(){//Setup for screen
  size(490,490);//Size of screen
  frameRate(5);//Framerate size
  background(0);//Background color
  fill(0);//Fill select color
}

void draw(){//Code callout
  fill(3,2,2);//Color selection for ellipse
  ellipse(300+x,150,100,100);//Ellipse code for bear ear
  fill(0);//Color selection for ellipse
  ellipse(200+x,150,100,100);//Ellipse code for inside of ear
  fill(255,255,255);//Color selection for head
  ellipse(200+x,150,50,50);//Ellipse code head outside
  ellipse(300+x,150,50,50);//Ellipse code head inside
  fill(3,2,2);//Color selection for fur
  ellipse(250+x,200,190,170);//Ellipse code for fur surrounding head
  fill(255,255,255);//Color selection for inside 
  ellipse(250+x,200,130,140);//Ellipse code for inside head

  ellipse(270+x,185,25,25);//Ellipse code for left eye
  ellipse(230+x,185,25,25);//Ellipse code for right eye
  fill(0);//Color selection of inside eye
  ellipse(270+x,185,10,10);//Ellipse code left eye pupil
  ellipse(230+x,185,10,10);//Ellipse code right eye pupil

  fill(234,0,0);//Color selection of tongue
  ellipse(250+x,210,25,20);//Tongue of bear code

  fill(0);//Color selection of mouth
  ellipse(250+x,240,40,25);//Mouth of bear code
  fill(255);//Color selection of teeth
  rect(250+x,228,10,15);//First tooth code
  rect(240+x,228,10,15);//Second tooth code
  
  fill(0);//Color selection of belly
  ellipse(250+x,380,300,200);//Outside belly code
  fill(255);//Color selection of belly
  ellipse(250+x,380,250,150);//Belly inside

  fill(0);//Color selection of arm
  ellipse(130+x,290,50,100);//Right arm inside
  fill(255);//Color selection of arm
  ellipse(130+x,280,30,70);//Left arm inside
  x=x+dir;//Movement of bear code
}

void mousePressed(){//Mouse code
  dir=0-dir;//Direction change movement
}

