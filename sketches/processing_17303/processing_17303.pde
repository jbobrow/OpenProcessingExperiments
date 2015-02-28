

/*
-
 -Jelle Galgenbeld's Creative Drumkit v1.00
 -
 -= Destroy the blocks by clicking them. Any connected blocks
 -= with the same ID will be destroyed as well, creating sounds
 -= based on the amount of blocks destroyed.
 -
 */

void setup()
{
  size(w,h);
  smooth();
  frameRate(30);

  for (int j = 0; j < 12; j++)
  {
    for (int i = 0; i < 32; i++)
    {
      obj_block[i + j  * block_size] = new block((i*32), (j*32+96), int(random(0,2)), int(random(0,2)), int(random(0,2)), obj_block);
    }
  }

  minim = new Minim(this);

  claves = minim.loadSample("./sound/" + "claves.wav", 2048);
  cowbell = minim.loadSample("./sound/" + "cowbell.wav", 2048);
  funky = minim.loadSample("./sound/" + "funky.wav", 2048);
  kick = minim.loadSample("./sound/" + "kick.wav", 2048);
  snare1 = minim.loadSample("./sound/" + "snare1.wav", 2048);
  snare2 = minim.loadSample("./sound/" + "snare2.wav", 2048);
  synthbeep1 = minim.loadSample("./sound/" + "synthbeep1.wav", 2048);
  synthbeep2 = minim.loadSample("./sound/" + "synthbeep2.wav", 2048);
  synthbeep3 = minim.loadSample("./sound/" + "synthbeep3.wav", 2048);
}

void draw()
{
  background(150);
  for (int i = 0; i < block_number; i++)
  {
    obj_block[i].display();
    obj_block[i].movement();
    obj_block[i].neighbour();
    //obj_block[i].combine();
  }

  //println("Kind  " + obj_block[65].kind);
  //println("left combined " + obj_block[65].left_combined);
  //println("top combined " + obj_block[65].top_combined);
  //println("right combined " + obj_block[65].right_combined);
  //println("bottom combined " + obj_block[65].bottom_combined);


  fill(255);
  text("FPS " + int(frameRate), 0, 10);
}

void mousePressed()
{
  for (int i = 0; i < block_number; i++)
  {
    obj_block[i].click(mouseX, mouseY);
  }
}


