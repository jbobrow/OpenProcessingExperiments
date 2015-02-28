
void setup(){//start setup
  background(255);//background color
  size(600,600);//size
  robot();//call robot
  light();//call light
}//end setup

void robot(){//robot function
  fill(220);//gray
  rect(115,140,20,50);//neck
  rect(100,100,50,50);//head
  quad(165,170,145,180,220,280,240,270);//right arm
  quad(85,170,105,180,40,280,20,270);//left arm
  rect(85,260,30,110);//left leg
  rect(135,260,30,110);//right leg
  rect(85,170,80,100);//left foot
  rect(80,360,40,20);//right foot
  rect(130,360,40,20);//body
}//end function
void light(){//light function
  if (random(0,10) >=5){//if chose #
    fill(255,0,0);//red
    text("I am a bad guy. I kill innocent poeple, including kids.",20,80);//bad text
    text("If anyone dares to challenge me, then I will make sure you will regret it.",20,95);//bad text
  } else{//if not
      fill(0,0,255);//blue
      text("I am a good guy. I help many people, including kids.",20,80);//good text
      text("There are some things that I will kill: parasites and invasive species.",20,95);//good text
  }//end if else
  rect(110,110,10,10);//right eye
  rect(130,110,10,10);//left eye
  rect(110,130,30,10);//mouth
  rect(100,185,50,70);//center
  rect(95,290,10,50);//left leg
  rect(145,290,10,50);//right leg
  quad(70,200,80,205,45,265,35,260);//left arm
  quad(170,200,180,195,225,260,220,265);//right arm
}//end function

