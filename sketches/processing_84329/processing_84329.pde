
//Sun Kyung Park
//andrewID: sunkyunp
//Copyright Sun Kyung Park 2012

float [] numbers = {43583, 30108, 28413, 23313, 19755, 18124, 17309, 17207, 16975, 15402};

String [] countries = {"United States", "Indonesia", "United Kingdom", "Turkey", "France", "Phillipines", "Italy", "Canada", "Mexico", "India"};

PImage map;

float leftAlign, rightAlign, topAlign, bottomAlign, minNum, maxNum;

void setup () {
 size (900, 450);
 background (0);
smooth ();
stroke (255);
frameRate (5);

imageMode (CORNER);
textAlign (LEFT);

map = loadImage ("world-map-vector_2.jpg");

//topAlign = 10;
//bottomAlign = height-10;
//leftAlign = width;
//rightAlign = width;

minNum = min (numbers) - 10;
maxNum = max (numbers) + 10;

  
}


void draw () {
 fill (0);

imageMode (CORNER);
image (map, width, height, width, height);
image (map, 50,30,800,380);
  
}

void mouseMoved () {
  fill (22,242,240);
  noStroke ();
  
  //US
  if (mouseX > width*0.15 && mouseX < width*0.5 && mouseY > height*0.3 && mouseY < height*0.6 )
  {
    fill (255,31,31,80);
    hoverCircles (width*0.22, height*0.48);
    
    for (int i = 0; i < numbers.length - 9; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers [i], maxNum, minNum, leftAlign, rightAlign-10);
      
      fill (255,31,31, 80);
      noStroke ();
     
    }
  }
  
  //Indonesia
  else if (mouseX > width*0.5 && mouseX < width*0.9 && mouseY > height*.54 && mouseY < height*0.95)
  {
    fill(242,145,24, 80);
    hoverCircles(width*0.75, height*.65);
    
    for (int i = 1; i < numbers.length - 8; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(242,145,24, 80);
      noStroke();
      
    }
  }
  
  //UK
  else if (mouseX > width*0.2 && mouseX < width*0.65 && mouseY > height*.25 && mouseY < height*0.65 )
  {
    fill(117,24,160, 80);
    hoverCircles(width*0.46, height*.4);
    
    for (int i = 2; i < numbers.length - 7; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(117,24,160, 80);
      noStroke();
     
    }
  }
  
  //Turkey
  else if (mouseX > width*0.3 && mouseX < width*0.7 && mouseY > height*.4 && mouseY < height*0.75)
  {
    fill(100,55,10, 80);
    hoverCircles(width*0.56, height*.47);
    
    for (int i = 3; i < numbers.length - 6; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(100,55,10, 80);
      noStroke();
     
    }
  }
  
  //France
  else if (mouseX > width*0.3 && mouseX < width*0.6 && mouseY > height*.35 && mouseY < height*0.65)
  {
    fill(43,32,225, 80);
    hoverCircles(width*0.35, height*.4);
    
    for (int i = 4; i < numbers.length - 5; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(43,32,225, 80);
      noStroke();
      
    }
  }
  
  
  //Phillipines
    else if (mouseX > width*0.55 && mouseX < width*0.85 && mouseY > height*.55 && mouseY < height*0.95)
  {
    fill(220,224,32, 80);
    hoverCircles(width*0.9, height*0.7);
    
    for (int i = 5; i < numbers.length - 4; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(220,224,32,80);
      noStroke();
      
    }
  }
  
  //Italy
  else if (mouseX > width*0.3 && mouseX < width*0.7 && mouseY > height*.3 && mouseY < height*0.7)
  {
    fill(247,226,187, 80);
    hoverCircles(width*0.51, height*.45);
    
    for (int i = 6; i < numbers.length - 3; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(247,226,187, 80);
      noStroke();
      
    }
  }

  //Canada
  else if (mouseX > width*0.15 && mouseX < width*0.5 && mouseY > height*0.15 && mouseY < height*0.7)
  {
    fill(255, 255, 255, 80);
    hoverCircles(width*0.21, height*.38);
    
    for (int i = 7; i < numbers.length - 2; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(255, 255, 255, 80);
      noStroke();
    
    }
  }
  
  //Mexico
  else if (mouseX > width*0.15 && mouseX < width*0.5 && mouseY > height*0.3 && mouseY < height*0.8)
  {
    fill(25,137,33, 80);
    hoverCircles(width*0.31, height*.7);
    
    for (int i = 8; i < numbers.length - 1; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(25,137,33, 80);
      noStroke();
     
    }
  }
  
  //India
  else if (mouseX > width*0.3 && mouseX < width*0.9 && mouseY > height*0.3 && mouseY < height*0.8)
  {
    fill(191,155,64, 80);
    hoverCircles(width*0.67, height*.52);
    
    for (int i = 14; i < numbers.length; i++)
    {
      float y = map (i, 0, numbers.length, topAlign, bottomAlign);
      float x = map (numbers[i], maxNum, minNum, leftAlign, rightAlign-10);
         
      fill(191,155,64, 80);
      noStroke();
     
    }
  }
  
  
}


void hoverCircles (float x, float y) {
 ellipse (x, y, 20, 20);
fill (116,245,147, 50);

ellipse (x, y, 30, 30);
fill (42,180,75, 10);

ellipse (x, y, 40, 40);
fill (14,124,40, 50);
  
}









