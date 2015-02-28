
{
  size(500,650);
  background(255);
  smooth();
  strokeWeight(2);
  fill(40,60,215);
  textAlign(LEFT,TOP);
  //Setup
}
rect(100,100,300,475); //Big box
{
  rect(120,75,260,25);
  rect(137.5,55,225,20);
  triangle(137.5,55,250,45,362.5,55);
  //Roof
}
{
  rect(235,40,30,7.5);
  line(235,40,232.5,10);
  line(265,40,267.5,10);
  fill(51);
  rect(232.5,8.5,35,1.5);
  rect(235,4,30,4.5);
  fill(255);
  rect(237.5,10,25,30);
  line(250,40,250,10);
  line(250,30,237.5,32);
  line(250,30,262.5,32);
  line(250,20,237.5,22);
  line(250,20,262.5,22);
  //Light on top
}
{
  fill(40,0,120);
  rect(125,105,250,27.5);
  fill(255);
  PFont font;
  font = loadFont("SansSerif-24.vlw");
  textFont(font);
  String P = "POLICE";
  String B = "BOX";
  String PU = "PUBLIC";
  String C = "CALL";
  text(P,145,102.5);
  text(B,300,102.5);
  font = loadFont("SansSerif-12.vlw");
  textFont(font);
  textAlign(CENTER,TOP);
  text(PU,262.5,105);
  text(C,262.5,118);
  //Police box label
}
{
  fill(40,60,215);
  rect(137.5,137.5,225,412.5);
  line(250,137.5,250,550);
  rect(150,250,87.5,87.5);
  rect(150,350,87.5,87.5);
  rect(150,450,87.5,87.5);
  rect(262.5,250,87.5,87.5);
  rect(262.5,350,87.5,87.5);
  rect(262.5,450,87.5,87.5);
  rect(87.5,562.5,325,12.5);
  //Doors
}
{
  fill(255);
  rect(262.5,150,87.5,87.5);
  rect(150,150,87.5,87.5);
  stroke(0);
  line(150,193.75,237.5,193.5);
  line(179.17,150,179.17,237.5);
  line(208.33,150,208.33,237.5);
  line(262.5,193.5,350,193.5);
  line(291.67,150,291.67,237.5);
  line(320.83,150,320.83,237.5);
  //Windows
}
{
  fill(220);
  rect(162.5,262.5,62.5,62.5);
  line(150,250,162.5,262.5);
  line(150,337.5,162.5,325);
  line(237.5,250,225,262.5);
  line(237.5,337.5,225,325);
  //Door directions
}
{
  strokeWeight(6);
  stroke(100);
  line(243.5,275,243.5,312.5);
  line(256.5,275,256.5,312.5);
  //Door handle
}
{
  strokeWeight(1);
  stroke(220);
  fill(220);
  ellipse(256.5,325,6,6);
  //Lock
}

