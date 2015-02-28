

  //used references from processing.org
  //infographic made by emry layton
  //information for graphic from http://www.huffingtonpost.com/2011/03/10/countries-most-time-spent-online_n_834326.html#s252060&title=11_India_
  size (875, 600);
  smooth ();
  background (0,102,102);
  noStroke ();
  fill (153,204,153);
  rect (22,22,825,550);
  fill (51,102,51);
  rect (75,40,730,120);
  PFont font;
  //banner
 
  fill (255,255,255);
  textSize (40);
  text ("Top Countries that Spend the Most",95,80);
  text ("Time Online",300,135);
  textSize (12);
  fill (0);
  text ("Based on a 2010 study of average internet use.",125,175);
  text ("By Emry Layton",625,175);
  
  //canada
  fill(0,51,0);
  triangle(75,450,60,500,90,500);
  triangle(75,390,60,440,90,440);
  triangle(75,330,60,380,90,380);
  triangle(75,270,60,320,90,320);
  triangle(75,210,60,260,90,260);
  textSize (18);
  fill(255);
  text ("Canada",45,525);
  fill(0);
  textSize (12);
  text ("43.5 Hours/Month",25,540);
  
  //usa
  fill (51,51,0);
  ellipse (250,475,42,42);
  ellipse (250,425,42,42);
  ellipse (250,375,42,42);
  ellipse (250,325,42,42);
  textSize (18);
  fill (255);
  text ("USA",235,525);
  fill(0);
  textSize (12);
  text ("35.3 Hours/Month",200,540);
  
  //uk
  fill (102,102,0);
  rect (430,460,30,30);
  rect (430, 410, 30,30);
  rect (430, 360, 30,30);
  rect (430,310,30,30);
  textSize (18);
  fill(255);
  text("UK",435,525);
  fill(0);
  textSize (12);
  text ("32.3 Hours/Month",395,540);
  
  //south korea
  fill (102,153,0);
  rect (610,460,35,35);
  rect (610,410,35,35);
  rect (610,360,35,35);
  textSize (18);
  fill (255);
  text ("S. Korea",590,525);
  fill (0);
  textSize (12);
  text ("27.7 Hours/Month",570,540);
  
  //france
  fill (102,204,0);
  quad (770,460,790,500,755,470,800,480);
  quad (770,410,790,450,755,420,800,430);
  quad (770,360,790,400,755,370,800,380);
  textSize (18);
  fill (255);
  text ("France",760,525);
  fill (0);
  textSize (12);
  text ("26.6 Hours/Month",735,540);
  
  
  //pretty shit
  stroke (255);
  line (50,550,825,550);
  stroke (0);
  line (50,560,825,560);
 
  strokeWeight (4); //thicker
   line (85,85, 790,85);
   line (290,140,550,140);


