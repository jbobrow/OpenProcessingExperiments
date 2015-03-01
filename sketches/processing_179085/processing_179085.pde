
color[] c;
PFont f;
String[] t;


/*------------------------------------------*/


void setup()
{
  size(480, 620);
  colorMode(HSB, 360, 100, 100);
  c = new color[4];
  
  //create font and text
  f = createFont("Georgia", 50, true);
  t = new String[3];
  t[0] = "Feliz Natal";
  t[1] = "Joyeux Noël";
  t[2] = "Merry Christmas";
}


/*------------------------------------------*/


void draw()
{
  noLoop();
  background(55, 1, 100);
   
  //create the distribution of stars  
  constellation();
  
  //choose the colors for the tree
  fill(150, 40, 60, 180); 
  for (int i = 0; i < 4; i++)
  {
    float s = random(20, 40);
    c[i] = color(140, s, 90 - s);
  }
  
  //draw the tree
  tree(width/2, height/2, 280, c);
  
  //insert the text
  fill(0, 65, 65);
  textFont(f, 50);
  textAlign(CENTER);
  int ct = int(random(3));
  text(t[ct], width/2, height - 100);
  
  //insert paper like filter
  paperFilter();
}


/*------------------------------------------*/


void keyPressed()  //save the framme when we press the letter s
{
  if (key == 's' || key =='S')
  {
    saveFrame("card-###.png");
  }
}


/*------------------------------------------*/


void mouseClicked()  //create a new configuration when mouse is clicked
{
  loop(); 
}


/*------------------------------------------*/


void constellation()
{
  int k = 0;
  while(k < 30)  //run untilit finds 30 points
  { 
    int x = width/2;  //maximum x
    int y = height/2;  //maximum y
    int dx = x /10;  //a tenth of the maximun to helps creates intermediate ellipses
    int dy = y /10;  //a tenth of the maximun to helps creates intermediate ellipses
    
    float dMax = dist(0, 0, x, y);  //find the maximum radius
    float d = random(dMax);  //generate a random number between zero and the maximum radius
    float angle = random(TWO_PI);  //generate arandom angle
  
    float d1 = dist(0, 0, 7*dx*cos(angle), 7*dy*sin(angle));  //find the distance on the ellipse with 7 tenths of radius at this angle
    float d2 = dist(0, 0, 9*dx*cos(angle), 9*dy*sin(angle));  //find the distance on the ellipse with 7 tenths of radius at this angle
  
    float teste1;
    if (d < d1) {  teste1 = 0;  }  //if the point is inside the smaller ellipse, 0% chance
    else if (d < d2) {  teste1 = 0.5;  }  //if the point is between the two ellipses 50% chance
    else {  teste1 = 1;  }  //if the point if outside the ellipses, 100% chance
  
    float teste2 = random(1);
    boolean c1 = teste2 < teste1;  //apply the probabilities of drawing the point
    boolean c2 = abs(d*cos(angle)) < x;  //verify if the x coordinate isn't bigger then the maximum
    boolean c3 = abs(d*sin(angle)) < y;  //verify if the y coordinate isn't bigger then the maximum
    
    pushMatrix(); 
      if (c1 && c2 && c3)  //if the three tests are ok, draw an star at the point 
      {
        translate(x, y);
        star(d*cos(angle),d*sin(angle), distSize(20, 200, 60, 80), random(360)); 
        k = k + 1;
      } 
    popMatrix();
  }  
}


/*------------------------------------------*/


float distSize(int min, int max, int iMin, int iMax)  //create a personalized distribution for the size of the stars
{
  float test1, test2;
  float result = -1;
  
  while (result < 0)
  {
    test1 = random(min, max);
    if (test1 < iMin)
    {
      test2 = 0.2;
    }
    else if (test1 < iMax)
    {
      test2 = 0.7;
    }
    else
    {
      test2 = 0.1;
    }
    
    if ( test2 > random(1)) {  result = test1;  }
    
  }
  return result;
}


/*------------------------------------------*/


void star(float x, float y, float r0, float angle0)  //draw a star
{
  r0 = r0 * 2.;
  noFill();
  float sat = map(r0, 30, 275, 50, 20);  //choose the color, the bigger the star, the lighter it is
  stroke(55, sat, 100 - sat, 200);
  pushMatrix();
    translate(x, y);
    rotate(angle0);  //change the orientation of the star
    beginShape();
      for(int i = 0; i < 360; i += 1)
      {
        float angle = radians(i);                   
        float a = abs(cos(PI/6));
        float b = 1 - a;   
        float r = (r0) * ( b + a * pow(cos(3*angle)*sin(3*angle),3));
          
        //turn around (x,y), this line replace  rotate to allow the use of vertex 
        vertex(r*cos(angle), r*sin(angle)); 
      }
      endShape(CLOSE);
    popMatrix();
}


/*------------------------------------------*/


void paperFilter()  //add paper effect
{
  loadPixels();
    for (int i = 0; i < pixels.length; i++)  //pick each pixel of the image
    {
      //find the HSB values
      float h = hue(pixels[i]);
      float s = saturation(pixels[i]);
      float b = brightness(pixels[i]);
      
      //change the saturation and the brightness randomly
      pixels[i] = color(h, s + random(8), b - random(8));
    }        
  updatePixels();
  filter(BLUR);
}


/*------------------------------------------*/


void tree(int x, int y, int hTree, color[] cTree)  //draw the tree
{ 
  pushMatrix();
    translate(x, y);
    scale(hTree/140);  //scale the tree to 140 to the chosen lenght
    
    int yb = -10; //center y
    int r = 80;
    int theta = 45;
  
    for (int i = 0; i < 4; i++)
    {   
      pushStyle();
        noStroke();  
        fill(cTree[i]);
        branch(0, yb, r, 10, radians(theta), radians(180 - theta));
      popStyle();
      yb -= 20;
      r -= 10;
      theta += 5;
    }
  popMatrix();
}


/*------------------------------------------*/


void branch(int x, int y, int d, int rd, float t1, float t2)  //draw each part of the tree
{  
  float r1 = d + random(-rd, rd);  //change the initial radius randomly
  float r2 = d + random(-rd, rd);  //change the final radius randomly
  
  beginShape();  //draw the arc
    vertex(x, y);
    for(float theta = t1; theta < t2; theta += radians(5))
    {
      float r = map(theta, t1, t2, r1, r2);
      vertex(x+ r*cos(theta), y + r*sin(theta));
    }
  endShape(CLOSE);
}



