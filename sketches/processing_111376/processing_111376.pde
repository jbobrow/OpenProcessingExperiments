
PImage Me; 
boolean filterApplied = false; 


void setup()
{

  size (500, 500);
  Me = requestImage("Me.jpg");


}


void draw()
{

  if (Me.width >0)
  {
    imageMode(CENTER);
    if(filterApplied == false)
    {
      Me.filter(INVERT);
      filterApplied = true;
  
    }
  }
  image (Me, width/2, height/2, Me.width*0.5, Me.height *0.5);
  
  fill(random(0, 255), random(200, 230), random(40, 210));
  rect(260, 147, 10, 10);
  rect(285, 150, 10, 15);


  float a = 265;
  float b = 151;
  float prevA = a;
  float prevB = b; 
  
  while (a < 300)
  {
    a += 5;
    b += random (-10, 20);
    line (prevA, prevB, a, b); 
    prevA = a;
    prevB = b; 
  
  }
  
  
  
  float c = 290;
  float d = 157;
  float prevC = c;
  float prevD = d; 
  
  while (c < 300)
  {
    c += 5;
    d += random (-10, 20);
    line (prevC, prevD, c, d); 
    prevC = c;
    prevD = d; 

}
}


