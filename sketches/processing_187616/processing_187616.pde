
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}PGraphics bg,  //background
          feather,  //feather
          shadow;  //shadow of the feather
 
 
/*----------------------------*/
 
 
void setup()
{
  size(720, 480);
  colorMode(HSB, 360, 100, 100);
  noLoop();
 
   
  feather = createGraphics(width, height);
  shadow = createGraphics(width, height); 
  bg = createGraphics(width, height);
   
  setBG(bg);
}
 
 
/*----------------------------*/
 
 
void draw()
{
  createFeather(width/6, 2*height/3, PI/9, 2*width/3);
   
  image(bg, 0, 0);
  image(shadow, 10, 10);
  filter(BLUR, 2);
 
  image(feather, 0, 0);
}
 
 
/*----------------------------*/
 
 
void mouseReleased()
{
  redraw();
}
 
 
/*----------------------------*/
 
 
void setBG(PGraphics bg)
{
  bg.beginDraw();
  bg.loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
  
  //transitions

  feather.beginDraw();
  feather.colorMode(HSB, 360, 100, 100);
  feather.noFill();
  feather.smooth();
  feather.background(0, 0);
  feather.translate(beginX, beginY);
  feather.rotate(-angle);

   
  //DEFINE THE FORM OF THE FEATHER//
  //center
  PVector  cBegin  =  new  PVector  (  0,        0          );
  PVector  cP1     =  new  PVector  (  0,        deltaCP1y  );
  PVector  cP2     =  new  PVector  (  lFeather, deltaCP2y  );
  PVector  cEnd    =  new  PVector  (  lFeather, 0          );
  //bezier(cBegin.x, cBegin.y,  cP1.x, cP1.y,   cP2.x, cP2.y,   cEnd.x, cEnd.y);
   
   
  //bottom
  PVector  bBegin  =  new PVector  (  cBegin.x + lCalamus,   cBegin.y           );
  PVector  bP1     =  new PVector  (  cP1.x + lCalamus,      cP1.y + deltaBP1y  );
  PVector  bP2     =  new PVector  (  cP2.x + tip,           cP2.y + deltaBP2y  );
  PVector  bEnd    =  new PVector  (  cEnd.x + tip,          cEnd.y             );  
  //bezier(bBegin.x, bBegin.y, bP1.x, bP1.y,   bP2.x, bP2.y,   bEnd.x, bEnd.y);
   
   
  //top
  PVector  tBegin  =  new PVector  (  cBegin.x + lCalamus,   cBegin.y           );
  PVector  tP1     =  new PVector  (  cP1.x + lCalamus,      cP1.y - deltaTP1y  );
  PVector  tP2     =  new PVector  (  cP2.x + tip,           cP2.y - deltaTP2y  );
  PVector  tEnd    =  new PVector  (  cEnd.x + tip,          cEnd.y             );
  //bezier(tBegin.x, tBegin.y,  tP1.x, tP1.y,   tP2.x, tP2.y,   tEnd.x, tEnd.y);
   
   
  
   
  //DRAW THE BARBS//
   
  //initialize the variables that modify the barbs
  float deltaBX = 0, deltaTX = 0;
  float deltaBY = 0, deltaTY = 0;
   
  for (float i = bAfterfeathers; i < 1; i += 0.001)
  {
    //define the points
    float cx = bezierPoint(cBegin.x, cP1.x, cP2.x, cEnd.x, i);
    float cy = bezierPoint(cBegin.y, cP1.y, cP2.y, cEnd.y, i);
    float bx = bezierPoint(bBegin.x, bP1.x, bP2.x, bEnd.x, i);
    float by = bezierPoint(bBegin.y, bP1.y, bP2.y, bEnd.y, i);
    float tx = bezierPoint(tBegin.x, tP1.x, tP2.x, tEnd.x, i);
    float ty = bezierPoint(tBegin.y, tP1.y, tP2.y, tEnd.y, i);
     
     
    //define the direction of the barbs
    float rdm = lerp(0.92, 1, i);  //more probable to change the direction at the beggining
    float maxDeltaX = lerp(25, 0, i);  //maximum change is bigger at the beggining
    if (random(1) > rdm) deltaBX = random(-maxDeltaX, maxDeltaX);  //set the modifier for the bottom part
    if (random(1) > rdm) deltaTX = random(-maxDeltaX, maxDeltaX);  //set the modifier for the top part
     
     
    //define the fuzzines at the afterfeather
    float fuzz = i;
    if (fuzz > 0.3) {fuzz = 0;}  //definite barbs at the end
    else {fuzz = map(fuzz, 0, 0.5, 1, 0);}  //fuzzy barbs at the beggining
    float fuzziness = random(20, 40);  //set de maximum fuzziness
    deltaBY = fuzz*random(-fuzziness, fuzziness);  //set the modifier for the bottom part
    deltaTY = fuzz*random(-fuzziness, fuzziness);  //set the modifier for the top part
       
 
    //set the color
    if (i < bVane)  //lighter colors at the beggining
    {
      float k = map(i, bAfterfeathers, bVane, 0, 1);
      feather.stroke(h1, lerp(1, 100, k), 95, 60);  //set saturation
    }
    else if (i < colorChange)  //main color
    {
      feather.stroke(h1, 100, 95, 60);
    }
    else  //gradually change to the second color
    {
      color color1 = color(h1, 100, 95);
      color color2 = color(h2, 75, 50);
      float j = map(i, colorChange, 1, 0, 1);
      feather.stroke(lerpColor(color1,color2,j), 60); 
    }
     
     
    //draw the barbs
    feather.strokeWeight(2);
    feather.bezier(cx, cy,   (cx+bx)/2, cy,   (cx+bx)/2, by,   bx + deltaBX, by + deltaBY);
    feather.bezier(cx, cy,   (cx+tx)/2, cy,   (cx+tx)/2, ty,   tx + deltaTX, ty + deltaTY);
     
    //draw the shadow of the barbs
    shadow.strokeWeight(2);
    shadow.bezier(cx, cy,   (cx+bx)/2, cy,   (cx+bx)/2, by,   bx + deltaBX, by + deltaBY);
  
   
}

