
/*
Banners in the Wind  by Jaap Steilberg
Credits to tuxedocat for the great "Perlin Noise"
The sketch starts with a demo. You might need to restart a couple of times to get a good picture.
Click inside the frame to enter interactive mode: Pick a color to start painting and click again to stop. If you done with a banner, click outside the color block, then Perlin Noise continue without painting.
This is the right moment to press 'S' to SAVE the current display.
Wait a bit before you start the next banner. Wasn't the right moment? Press 'R' to RESTORE what was saved. You can also subsequently press 'R' during painting.
*/


//Noise  5 OCT 2009
int num=16000;
PVector[]pos=new PVector[num];
PVector[]vel=new PVector[num];
PVector[]acc=new PVector[num];

float R1=random(0, 255);
float G1=random(0, 255);
float B1=random(0, 255);
float noisy=.007;

// Banners
int interactive=0, picker=0, drawnPicker, drawNoise, saved=0, sq;
PImage saveBehind, saveForLater;

int sw;

// _______________________________________________________________________________

void setup()
  {
    size(1167, 620);
    ellipseMode(RADIUS);

    sq=width/50;
    if (sq<5) sq=5;            
    if (sq>15) sq=15;

    background(0);
    smooth();
    drawNoise=1;

    sw=0;

    saveBehind=createImage(1200, 800, RGB);
    saveForLater=createImage(1200, 800, RGB);

    for (int i=0; i<num; i++)
      {
        pos[i]=new PVector(random(0), random(0), random(0));
        vel[i]=new PVector(0, 0);
        acc[i]=new PVector(0, 0);
      }
    noiseDetail(1);

  }
// _______________________________________________________________________________

void draw()
  {
    int x, y, z, r, g, b;

    if (interactive==0)
      {
        sw++;
        if ((sw & 0x10)==0) {R1=255; G1=0; B1=0;}
        else {R1=255; G1=255; B1=255;}
        if (sw>270) drawNoise=0;
      }
    if (picker==1)
      {
        stroke(0, 0);
        if (drawnPicker==0)
          {
            // save perlin
            saveBehind=get(0, 0, width, height);

            // draw color picker
            translate(width/2, height/2);
            for (x=0; x<10; x++)
                for (y=0; y<10; y++)
                    for (z=0; z<5; z++)
                      {
                        r=64*z; if (r>255) r=255;
                        g=29*x; if (g>255) g=255;
                        b=29*y; if (b>255) b=255;
                        fill(r, g, b);
                        rect(-25*sq+x*sq+10*z*sq, -5*sq+y*sq, sq, sq);
                      }
            drawnPicker=1;
          }
      }
    else
      {
        drawnPicker=0;
        for (int i=0; i<num; i++)
          {
            stroke(R1, G1, B1, 10);
            if (drawNoise==1) point(pos[i].x, pos[i].y);
            vel[i].x=10*noise(200+pos[i].x*.007, 200+pos[i].y*.007, noisy*2)*cos(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
            vel[i].y=10*noise(200+pos[i].x*.007, 200+pos[i].y*.007, noisy*2)*sin(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
            pos[i].add(vel[i]);
            if (pos[i].x<0 || pos[i].y<0 || pos[i].x>width || pos[i].y>height)
              {
                pos[i].x=random(width);
                pos[i].y=random(height);
                vel[i].x=width/2;
                vel[i].y=height/2;
              }
            acc[i].x=0;
            acc[i].y=0;
          }
        noisy+=.007;
      }
  }

// _______________________________________________________________________________

void mousePressed()
  {
    int col;

    if (interactive==0)
      {
        interactive=1;
        background(0);
        picker=1;
        return;
      }
    if (picker==1)
      {
        drawNoise=1;
        if (mouseX<width/2-25*sq) drawNoise=0;
        if (mouseX>width/2+25*sq) drawNoise=0;
        if (mouseY<height/2-5*sq) drawNoise=0;
        if (mouseY>height/2+5*sq) drawNoise=0;

        col=get(mouseX, mouseY);
        R1=red(col);
        G1=green(col);
        B1=blue(col);

        // return saved picture
        copy(saveBehind, 0, 0, width, height, 0, 0, width, height);
      }
    picker^=1;
  }

//__________________________________________________________________

void keyPressed()
  {
    if (key=='s' && picker==0)
      {
        saveForLater=get(0, 0, width, height);
        saved=1;
      }
    if (key=='r' && picker==0 && saved==1)
      {
        copy(saveForLater, 0, 0, width, height, 0, 0, width, height);
      }

  }

