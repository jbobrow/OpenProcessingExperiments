
//homework #12 - 48257 S'12
//melissa (macy) goh copyright 2012

//originally made for size 1200x600
//referenced the use of the "map" function from Tyler Porten

float [] numbers = {34.523, 26.168, 25.0, 22.720, 21.098, 19.623, 17.145, 16.225, 15.610, 15.213, 15.241, 15.139, 14.833, 14.708, 14.520};

String [] cities = {"Las Vegas, NV", "Colorado Springs, CO", "Tucson, AZ", "Sacramento, CA", "Albequerque, NM", "Mesa, AZ", "Miami, FL", "Denver, CO", "Jacksonville, FL", "Wichita, KS", "Pittsburgh, PA", "Portland, OR", "Fresno, CA", "Phoenix, AZ", "Tulsa, OK"};

PImage america;

float leftAlign, rightAlign, topAlign, bottomAlign, minNum, maxNum;

void setup()
{
  size(900, 450);
  smooth();
  stroke(255);
  frameRate(5);
     
  imageMode(CENTER);
  textAlign(RIGHT);
    
  america = loadImage("america.png");
  
  topAlign = 20;
  bottomAlign = height-20;
  leftAlign = width*.80;
  rightAlign = width-10;
  
  minNum = min(numbers) - 10;
  maxNum = max(numbers) + 10;
  
}

void draw()
{
  fill(0, 50);
  rect(0, 0, width, height);
  image(america, width*.40, height/2, width*.75, height);
  
  printTitle();
  printStats();
}

void printTitle()
{
  fill(255);
  textSize(width*.020);
  text("Top Cities for Suicide", width*.70, height*.10);
  textSize(width*.010);
  text("per 100,000 people annually", width*.70, height*.15);
}

void printStats()
{
  stroke(255);
  strokeWeight(1);
  textSize(width*.0125);
  
  for (int i = 0; i < numbers.length; i++)
  {
    float y = map (i, 0, numbers.length, topAlign, bottomAlign);
    float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
    fill(255);
    text(numbers[i], x-55, y + 15);
    fill(255);
    noStroke();
    rect(x-50, y,  rightAlign, height*0.04);
    fill(0);
    text(cities[i], rightAlign, y + 15);
  }
}

void mouseMoved()
{
  fill(255, 255, 0);
  noStroke();
  
  //Las Vegas
  if (mouseX > width*0.11 && mouseX < width*0.15 && mouseY > height*.48 && mouseY < height*.52)
  {
    hoverBubbles(width*0.13, height*.5);
   
    for (int i = 0; i < numbers.length - 14; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  }
  
  //Colorado Springs
  else if (mouseX > width*0.2625 && mouseX < width*0.3025 && mouseY > height*.455 && mouseY < height*.495)
  {
    hoverBubbles(width*0.2825, height*.475);
   
    for (int i = 1; i < numbers.length - 13; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  }
  
  //Tucson, AZ
  else if (mouseX > width*0.155 && mouseX < width*0.195 && mouseY > height*.655 && mouseY < height*.695)
  {
    hoverBubbles(width*0.175, height*.675);
   
    for (int i = 2; i < numbers.length - 12; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  }  
  
  //Sacramento, CA
  else if (mouseX > width*0.03 && mouseX < width*0.07 && mouseY > height*.38 && mouseY < height*.42)
  {
    hoverBubbles(width*0.05, height*.4);
   
    for (int i = 3; i < numbers.length - 11; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Albequerque, NM
  else if (mouseX > width*0.2275 && mouseX < width*0.2675 && mouseY > height*.575 && mouseY < height*.615)
  {
    hoverBubbles(width*0.2475, height*.595);
   
    for (int i = 4; i < numbers.length - 10; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Mesa, AZ
  else if (mouseX > width*0.1425 && mouseX < width*0.1825 && mouseY > height*.602 && mouseY < height*.642)
  {
    hoverBubbles(width*0.1625, height*.622);
   
    for (int i = 5; i < numbers.length - 9; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Miami, FL
  else if (mouseX > width*0.635 && mouseX < width*0.675 && mouseY > height*.865 && mouseY < height*.905)
  {
    hoverBubbles(width*0.655, height*.885);
   
    for (int i = 6; i < numbers.length - 8; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Denver, CO
  else if (mouseX > width*0.2635 && mouseX < width*0.3035 && mouseY > height*.415 && mouseY < height*.455)
  {
    hoverBubbles(width*0.2835, height*.435);
   
    for (int i = 7; i < numbers.length - 7; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Jacksonville, FL
  else if (mouseX > width*0.615 && mouseX < width*0.655 && mouseY > height*.795 && mouseY < height*.835)
  {
    hoverBubbles(width*0.635, height*.815);
   
    for (int i = 8; i < numbers.length - 6; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Wichita, KS
  else if (mouseX > width*0.3725 && mouseX < width*0.4125 && mouseY > height*.495 && mouseY < height*.535)
  {
    hoverBubbles(width*0.3925, height*.515);
   
    for (int i = 9; i < numbers.length - 5; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Pittsburgh, PA
  else if (mouseX > width*0.615 && mouseX < width*0.655 && mouseY > height*.370 && mouseY < height*.410)
  {
    hoverBubbles(width*0.635, height*.390);
   
    for (int i = 10; i < numbers.length - 4; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Portland, OR
  else if (mouseX > width*0.06 && mouseX < width*0.1 && mouseY > height*.150 && mouseY < height*.190)
  {
    hoverBubbles(width*0.080, height*.170);
   
    for (int i = 11; i < numbers.length - 3; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Fresno, CA
  else if (mouseX > width*0.06 && mouseX < width*0.1 && mouseY > height*.455 && mouseY < height*.495)
  {
    hoverBubbles(width*0.08, height*.475);
   
    for (int i = 12; i < numbers.length - 2; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Phoenix, AZ
  else if (mouseX > width*0.1225 && mouseX < width*0.1625 && mouseY > height*.612 && mouseY < height*.652)
  {
    hoverBubbles(width*0.1425, height*.632);
   
    for (int i = 13; i < numbers.length - 1; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
  
  //Tulsa, OK
  else if (mouseX > width*0.390 && mouseX < width*0.430 && mouseY > height*.565 && mouseY < height*.605)
  {
    hoverBubbles(width*0.410, height*.585);
   
    for (int i = 14; i < numbers.length; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
        
      fill(255, 255, 0, 50);
      noStroke();
      rect(x-50, y, rightAlign, height*0.04);
    }
  } 
}

void hoverBubbles(float x, float y)
{
  ellipse(x, y, 15, 15);
  fill(255, 255, 0, 50);
  ellipse(x, y, 25, 25);
  fill(255, 255, 0, 10);
  ellipse(x, y, 35, 35);
}





