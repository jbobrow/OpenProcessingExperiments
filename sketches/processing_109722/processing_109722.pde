
//Eleni Katrini
//ekatrini@andrew.cmu.edu
//copyright © Eleni Katrini, September 2013
//HW05_Oh People!


float globalX, globalY, wd, ht;
color col= color(245, 25, 32);


void setup()
{
  size(900, 400);
  globalX= 500;
  globalY= 200;
  wd= 50;
  ht= 50; 
}

void draw()
{
  background(col);
  drawGround(0, globalY + height*.25, width, height*.55, #FFFFFF);
  
  if (mouseX < width*.32 && mouseX > width*.05)
  {
    infoFood(30, 50, 60, 60, #FFFFFF);
  }
  else if (mouseX < width*.64 && mouseX > width*.36)
  {
    infoWaste(325, 50, 60, 100, #FFFFFF);
  }
  else if (mouseX > width*.67 && mouseX < width*.95)
  {
    infoWater(globalX + width*.15, globalY - height*.40, 50, 70, #FFFFFF);
  }
  drawPerson(mouseX, 205, 50, 200, #FFFFFF);
}




//ground: a, b are point on screen, wdg, htg are width and height 
void drawGround(float a, float b, float wdg, float htg, color colg) 
{
 fill(colg);
 noStroke();
 rectMode(CORNER);
 rect(a, b, wdg, htg);
 fill(col);
 textSize(80);
 text("FOOD", globalX - width*.53, globalY + height*.395);
 text("WASTE", globalX - width*.22, globalY + height*.395);
 text("WATER", globalX + width*.13, globalY + height*.395);
 textSize(9);
 text("source: USDA, EPA and USGS", globalX - width*.49, globalY + height*.49);
 }

//person: x, y are point on screen, wdp and htp are width and height of person
void drawPerson(float x, float y, float wdp, float htp, color colp)
{
  fill(colp);
  noStroke();
  ellipse(x, y - htp*.45, wdp*.4, htp*.1); 
  rectMode(CENTER);
  rect(x, y - htp*.15, wdp, htp*.45, wdp*.14);
  rect(x - wdp*.18, y + htp*.25, wdp*.3, htp*.45, wdp*.14);
  rect(x + wdp*.18, y + htp*.25, wdp*.3, htp*.45, wdp*.14);
}

//food logo xf, yf are point on screen, wdf, htf are width and height of food
//source: USDA ERS (http://www.ers.usda.gov/data-products/commodity-consumption-by-population-characteristics.aspx#27851)
void infoFood( float xf, float yf, float wdf, float htf, color colf)
{
 fill(colf);
 ellipse(xf, yf, wdf*.66, htf*.66);
 fill(col);
 ellipse(xf + wdf*.29, yf - htf*.33, wdf*.45, htf*.45);
 ellipse(xf + wdf*.33, yf - htf*.05, wdf*.5, htf*.5);
 fill(colf);
 ellipse(xf, yf - htf*.55, wdf*.08, htf*.25); 
 ellipse(xf - wdf*.13, yf - htf*.40, wdf*.25, htf*.08); 
 textSize(16);
 text("One person consumes 2.75", xf + 20, yf - 8);
 text("pounds of food per day", xf + 20, yf + 8);
}

//waste logo xw, yw are point on screen, wdw, htw are width and height of waste
//souce: EPA (http://www.epa.gov/osw/facts-text.htm)
void infoWaste(float xw, float yw, float wdw, float htw, color colw)
{
 fill(colw);
 rectMode(CENTER);
 rect(xw, yw + htw*.05, wdw, htw*.9, wdw*0.05);
 fill(col);
 triangle(xw - wdw*.5, yw + htw*.5, xw - wdw*.35, yw + htw*.5, xw - wdw*.5, yw - htw*.4);
 triangle(xw + wdw*.5, yw + htw*.5, xw + wdw*.35, yw + htw*.5, xw + wdw*.5, yw - htw*.4);
 strokeWeight(3);
 stroke(col);
 strokeCap(ROUND);
 line(xw, yw - htw*.25, xw, yw + htw*.35);
 line(xw - wd*.3, yw - htw*.25, xw - wd*.2, yw + htw*.35);
 line(xw + wd*.3, yw - htw*.25, xw + wd*.2, yw + htw*.35);
 strokeWeight(1);
 line(xw - wd*.7, yw - htw*.35, xw + wd*.7, yw - htw*.35);
 fill(colw);
 rect(xw, yw - htw*.45, wdw*.4, htw*.07, wdw*0.05);
 textSize(16);
 text("One person produces 4.43", xw + wdw*0.6, yw - 8);
 text("pounds of waste per day", xw + wdw*0.6, yw + 8);
}

//water logo xwa, ywa, are point on screen, wdwa, htwa are width and heigth of water
//source: USGS (http://ga.water.usgs.gov/edu/qa-home-percapita.html)
void infoWater(float xwa, float ywa, float wdwa, float htwa, color colwa)
{
 fill(colwa);
 noStroke();
 ellipse(xwa, ywa + htwa*.16, wdwa, htwa*.66);
 fill(col);
 fill(colwa);
 noStroke();
 triangle(xwa - wdwa*.5, ywa + htwa*.16, xwa, ywa - htwa*.5, xwa + wdwa*.5, ywa + htwa*.16);
 fill(col);
 ellipse(xwa + wdwa*.3, ywa + htwa*.2, wdwa*.1, htwa*.2);
 fill(colwa);
 textSize(16);
 text("One person uses 100", xwa + 30, ywa - 8);
 text("gallons of water per day", xwa + 30, ywa + 8);
}


