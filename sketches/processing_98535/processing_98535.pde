
int i; //Int variable 
float x; //Droplet of x

void setup(){//Setup of code
  size(800,800);//Screen size for drawing
  fill(255,255,255);//Background color
  frameRate(3);
  strokeWeight(4);//Weight of stroke lines of drawing
}

void draw(){//Calling out code
   if (random(0,1)<0.5) { //Pick color
    stroke(0); //Black stroke
  } else {
    stroke(130,40,180); //color
  }
  for (i=0;i<10;i++) {
    x = random (0,30); //how big
      fill(242,242,105); //color
  }
  smooth();//To make lines smooth
  fill(144,141,141);//Color of elephant body
  ellipse(400,400,500,500);//Elephant body code
  fill(0);//Stroke color  
  
  fill(144,141,141);//Color of elephant head
  ellipse(400,300,400,400);//Size and location of elephant head
  fill(255);//Pupils of elephant eyes
  ellipse(460,300,100,100);//Location and code of elephant left eye
  ellipse(340,300,100,100);//Location and code of elephant right eye
  fill(0);//Eye color of black eyeball
  ellipse(445,310,30,30);//Location and code of elephant left eye
  ellipse(355,310,30,30);//Location and code of elephant right eye

  fill(0);//Color for elephant mouth
  ellipse(450,420,50,50);//Location and code of elephant mouth
  
  fill(144,141,141);//Elephant feet color
  ellipse(290,600,150,200);//Left small foot code
  ellipse(510,600,150,200);//Right small foot code
  ellipse(140,550,200,300);//Left foot big code
  ellipse(650,550,200,300);//Right foot big code
  fill(255);//COde for hoofs under elephant feet
  ellipse(290,600,50,100);//Left small foot hoof code
  ellipse(510,600,50,100);//Right small foot hoof code
  ellipse(140,550,100,150);//Left big foot hoof code
  ellipse(650,550,100,150);//Right big foot hoof code
  tie();
}

void tie(){
  fill(0);//Color for hat on elephant 
  rect(200,180,400,50);//Bottom strip of hat (the rim of a hat)code
  rect(240,10,320,200);//Top of the hat code
  fill(255,0,0);//Tie and strip on hat color
  ellipse(380,520,20,50);//Left part of bow tie code
  ellipse(420,520,20,50);//Right part of bow tie code
  ellipse(400,520,30,20);//Middle partof bow tie code
  rect(237,100,325,50);//Strip on hat code
}

