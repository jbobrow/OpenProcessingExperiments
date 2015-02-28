



int numFrames = 12;  // anzahl der frames in der animation
int frame = 0;
PImage[] images = new PImage[numFrames]; //array für frames

void setup()
{
  size(800, 800);
  frameRate(120);
  noStroke();
  smooth();




  for (int i=0; i<numFrames; i++) {
    String imageName = "p_" + nf(i, 4) + ".gif"; //dateiname wird generiert ("p_0001.gif -"p_0011.gif")
    images[i] = loadImage(imageName); //bild wird in array geladen
  }
} 

void draw() 
{ 
  background(0);
  int x = mouseX;
  int y = mouseY;




  rectMode(CENTER);
  noFill();
  strokeWeight(100);
  colorMode(HSB, 360, 100, 100);
  for (int i=0; i<45; i++) {

    stroke(0, 155);

    pushMatrix();
    translate(x, y); //koordinaten an mausposition
    rotate(radians(20*frameCount%360)); //rotation um mausposition
    ellipse(-10, 5, i*100-15, i*100-15); // schatten
    popMatrix();

    stroke(((frameCount/2-i)*30)%360, 100, 100); //strichfarbe kreise



    ellipse(x, y, i*100, i*100); //bunte kreise um mausposition

    noStroke();
  }

  frame = (frame+1) % numFrames;// schaltet bei jedem durchlauf einen frame weiter

  for (int j=0; j<10; j++) {
    for ( int h=0; h<10; h++) {

      pushMatrix();
      translate(j*80+40, h*80+40); //nullpunktverschiebung auf kachelmitte

      rotate(atan2(mouseY-h*80+40, mouseX-j*80+40)); //koordinatensystem wird richtung mausposition gedreht
      float a = map(dist(j*80+40, h*80+40, mouseX, mouseY), 0, sqrt(2*sq(800))-sqrt(2*sq(40)), 20, 200); //abstand kachelmitte/ mauszeiger wird in den wertebereich 20 bis 200 umgerechnet
      //rect(-a/2,-a/2,a,a);
      fill(0, 128); 


      rect(a/5*cos(radians(20*frameCount%360)), +a/5*sin(radians(20*frameCount%360)), a, a); //schatten kreist im radius a/5 um kachelmittelpunkt (rectMode(CENTER!!))
      image(images[frame], -a/2, -a/2, a, a); //frame wird platziert (CORNER), schauen, ob man das auch auf center umstellen kann...

      popMatrix();
    }
  }
}


