
PShape octopus;
PShape shark;
PShape rock;
PShape rock2;
PShape fish;
PShape fish_mirrored;

void setup()
{
  size(640,480);
  smooth();
  noLoop();
  octopus = loadShape("Octopus.svg");
  shark = loadShape("shark.svg");
  rock = loadShape("rock.svg");
  rock2 = loadShape("rock2.svg");
  fish = loadShape("fish.svg");
  fish_mirrored = loadShape("fish_mirror.svg");
}



void draw()
{
  background(200);
  for(float i = 0; i < 3*height/4; i++)
  {
    stroke(200-(0.5*i));
    line(0, i + height/4, width, i + height/4);
  }


//  //  int mode = (int)random(0,2);  
//  //  println(mode);
//  //
//  //  if(mode < 1)
//  //  {
//  //    octopus.enableStyle();
//  //        shark.enableStyle();
//  //        rock.enableStyle();
//  //        rock2.enableStyle();
//  //        fish.enableStyle();
//  //  }
//  //
//  //  else if(mode >= 1)
//  //  {
//  //    octopus.disableStyle();
//  //        shark.disableStyle();
//  //        rock.disableStyle();
//  //        rock2.disableStyle();
//  //        fish.disableStyle();
//  //
//  //
//  //  }
  noStroke();
  for(int i = 0; i<15; i++)
  {
    fill(255, 200);    
    ellipse(mouseX + random(-i*8, i*8), mouseY - random(0, (i*15)), i+1,i+1);
  }

  fill(70,70,79);
  beginShape();
  vertex(0,height);
  vertex(width, height);
  vertex(width, random(280, 380));
  vertex(random(580, 610), random(380, 420));
  vertex(random(480, 550), random(280, 470));
  vertex(random(400, 450), random(350, 430));
  vertex(random(280, 350), random(400, 460));
  vertex(random(180, 250), random(390, 440));
  vertex(random(100, 150), random(350, 460));
  vertex(random(50,80), random(280, 450));
  vertex(0, random(300, 420));
  endShape(CLOSE);



  fill(90,90,104);
  beginShape();
  vertex(0, random(280, 380));
  vertex(random(50,80), random(310, 450));
  vertex(random(100, 150), random(350, 460));
  vertex(random(180, 250), random(390, 440));
  vertex(random(280, 350), random(400, 460));
  vertex(random(400, 450), random(350, 430));
  vertex(random(480, 550), random(280, 470));
  vertex(random(580, 610), random(300, 400));
  vertex(width, random(280, 400));
  vertex(width, height);
  vertex(0,height);
  endShape(CLOSE);



  stroke(0);  
  shape(octopus, random(0,width-octopus.width), random(300, height-octopus.height/2));


  shape(shark, random(0-shark.width, width), random(0-shark.height, shark.height));
  shape(rock, random(0-rock.width/4, rock.width/4), random(height-rock.height, height-rock.height/2));
  shape(rock2, random(width-rock2.width, 3*width/4), random(height-3*rock2.height/4, height-rock2.height/2));


  pushMatrix();
  scale(random(0.5,1.0));

  int drawfish = (int)random(0,2);
  if(drawfish < 1)
  {
    shape(fish, random(0-fish.width, width), random(fish.height, 2*fish.height));
  }
  else
  {
    shape(fish_mirrored, random(0-fish.width, width), random(fish.height, 2*fish.height));
  }
  popMatrix();

  fill(57,139,244,50);
  rect(0,0, width, height);

  int tintval = (int)random(0,2);
  if(tintval <1)
  {
    fill(random(0,256), random(0,256), random(0,256), random(20,100));
    rect(0,0, width, height);
  }


}

void mousePressed()
{
  redraw();
}


