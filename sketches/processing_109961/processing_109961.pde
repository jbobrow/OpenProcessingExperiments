
//HomeWork 5
//All right reserved to Chia-Fang Lue

void setup()
{
  size( 400, 400);
  background( 250);
}

void draw()
{
  prepScreen();
  
  if ( mouseX !=0 && mouseY !=0)
  {
    figure1(mouseX, mouseY, mouseX*.25, mouseX*.25);  
    
    if ( mouseX <= width*.25)
    {
      figure2(mouseX, mouseY, mouseX*.25, mouseX*.25);
      faceIcon();
      
    }
    
    else if (mouseX > width*.25 && mouseX <= width*.5)
    {
      figure2(mouseX, mouseY, mouseX*.25, mouseX*.25);
      figure3(mouseX, mouseY, mouseX*.25, mouseX*.25);
      faceIcon();
      glassesIcon();
    }
    
    else if (mouseX > width*.5 && mouseX <= width*.75)
    {
      figure2(mouseX, mouseY, mouseX*.25, mouseX*.25);
      figure3(mouseX, mouseY, mouseX*.25, mouseX*.25);
      figure4(mouseX, mouseY, mouseX*.25, mouseX*.25);
      faceIcon();
      glassesIcon();
      noseIcon();
    }
    
    else if (mouseX > width*.75)
    {
      figure2(mouseX, mouseY, mouseX*.25, mouseX*.25);
      figure3(mouseX, mouseY, mouseX*.25, mouseX*.25);
      figure4(mouseX, mouseY, mouseX*.25, mouseX*.25);
      figure5(mouseX, mouseY, mouseX*.25, mouseX*.25);
      faceIcon();
      glassesIcon();
      noseIcon();
      mouthIcon();
    }
  }
  
}

void prepScreen()
{
  //section 1
  fill(37, 100, 111, 100);
  noStroke();
  rect( 0, 0, width*.25, height); 
  
  //section 2
  fill(44, 123, 137);
  noStroke();
  rect( 100, 0, width*.25, height); 
  
  //section 3
  fill(50, 149, 165);
  noStroke();
  rect( 200, 0, width*.25, height); 
  
  //section 4
  fill(60, 185, 206);
  noStroke();
  rect( 300, 0, width*.25, height); 
  
  //bottom overlay on top
  fill(255, 255, 255, 20);
  noStroke();
  rect(0, 300, width, height*.25);
  
  //text
  textSize(16);
  fill(255);
  text("FACE", 24, 345 );
  text("GLASSES", 110, 345);
  text("NOSE", 224, 345);
  text("MOUTH", 317, 345);
}

void figure1( float x, float y, float wd, float ht)
{
  //face
  fill(255, 214, 137);
  noStroke();
  ellipse(x, y, 2*wd, 2*ht);
  
 // text("Face", 
 
}

void figure2( float x, float y, float wd, float ht)
{ 
  //ears
  fill(255, 214, 137);
  noStroke();
  ellipse(x-wd, y,mouseX*.1, mouseX*.1);
  ellipse(x+wd, y,mouseX*.1, mouseX*.1);
}

void figure3( float x, float y, float wd, float ht)
{
  //left glasses
  fill(255, 255, 255, 200);
  stroke(100);//glasses golden frame
  strokeWeight(2);
  beginShape();
  curveVertex(x-wd*.8, y-ht*.7);
  curveVertex(x-wd*.8, y-ht*.5);
  curveVertex(x-wd*.7, y-ht*.1);
  curveVertex(x-wd*.3, y-ht*.1);
  curveVertex(x-wd*.1, y-ht*.5);
  curveVertex(x-wd*.1, y-ht*.3);
  endShape();
  
  //glasses frame
  beginShape();
  noFill();
  curveVertex(x-wd, y);
  curveVertex(x-wd, y);
  curveVertex(x-wd-1, y-ht*.5);
  curveVertex(x+wd+1, y-ht*.5);
  curveVertex(x+wd, y);
  curveVertex(x+wd, y);
  endShape();

  //right glasses
  fill(255, 255, 255, 200);
  beginShape();
  curveVertex(x+wd*.8, y-ht*.7);
  curveVertex(x+wd*.8, y-ht*.5);
  curveVertex(x+wd*.7, y-ht*.1);
  curveVertex(x+wd*.3, y-ht*.1);
  curveVertex(x+wd*.1, y-ht*.5);
  curveVertex(x+wd*.1, y-ht*.3);
  endShape();
  
  //eyes
  ellipseMode(RADIUS);
  stroke(67, 40, 14);
  fill(255);
  strokeWeight(1);
  ellipse(x-wd*.5, y-ht*.3, wd*.12, wd*.1);
  ellipse(x+wd*.5, y-ht*.3, wd*.12, wd*.1);
  noStroke();
  fill(98, 59,22);
  ellipseMode( CENTER);
  ellipse(x-wd*.5, y-ht*.3, wd*.08, wd*.08);
  ellipse(x+wd*.5, y-ht*.3, wd*.08, wd*.08);
}

void figure4( float x, float y, float wd, float ht)
{
  //nose
  stroke(240, 180, 68);
  strokeWeight(3);
  noFill();
  beginShape();
  curveVertex(x, y-ht*.1);
  curveVertex(x, y-ht*.1);
  curveVertex(x-wd*.2, y+ht*.2);
  curveVertex(x, y+ht*.3);
  curveVertex(x, y+ht*.3);
  endShape();
}

void figure5( float x, float y, float wd, float ht)
{
  //mounth
  fill(240, 135, 82);
  noStroke();
  ellipse(x, y+ht*.65, 30, 20);

  //beard
  beginShape();
  noStroke();
  fill(155, 97, 42);
  curveVertex(x-wd*.4, y+ht*.8);
  curveVertex(x-wd*.5, y+ht*.8);
  curveVertex(x, y+ht*.4);
  curveVertex(x+wd*.5, y+ht*.8);
  curveVertex(x, y+ht*.65);
  curveVertex(x-wd*.5, y+ht*.8);
  curveVertex(x-wd*.4, y+ht*.8);
  endShape();
}

void faceIcon()
{
  ellipseMode(CENTER);
  fill(255, 60);
  noStroke(); 
  ellipse(50, 370, 20, 20);
}

void glassesIcon()
{
  ellipseMode(CENTER);
  fill(255, 60);
  noStroke();
  ellipse(135, 370, 20, 20);
  ellipse(165, 370, 20, 20);
  
  strokeWeight(2);
  stroke(255, 60);
  line(145, 370, 155, 370);
}

void noseIcon()
{
  fill(255, 60);
  noStroke();
  triangle(250, 360, 240, 380, 260, 380);
}

void mouthIcon()
{
  noStroke();
  fill(255, 80);
  quad( 340, 370, 350, 360, 360, 370, 350, 380); 
}



