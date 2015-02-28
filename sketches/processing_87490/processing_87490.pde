
int circleRadius = 20;
PFont f;
float ts;
//String data[] = {"Georgia","Helvetica"};
//String str = new String(data);
float t = 0;
float txBase = 0.;
float tsizeBase = 0.;

void setup()
{
  
  //float _Style = (index1 + 1) % str.length;
  f = createFont("Georgia",50,true);
  textFont(f);
  size(1000, 500);
  background(255);
  smooth();

  
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  fill(30);
  
  float numWords;
  if (mouseX < width / 2) {
    numWords =(width / 2 - mouseX)/5 ;
  }
  else {
     numWords =1;
  }
  
  float wordDegree = 360 / numWords; 
  float tsize = tsizeBase;
  float textsize = 10;

  
  for(int i = 0; i < numWords; i++)
  {
    pushMatrix();
    textsize = map( sin(tsize), -1., 1., -10, 40);
    textsize = constrain(textsize, 20, 60);
    textSize((int)textsize);
    tsize -= 0.3;
    
    if (mousePressed == true) {
    t += 0.008;
    float rad = i * wordDegree * t;
    float x2 = cos(radians(rad)) ;
    float y2 = sin(radians(rad)) ;
    translate(x2, y2);
    rotate(radians(rad));
        
    }else {
      
    float x = cos(radians(i * wordDegree)) * circleRadius;
    float y = sin(radians(i * wordDegree)) * circleRadius;
    translate(x, y);    
    rotate(radians(i * wordDegree));
    }

    text("*LET'S ROCK!*", 0, 0);
    popMatrix();
  }
   tsizeBase += 0.06;
  
} 



