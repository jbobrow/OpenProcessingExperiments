
/*===========================================================
Gradient Color Functions
Developer: Allen Huang
Date: 07/26/2011 ver 1.0
      08/09/2011 ver 1.1
===========================================================*/
float timeRate = 0;
float ctmp1 = 0.0;
float ctmp2 = 0.0;

color c1 = color(255, 0, 0);
color c2 = color(230, 230, 120);
color c3;

void setup()
{
  size(800, 600);
}

void draw()
{
  smooth();
  background(0);

  timeRate = frameCount/1.0;
  timeRate = timeRate%360.0;

  pushMatrix();
  translate(400, 250);
  rotate(radians(timeRate));

  for(int i = 0; i < 12; i++)
  {
    pushMatrix();
    rotate(radians(30.0*i));
    translate(200, 0);
    rotate(radians(-timeRate-30.0*i));
    c3 = lerpColor(c1, c2, (1.0/12.0)*i);
    GColorTriangle(0, 0, -25, 25, 25, 25, 0, red(c3), blue(c3), green(c3), 255, 100, 0, 240, 255, 0, 1);
    popMatrix();
  }
  
  ctmp1 = 360*abs(sin(radians(frameCount/6.0)));
  ctmp2 = 180 + 180*sin(frameCount/4.0);
  
  for(int i = 0; i < 12; i++)
  {
    pushMatrix();
    rotate(radians(30.0*i));
    strokeWeight(6);
    GColorLine(0, 0, 200, 0, 1, ctmp1, 255, 255, 255, ctmp2, 255, 255, 255, 0);
    popMatrix();
  }
  
  strokeWeight(6);
  GColorArc(0, 0, 400, 400, 0.0*PI, 2.0*PI, 1, 360, 255, 255, 255, 0, 255, 255, 255, 360);
  
  for(int i = 0; i < 12; i++)
  {
    pushMatrix();
    rotate(radians(30.0*i));
    translate(200, 0);
    GColorEllipse(0, 0, 0, 0, 20.0, 20.0, 1.0, 1.0, 0.0, 2.0*PI, 1, ctmp2, 255, 255, 255, 0, 0, 255, 255, 0, 0);
    popMatrix();
  }
  
  popMatrix();
  
  GColorQuad(390, 240, 410, 240, 650, 550, 150, 550, 1, ctmp1, 255, 255, 200, 0, 0, 255, 200, 0, 0);

  /*//Test Examples
  GColorTriangle(200, 200, 450, 550, 120, 280, 0, 255, 0, 0, 255, 0, 0, 255, 255, 0, 1);
  
  GColorQuad(200, 200, 300, 200, 300, 300, 200, 300, 0, 255, 0, 0, 100, 0, 0, 255, 100, 0, 0);
  
  GColorEllipse(370, 240, 330, 240, 250, 250, 150.0, 150.0, 0, 2.0*PI, 0, 255, 0, 0, 50, 0, 0, 255, 255, 0, 1);

  GColorEllipse(330, 240, 330, 240, 151, 151, 50.0, 100.0, 0.0*PI, 2.0*PI, 0, 0, 0, 255, 255, 0, 255, 0, 255, 0, 0);
  
  GColorEllipse(150, 280, 150, 280, 250, 250, -50, 50, 0.0*PI, 1.0*PI, 0, 255, 0, 0, 100, 0, 0, 255, 100, 0, 1);
  
  strokeWeight(5);
  GColorLine(150, 50, 450, 50, 1, 0, 255, 255, 255, 360, 255, 255, 255, 0);
  strokeWeight(20);
  GColorArc(320, 240, 300, 300, 0.0*PI, 2.0*PI, 1, 360, 255, 255, 50, 0, 255, 255, 10, 360);
  
  noLoop();
  */
}

/*===================================================================================================================
  GColorTriangle(float p1_x, float p1_y,
                 float p2_x, float p2_y,
                 float p3_x, float p3_y,
                 int color mode,
                 float color1_R(H), float color1_G(S), float color1_B(B), float color1_Alpha,
                 float color2_R(H), float color2_G(S), float color2_B(B), float color2_Alpha,
                 int step, int strokeOn/Off)
  NOTE:
  1. The color changing is from P1 to P2, P3.
  2. When the color mode is 0, it uses RGB color mode. (255, 255, 255, 255)
     When the color mode is non-zero, it uses HSB color mode. (360, 255, 255, 255)
  3. The min. step is 0.
     When the step is 0, it will automatically calculate the max. step for the shape.
     When the step is non-zero, it will use the manual inputted step.
  4. When strokeOn/Off is 0, the stroke function is off.  When use alpha effect, it is better to turn off the stroke function.
     When strokeOn/Off is non-zero, the stroke function is on.  It gives a high-quality color.
*/

void GColorTriangle(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3,
                    int cmode, float _r1, float _g1, float _b1, float _a1, float _r2, float _g2, float _b2, float _a2,
                    int step, int storkeOn)
{
  float newx2, newy2, newx3, newy3, divstep, d;
  float prevx2 = 0.0;
  float prevy2 = 0.0;
  float prevx3 = 0.0;
  float prevy3 = 0.0;
  float newr, newg, newb, newa;
  
  if(step < 0)
  {
    println("The min. step is 0");
    step = 0;
  }
  
  if(step == 0)
  {
    float d1 = ceil(dist(_x1, _y1, _x2, _y2));
    float d2 = ceil(dist(_x1, _y1, _x3, _y3));
    
    if(d1 > d2)
      step = int(d1);
    else
      step = int(d2);
    println("GColorTriangle");
    println("Max. Step = " + step); 
  }
    
  divstep = (1.0/step);
  
  if(cmode != 0)
    colorMode(HSB, 360, 255, 255, 255);
  
  if(storkeOn == 0)
    noStroke();
  else
    strokeCap(PROJECT);
  
  for(int t = 1; t <= step; t++)
  {
    d = pow((divstep * t), 1); // Advance parameter, change exponent to get a different step-method (suggest range 0.7 ~ 3)
    
    newx2 = round(_x1*(1-d) + _x2*d);
    newy2 = round(_y1*(1-d) + _y2*d);
    newx3 = round(_x1*(1-d) + _x3*d);
    newy3 = round(_y1*(1-d) + _y3*d);
    newr = (_r1*(1-d) + _r2*d);
    newg = (_g1*(1-d) + _g2*d);
    newb = (_b1*(1-d) + _b2*d);
    newa = (_a1*(1-d) + _a2*d);
      
    if(t == 1)
    {
      if(storkeOn != 0)
        stroke(_r1, _g1, _b1, _a1);
        
      fill(_r1, _g1, _b1, _a1);
      triangle(_x1, _y1, newx2, newy2, newx3, newy3);
    }
    else
    {
      if(storkeOn != 0)
        stroke(newr, newg, newb, newa);
        
      fill(newr, newg, newb, newa);
      quad(prevx2, prevy2, prevx3, prevy3, newx3, newy3, newx2, newy2);
    }
    
    prevx2 = newx2;
    prevy2 = newy2;
    prevx3 = newx3;
    prevy3 = newy3;  
  }
  if(storkeOn != 0)
    strokeCap(ROUND);
  
  if(cmode != 0)
    colorMode(RGB, 255, 255, 255, 255);
}

/*===================================================================================================================
  GColorQuad(float p1_x, float p1_y,
             float p2_x, float p2_y,
             float p3_x, float p3_y,
             float p4_x, float p4_y,
             int color mode,
             float color1_R(H), float color1_G(S), float color1_B(B), float color1_Alpha,
             float color2_R(H), float color2_G(S), float color2_B(B), float color2_Alpha,
             int step, int strokeOn/Off)
  NOTE:
  1. The color changing is from P1, P2 to P3, P4.
  2. When the color mode is 0, it uses RGB color mode. (255, 255, 255, 255)
     When the color mode is non-zero, it uses HSB color mode. (360, 255, 255, 255)
  3. The min. step is 0.
     When the step is 0, it will automatically calculate the max. step for the shape.
     When the step is non-zero, it will use the manual inputted step.
  4. When strokeOn/Off is 0, the stroke function is off.  When use alpha effect, it is better to turn off the stroke function.
     When strokeOn/Off is non-zero, the stroke function is on.  It gives a high-quality color.
*/

void GColorQuad(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3, float _x4, float _y4,
                int cmode, float _r1, float _g1, float _b1, float _a1, float _r2, float _g2, float _b2, float _a2,
                int step, int storkeOn)
{
  float newx3, newy3, newx4, newy4, divstep, d;
  float prevx3 = 0.0;
  float prevy3 = 0.0;
  float prevx4 = 0.0;
  float prevy4 = 0.0;
  float newr, newg, newb, newa;
  
  if(step < 0)
  {
    println("The min. step is 0");
    step = 0;
  }
  
  if(step == 0)
  {
    float d1 = ceil(dist(_x1, _y1, _x4, _y4));
    float d2 = ceil(dist(_x2, _y2, _x3, _y3));
    
    if(d1 > d2)
      step = int(d1);
    else
      step = int(d2);
    println("GColorQuad");
    println("Max. Step = " + step); 
  }
    
  divstep = (1.0/step);
  
  if(cmode != 0)
    colorMode(HSB, 360, 255, 255, 255);
  
  if(storkeOn == 0)
    noStroke();
  else
    strokeCap(PROJECT);
    
  for(int t = 1; t <= step; t++)
  {
    d = pow((divstep * t), 1); // Advance parameter, change exponent to get a different step-method (suggest range 0.7 ~ 3)
    
    newx3 = round(_x2*(1-d) + _x3*d);
    newy3 = round(_y2*(1-d) + _y3*d);
    newx4 = round(_x1*(1-d) + _x4*d);
    newy4 = round(_y1*(1-d) + _y4*d);
    newr = (_r1*(1-d) + _r2*d);
    newg = (_g1*(1-d) + _g2*d);
    newb = (_b1*(1-d) + _b2*d);
    newa = (_a1*(1-d) + _a2*d);
    
    if(t == 1)
    {
      if(storkeOn != 0)
        stroke(_r1, _g1, _b1, _a1);
        
      fill(_r1, _g1, _b1, _a1);
      quad(_x1, _y1, _x2, _y2, newx3, newy3, newx4, newy4);
    }
    else
    {
      if(storkeOn != 0)
        stroke(newr, newg, newb, newa);
      
      fill(newr, newg, newb, newa);
      quad(prevx4, prevy4, prevx3, prevy3, newx3, newy3, newx4, newy4);
    }
    
    prevx3 = newx3;
    prevy3 = newy3;
    prevx4 = newx4;
    prevy4 = newy4;  
  }
  if(storkeOn != 0)
    strokeCap(ROUND);
  
  if(cmode != 0)
    colorMode(RGB, 255, 255, 255, 255);
}

/*===================================================================================================================
  GColorEllipse(float outerCenterX, float outerCenterY,
                float innerCenterX, float innerCenterY,
                float outerEllipse_width, float outerEllipse_height,
                float innerEllipse_width, float innerEllipse_height,
                float ellipseStartAngle, float ellipseEndAngle,
                int color mode,
                float color1_R(H), float color1_G(S), float color1_B(B), float color1_Alpha,
                float color2_R(H), float color2_G(S), float color2_B(B), float color2_Alpha,
                int step, int colorFillMethod)
  NOTE:
  1. The color changing is from the outer ellipse to the inner ellipse.
  2. The Angle of this function uses RADIANS.
  3. When the color mode is 0, it uses RGB color mode. (255, 255, 255, 255)
     When the color mode is non-zero, it uses HSB color mode. (360, 255, 255, 255)
  4. The min. step is 0.
     When the step is 0, it will automatically calculate the max. step for the shape.
     When the step is non-zero, it will use the manual inputted step.
  5. This function has two color filling methods.
     When the method is 0, it will fill all ellipses.  It gives a high-quality color, but it will loss the alpha effect.
       It will also fill the inner ellipse.
     when the method is non-zero, it will use the stroke function to color the ellipse.  It will lose the color quality, but it gives a better alpha effect.  
       This method will not fill the inner ellipse.
*/

void GColorEllipse(float _ocx, float _ocy, float _icx, float _icy, float _ow, float _oh, float _iw, float _ih, float _sd, float _ed,
                   int cmode, float _r1, float _g1, float _b1, float _a1, float _r2, float _g2, float _b2, float _a2,
                   int step, int method)
{
  boolean err1 = false;
  float divstep, d;
  float newcx, newcy, neww, newh;
  float newr, newg, newb, newa;
  
  if(_ed < 0)
  {
    println("GColorEllipse");
    println("The End Angle must be positive.");
    err1 = true;
  }
  
  if(!err1)
  {
    if(step < 0)
    {
      println("The min. step is 0");
      step = 0;
    }
    
    if(step == 0)
    {
      if(abs(_ow-_iw) > abs(_oh-_ih))
         step = int(abs(_ow-_iw));
       else
         step = int(abs(_oh-_ih));
         
       if(abs(_ocx-_icx) > abs(_ocy-_icy))
         step = step + int(abs(_ocx-_icx));
        else
          step = step + int(abs(_ocy-_icy));
       
       println("GColorEllipse");
       println("Max. Step = " + step);
    }
    
    divstep = (1.0/step);
        
    if(cmode != 0)
      colorMode(HSB, 360, 255, 255, 255);
    
    if(method == 0)
      noStroke();
    else
    {
      noFill();
      strokeWeight(1.1);
      strokeCap(PROJECT);
      strokeJoin(ROUND);
    }
    for(int t = 0; t <= step; t++)
    {
      d = pow((divstep * t), 1); // Advance parameter, change exponent to get a different step-method (suggest range 0.7 ~ 3)
      
      newcx = round(_ocx*(1-d) + _icx*d);
      newcy = round(_ocy*(1-d) + _icy*d);
      neww = round(_ow*(1-d) + _iw*d);
      newh = round(_oh*(1-d) + _ih*d);
      newr = (_r1*(1-d) + _r2*d);
      newg = (_g1*(1-d) + _g2*d);
      newb = (_b1*(1-d) + _b2*d);
      newa = (_a1*(1-d) + _a2*d);
      
      if(method == 0)
      {
        fill(newr, newg, newb, newa);
      }
      else
      {
        stroke(newr, newg, newb, newa);
      }
      
      arc(newcx, newcy, neww, newh, _sd, _ed);
    }
    if(method != 0)
    {
      strokeWeight(1.0);
      strokeCap(ROUND);
      strokeJoin(MITER);
    }
    
    if(cmode != 0)
      colorMode(RGB, 255, 255, 255, 255);
  }
}

/*===================================================================================================================
  GColorLine(float p1_x, float p1_y,
             float p2_x, float p2_y,
             float p3_x, float p3_y,
             int color mode,
             float color1_R(H), float color1_G(S), float color1_B(B), float color1_Alpha,
             float color2_R(H), float color2_G(S), float color2_B(B), float color2_Alpha,
             int step)
  NOTE:
  1. The color changing is from P1 to P2.
  2. When the color mode is 0, it uses RGB color mode. (255, 255, 255, 255)
     When the color mode is non-zero, it uses HSB color mode. (360, 255, 255, 255)
  3. The min. step is 0.
     When the step is 0, it will automatically calculate the max. step for the shape.
     When the step is non-zero, it will use the manual inputted step.
  4. This function cannot give a good alpha effect in the full range.  To see the alpha effect, the suggested alpha range is 0 ~ 120.
*/

void GColorLine(float _x1, float _y1, float _x2, float _y2,
                int cmode, float _r1, float _g1, float _b1, float _a1, float _r2, float _g2, float _b2, float _a2,
                int step)
{
  float newx2, newy2, divstep, d;
  float prevx2 = 0.0;
  float prevy2 = 0.0;
  float newr, newg, newb, newa;
  
  if(step < 0)
  {
    println("The min. step is 0");
    step = 0;
  }
  
  if(step == 0)
  {
    float d1 = ceil(dist(_x1, _y1, _x2, _y2));
    step = int(d1);
    println("GColorLine");
    println("Max. Step = " + step); 
  }
    
  divstep = (1.0/step);
  
  if(cmode != 0)
    colorMode(HSB, 360, 255, 255, 255);
  
  strokeCap(PROJECT);
  for(int t = 1; t <= step; t++)
  {
    d = pow((divstep * t), 1); // Advance parameter, change exponent to get a different step-method (suggest range 0.7 ~ 3)
    
    newx2 = round(_x1*(1-d) + _x2*d);
    newy2 = round(_y1*(1-d) + _y2*d);
    newr = (_r1*(1-d) + _r2*d);
    newg = (_g1*(1-d) + _g2*d);
    newb = (_b1*(1-d) + _b2*d);
    newa = (_a1*(1-d) + _a2*d);
    
    if(t == 1)
    {
      stroke(_r1, _g1, _b1, _a1);
      line(_x1, _y1, newx2, newy2);
    }
    else
    {
      stroke(newr, newg, newb, newa);
      line(prevx2, prevy2, newx2, newy2);
    }
    
    prevx2 = newx2;
    prevy2 = newy2;
  }
  strokeCap(ROUND);
  
  if(cmode != 0)
    colorMode(RGB, 255, 255, 255, 255);
}

/*===================================================================================================================
  GColorArc(float centerX, float centerY,
            float Arc_width, float Arc_height,
            float StartAngle, float EndAngle,
            int color mode,
            float color1_R(H), float color1_G(S), float color1_B(B), float color1_Alpha,
            float color2_R(H), float color2_G(S), float color2_B(B), float color2_Alpha,
            int step)
  NOTE:
  1. The color changing is from the StartAngle to the EndAngle.
  2. The Angle of this function uses RADIANS.
  3. When the color mode is 0, it uses RGB color mode. (255, 255, 255, 255)
     When the color mode is non-zero, it uses HSB color mode. (360, 255, 255, 255)
  4. The min. step is 0.  Since the max. step will draw an irregular arc, the automatic method will use the best step.
     When the step is 0, it will automatically calculate the best step for the shape. (Not the max step.)
     When the step is non-zero, it will use the manual inputted step.
  5. This function cannot give a good alpha effect in the full range.  To see the alpha effect, the suggested alpha range is 0 ~ 120.
*/

void GColorArc(float _cx, float _cy, float _ow, float _oh, float _sd, float _ed,
               int cmode, float _r1, float _g1, float _b1, float _a1, float _r2, float _g2, float _b2, float _a2,
               int step)
{
  boolean err1 = false;
  float divstep, d;
  float preved = 0.0;
  float newed;
  float newr, newg, newb, newa;
  
  if(_ed < 0)
  {
    println("GColorArc");
    println("The End Angle must be positive.");
    err1 = true;
  }
  
  if(!err1)
  {
    if(step == 0)
    {
      step = int(degrees(abs(_ed-_sd))/10.0);
  
      println("GColorArc");
      println("Best Step = " + step);
      println("Max. Step = " + (step*10));
    }
      
    divstep = (1.0/step);
      
    if(cmode != 0)
      colorMode(HSB, 360, 255, 255, 255);
    
    noFill();
    strokeCap(PROJECT);
    strokeJoin(ROUND);   
    for(int t = 1; t <= step; t++)
    {
      d = pow((divstep * t), 1); // Advance parameter, change exponent to get a different step-method (suggest range 0.7 ~ 3)
  
      newed = (_sd*(1-d) + _ed*d);
      newr = (_r1*(1-d) + _r2*d);
      newg = (_g1*(1-d) + _g2*d);
      newb = (_b1*(1-d) + _b2*d);
      newa = (_a1*(1-d) + _a2*d);
      
      if(t == 1)
      {
        stroke(_r1, _g1, _b1, _a1);
        arc(_cx, _cy, _ow, _oh, _sd, newed);
      }
      else
      {
        stroke(newr, newg, newb, newa);
        arc(_cx, _cy, _ow, _oh, preved, newed);
      }
      
      preved = newed;
    }
    strokeCap(ROUND);
    strokeJoin(MITER);
    
    if(cmode != 0)
      colorMode(RGB, 255, 255, 255, 255);
  }
}

