


import ddf.minim.*;

Minim minim;
AudioInput in;


void setup()
{
  size(1200, 800, P3D); 
  minim = new Minim(this);
  minim.debugOn();


  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {



  background(0);
  stroke(255, 150);
 

translate(width/2, height/2); 

  
  rotateY(frameCount*PI/60);

  //iti
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {

    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);

    rotateX(mouseY * 0.05);
    rotateY(mouseX * 0.05);
    fill(mouseY * 2, 0, 160);
    sphereDetail(mouseX / 255);
    sphere(180);
  }
}
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}


