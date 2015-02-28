
PImage bg;

void setup () {

  size(400, 400);

  bg = loadImage("swirl.jpg");

}

void draw () 

{

  background(bg);

  fill(10, 242, 56);

  //gir's head

  rect(120, 100, 140, 100);

  //fill(255, 255, 255);

  frameRate(3);

  fill( random( 250), random(250), random(250));

  frameRate(10);

  //gir's right eye

  ellipse(120, 140, 60, 60);

  fill(0, 0, 0);

  ellipse(112, 140, 10, 10);

  //gir's left eye

  //fill(255, 255, 255);

  frameRate(10);

  fill(random(250),random(250),random(250));

  ellipse(227, 140, 60, 60);

  frameRate(10);

  fill(random(0),random(0),random(0));

  ellipse(235, 150, 10, 10);

  //gir's body

  fill(19, 242, 56);

  rect(134, 198, 102, 92);

  //gir's stroke on his head

  strokeWeight(3);

  line(176, 109, 176, 111);

  line(176, 121, 176, 123);

  line(176, 135, 176, 130); 

  line(176, 145, 176, 150);

  line(176, 160, 176, 165);

  frameRate(10);

  triangle(176, 178, 180, 176, 170, 176);

  line(176, 183, 176, 178);

  line(176, 192, 176, 188);

  //gir's mouth and tounge

  line(180, 193, 209, 193);

  int endX=mouseX;

 int endY=mouseY;

  if(mouseX>209)

  {

    endX=209;

  }

  if(mouseX<180)

  {

    endX=180;

  }

  if(mouseY>193)

  {

    endY=193;

  }

  if(mouseY<193)

  {

    endY=193;

  }

  fill(250, 182, 221);

  rect(endX, endY, 13, 17);

   




  fill(random(250),random(250),random(250));

  //gir's ears

   //Gir's ear moving

  endX=mouseX;

  endY=mouseY;



  if(mouseX> 198)

  //then

{

  endX=198;

}

if(mouseX<120)

//then

{

  endX=120;

}

  rect(158, 76, 13, 25);

  rect(198, 76, 13, 25);

  //legs

  rect(204, 289, 13, 25);

  rect(159, 289, 13, 25);

  //arms

  rect(235, 230, 10, 18);

  rect(122, 230, 10, 18); 

  

  //Gir's pig

  //head

 fill(245,142,224);

  ellipse(255,263,58,58);

  //body

  ellipse(275,320,70,70);

  //legs 

  rect(279,353,12,13);

  rect(265,353,12,13);

  //arm

  rect(239,328,12,13);

  //nose

  ellipse(250,268,25,20);

  fill(0,0,0);

  ellipse(245,268,6,8);

  ellipse(253,268,6,8);

  //left eye

  fill(255);

  ellipse(244,253,15,15);

  fill(random(250),random(250),random(250));

  ellipse(244,253,8,8);

  //right eye

  fill(255);

  ellipse(259,253,15,15);

  fill(random(250),random(250),random(250));

  ellipse(259,253,8,8);

  //pig's left ear

  fill(245,142,224);

  ellipse(239,233,15,15);

  //inside of the ear

  fill(random(250),random(250),random(250));

  ellipse(239,233,8,8);

  //pig's right ear

  fill(245,142,224);

  ellipse(262,233,15,15);

  //inside of ear

   fill(random(250),random(250),random(250));

   ellipse(262, 233,8,8);

  



  

}
