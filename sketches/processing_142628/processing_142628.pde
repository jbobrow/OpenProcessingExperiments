
void setup() {
 size(900,300);
 background(220,220,220);
 noStroke();
 setColor("r");
  
  //rect(x,y,b,h)
  
  //F
  rect(45,85,30,125);
  rect(80,85,50,30);
  rect(80,135,30,30);

  //L
  rect(155,85,30,125);
  rect(190,180,50,30);

  //O
  rect(270,85,30,125);
  rect(340,85,30,125);
  setColor("b");
  rect(305,85,30,30);
  rect(305,180,30,30);
  
   //R
   rect(455,180,30,30);
   setColor("r");
   rect(400,85,30,125);
   rect(435,85,30,30);
   rect(435,145,30,30);
   rect(470,115,30,30);
   
   //I
   rect(525,140,30,70);
   setColor("b");
   rect(525,85,30,30);
   
   //A
   rect(615,155,30,30);
   setColor("r");
   rect(580,125,30,85);
   rect(650,125,30,85);
   rect(615,85,30,30);
   
   //N
   rect(710,85,30,125);
   rect(820,85,30,125);
   setColor("b");
   rect(745,90,30,30);
   rect(765,135,30,30);
   rect(785,175,30,30);
}
 
void setColor(String selection) {
  if(selection == "r") fill(132,32,22);
  else if(selection == "b") fill(90,167,213);
}



