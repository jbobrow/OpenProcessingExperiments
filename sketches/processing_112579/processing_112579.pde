
//Christian Murphy

void setup()
{
 size(600, 600);
  //size(600,600, PDF, "wallpaper.pdf");
  background(0);
  smooth();
  frameRate(20);
}

void draw()
{
  float posY = (mouseY/width);
  
  float posX = random(0, width);
   int numberOfLines = 25;
 int distance = round(width / numberOfLines);
  int r;
 
  int j;

for(int i = 1; i<30; i++)
{
  strokeWeight(random(1, 15));
  stroke(0);
 // stroke(0, 0, i*20, random(250));
  
  line(0, i*40, width, i*40);
  

}

for(int q = 5; q<125; q++)
{
  strokeWeight(3);
  stroke(255);
  //red chaos lines
  //line(0, q*50, height, q/3);
 
 
  //stroke(random(120, 200), 39, 48);
  stroke(0);
  line(0, q*45, height, mouseY);
  line(0, 0, q*33, mouseY);
  line(0, 600, q*40, mouseY);
  stroke(255);
  line(0, 300, q*45, mouseY);
  line(600, 300, q*45, mouseY);
  line(300, 0, q*40, mouseX);
// exit();
}

// nested looops for creating ellipse or other patterns
for(r=0; r<numberOfLines; r++)
{
  for(j=0; j<10; j++)
  {
    float posW = r * distance;
    float posE = j * distance;
    noStroke();
    fill(255);
    ellipse(posW, posE, 10, 10);
    
  }
  float posZ = r * distance;
  float blue = map(r, 0, numberOfLines, 0, 255);
  
  stroke(blue);
  strokeWeight(random(15));
  line(posZ, 0, posZ, height);
  
  
  ellipse(posZ, 200, 20, 20);
  ellipse(posZ, 300, 30, 30);
  ellipse(posZ, 100, 10, 10);
  ellipse(posZ, 400, 20, 20);
  ellipse(posZ, 500, 10, 10);
 /*   
  line(posZ, 0, posZ, height);
  line(posZ, 600, 600, height);
  
   stroke(255);
  line(0, blue*56, height, mouseY);
  line(500, mouseX, blue, mouseY/12);
  stroke(0);
  
  //line(0, 600, blue/56, mouseY);
  line(0, 300, blue*6, mouseY);
 // line(600, 300, q*45, mouseY);
  line(300, 0, mouseY, mouseX);
  */
  
  
 
  
  
}
}
