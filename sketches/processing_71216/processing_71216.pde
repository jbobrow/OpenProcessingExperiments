
//InfoGraphic showing women's earnings as a percent of mens in the years 2000 and 2010, while showing that women are earning the majority of all degrees at all levels in these same years.
//by Vesselina Ivanova

void setup(){
  size(600,800);
  background(255);
  smooth();
}

//graph
void draw(){
  //blue rec
  noStroke();
  fill(185,221,255,255);
  rect(80,120,460,600);
  
  //white lines
  stroke(255);
  line(70,570,540,570);
  line(70,420,540,420);
  line(70,270,540,270);
  
  //pink recs
  stroke(255,82,232,255);
  fill(255,203,248);
  rect(120,470,170,250);
  rect(330,410,170,310);
  
  //black lines
  stroke(20);
  line(80,120,80,720);
  line(80,720,540,720);
  
  //pie percents 2000
  noStroke();
  fill(255,145,0,255);
  arc(170,670,100,100,radians(0),radians(216));
  fill(255,234,0,255);
  arc(170,570,100,100,radians(0),radians(216));
  fill(186,52,255);
  arc(240,620,100,100,radians(0),radians(208.8));
  fill(73,201,0,255);
  arc(240,520,100,100,radians(0),radians(169.2));
  
  //circles 2000
  stroke(255,150);
  fill(255,145,0,60);
  ellipse(170,670,100,100);
  fill(255,234,0,60);
  ellipse(170,570,100,100);
  fill(186,52,255,60);
  ellipse(240,620,100,100);
  fill(73,201,0,60);
  ellipse(240,520,100,100);
  
  //pie percents 2010
  fill(255,145,0,255);
  arc(380,670,100,100, radians(0),radians(223.2));
  fill(186,52,255,255);
  arc(450,600,100,100,radians(0),radians(208.8));
  fill(255,234,0,255);
  arc(380,530,100,100,radians(0),radians(226.8));
  fill(73,201,0,255);
  arc(450,460,100,100,radians(0),radians(190.8));
  
  //circles 2010
  stroke(255,150);
  fill(255,145,0,60);
  ellipse(380,670,100,100);
  fill(186,52,255,60);
  ellipse(450,600,100,100);
  fill(255,234,0,60);
  ellipse(380,530,100,100);
  fill(73,201,0,60);
  ellipse(450,460,100,100);
  
  //key
  fill(255);
  rect(215,145,180,105,7);
  fill(255,145,0,255);
  rect(220,150,20,20,5);
  fill(186,52,255,255);
  rect(220,175,20,20,5);
  fill(255,234,0,255);
  rect(220,200,20,20,5);
  fill(73,201,0,255);
  rect(220,225,20,20,5);
  
  //text for key
  fill(0);
  textSize(15);
  text("Associate's Degree",250,165);
  text("Bachelor's Degree",250,190);
  text("Master's Degree",250,215);
  text("Doctor's Degree",250,240);
  
  //text for percents on size of chart
  text("100%",30,130);
  text("90%",30,280);
  text("80%",30,430);
  text("70%",30,590);
  text("60%",30,730);
  
  //years
  text("YEAR",290,770);
  fill(255,46,245,255);
  text("2000",187,750);
  text("2010",397,750);
  
  //Intro
  fill(214,255,214,255);
  bezier(80,110,20,-33,600,-33,540,110);
  fill(61,160,62,255);
  textSize(20);
  text("Women's Wages as % of Men's",165,40);
  text("Compared to % Degrees Earned by Women",105,70);
  textSize(10);
  fill(0);
  text("*Info: United States Department Bureau of Labor Statistics",170,90);
  text("The Institute of Education Sciences",227,105);
}
