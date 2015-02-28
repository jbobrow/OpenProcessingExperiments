
PFont f;
boolean mouseIsDown = false;
boolean keyIsDown = false;
void setup()
{
background(83,159,162);


  //  "If I had a world of my own, everything would be nonsense. Nothing would be what it is because everything would be what it isn't. And contrary-wise; what it is it wouldn't be, and what it wouldn't be, it would. You see?"


  frameRate(15);
  size(800, 800);
  //background(255);
  //background(217,215,102);
  f = loadFont("CourierNewPSMT.vlw");
  smooth();
}
void mousePressed() {
  mouseIsDown = true;
}
void mouseReleased() {
  mouseIsDown = false;
}
void keyPressed()
{ keyIsDown = true;}

void keyReleased()
{keyIsDown = false;}

void draw()
{
  String name = "So we beat on, boats against the current,   borne back ceaselessly into the past";
  
    int numObjects = 15;
    int centerX = 0;
    int centerY = 0;
    int distance = 100;
   textFont(f);
  float angleObject = (TWO_PI/numObjects);

  if (keyIsDown == true)
  { 
    textAlign(LEFT);
    textSize(15.5 );
  text(name,20,100);}
  
  
  
  
  
  
  if (mouseIsDown == true) { 
 
fill(83,159,162, 125);
    rect(0, 0, width, height);
    textSize(25);





    for (int i =0; i<numObjects; i++)
    { 
      
        float posE=centerX + (distance+200)*sin(angleObject*i+frameCount*0.1);
      float posG=centerY + (distance+200)*cos(angleObject*i+frameCount*0.1);

      pushMatrix();
      translate(posE, posG);
      textSize(100);
      fill(114,177,164);
      char letter1 = name.charAt(58+i);
      text(letter1,pmouseX,pmouseY);
      popMatrix();
      
      float posW=centerX + (distance+100)*sin(angleObject*i+frameCount*0.1);
      float posK=centerY + (distance+100)*cos(angleObject*i+frameCount*0.1);

      pushMatrix();
      translate(posW, posK);
      textSize(80);
      fill(114,177,164);
      char letter = name.charAt(43+i);
      text(letter, pmouseX, pmouseY);
      popMatrix();


      float posX=centerX%50 + (distance*sin(angleObject*i+frameCount*0.1));
      float posY=centerY%50 + (distance*cos(angleObject*i+frameCount*0.1));


      pushMatrix();
      fill(0);
      translate (posX, posY);
      fill(171,204,177);
      textSize(40);
      char letter2 = name.charAt(29+i);
      text(letter2, pmouseX+10, pmouseY+10);
      popMatrix(); 



      float posB=centerX + (distance-50)*sin(angleObject*i+frameCount*0.1);
      float posA=centerY + (distance-50)*cos(angleObject*i+frameCount*0.1);

      pushMatrix();
      fill(192,219,180);
      translate(posB, posA);
      textSize(20);
      char letter3 = name.charAt(14+i);
      text(letter3, pmouseX, pmouseY);
      popMatrix();

      float posC=centerX + (distance-75)*sin(angleObject*i+frameCount*0.1);
      float posD=centerY + (distance-75)*cos(angleObject*i+frameCount*0.1);


      pushMatrix();
      translate(posC, posD);
      char letter4 = name.charAt(i);
      textSize(10);
      fill(212,226,182);
      text(letter4, mouseX, mouseY);
      popMatrix();
    }
  }
  else {
    for (int i =0; i<numObjects; i++)
    {  
      fill(83,159,162,15);
    rect(0, 0, width, height);
    textSize(25);
      
        float posE=centerX + (distance+200)*sin(angleObject*i+frameCount*0.1);
      float posG=centerY + (distance+200)*cos(angleObject*i+frameCount*0.1);

      pushMatrix();
      translate(posE, posG);
      textSize(100);
      fill(114,177,164);
      char letter1 = name.charAt(58+i);
      text(letter1,(sin(PI)+i)*50,(cos(PI)+i)*50);
      popMatrix();
      
      float posW=centerX + (distance+100)*sin(angleObject*i+frameCount*0.1);
      float posK=centerY + (distance+100)*cos(angleObject*i+frameCount*0.1);

      pushMatrix();
      translate(posW, posK);
      textSize(80);
      fill(114,177,164);
      char letter = name.charAt(43+i);
      text(letter,(sin(PI)+i)*50,(cos(PI)+i)*50);
      popMatrix();


      float posX=centerX%50 + (distance*sin(angleObject*i+frameCount*0.1));
      float posY=centerY%50 + (distance*cos(angleObject*i+frameCount*0.1));


      pushMatrix();
      fill(0);
      translate (posX, posY);
      fill(171,204,177);
      textSize(40);
      char letter2 = name.charAt(29+i);
      text(letter2,(sin(PI)+i)*50,(cos(PI)+i)*50);
      popMatrix(); 



      float posB=centerX + (distance-50)*sin(angleObject*i+frameCount*0.1);
      float posA=centerY + (distance-50)*cos(angleObject*i+frameCount*0.1);

      pushMatrix();
      fill(196,219,180);
      translate(posB, posA);
      textSize(30);
      char letter3 = name.charAt(14+i);
      text(letter3,(sin(PI)+i)*50,(cos(PI)+i)*50);
      popMatrix();

      float posC=centerX + (distance-75)*sin(angleObject*i+frameCount*0.1);
      float posD=centerY + (distance-75)*cos(angleObject*i+frameCount*0.1);


      pushMatrix();
      translate(posC, posD);
      char letter4 = name.charAt(i);
      textSize(20);
      fill(212,226,182);
      text(letter4,(sin(PI)+i)*50,(cos(PI)+i)*50);
      popMatrix();
    }}}


