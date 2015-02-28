
int answer;
int x = 4;
int y = 5;

void setup()

{
  size (500, 400);//size of canvas
  smooth(); //makes lnes smooth
  background(555,555,555); //background colour, currently light blue
}

void draw()
{
  fill(255,228,196);//outer edge tv colour- light eggshell
  rect(100,100,300,200);//outer tv edge
  
  fill(139,71,38);//inner tv colour- brown
  rect(105,105,290,190);//inner tv edge
  
  fill(255,228,196);// colour- light eggshel
  rect(120,120,200,160);//tv screen
  
  fill(0,0,0);// colour- black
  rect(120,300,260,10);//base of tv
  

  line(120,120,130,130);//top left 3d effect line
  line(120,280,130,270);//bottom left --
  line(310,270,320,280);//bottom right--
  line(310,130,320,120);//top roght--
  
  fill(255,228,196);//colour- light egshell
  rect(325,120,60,160);//control pannel 
  
  fill(153,153,153);//colour-grey
  ellipse(355,145,39,39);//outler dial 1
  
  fill(255,228,196);//colour-light egshell
  ellipse(355,145,33,33);//inner dial 1
  line(342,135,367,155);//dial knob 1
  
  fill(153,153,153);//colout-grey
  ellipse(355,190,39,39);//outer dial 2
  
  fill(255,228,196);//colour-light egshell
  ellipse(355,190,33,33);//inner dial 2
  line(339,190,370,190);//dial knob 2
  
  fill(153,153,153);//colour-grey
  ellipse(340,213,7,7);//left control knob
  
  fill(153,153,153);//colour-grey
  ellipse(370,213,7,7);//right control knob
  
  fill(255,228,196);//colour-light egshell
  rect(335,220,40,55);//speaker box
  line(335,225,375,225);//horizontal speaker mesh lines
  line(335,230,375,230);
  line(335,235,375,235);
  line(335,240,375,240);
  line(335,245,375,245);
  line(335,250,375,250);
  line(335,255,375,255);
  line(335,260,375,260);
  line(335,265,375,265);
  line(335,270,375,270);
  line(335,275,375,275);
  line(355,220,355,275);//vertical mesh line
  
 
  line(250,100,170,30);//antema 1
  
  
  line(250,100,330,30);//antenna 2
  
  fill(0,0,0);//colour black
  arc(250, 100, 50, 30, PI, TWO_PI);//antenna base
   
  ellipse(170,30,10,10);//antenna head 1
  ellipse(330,30,10,10);//antenna head 2
   
  if((x!=y)&&(mousePressed))
 
  fill(255, 0, 0);
 
  else
 
  fill(153,153,153);//grey
  rect(130,130,180,140);//inner tv screen
  
 
}


