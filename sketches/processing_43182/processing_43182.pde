

// IEvolution.pde   interactive evolution  2011-10-19
//
// original Evolution by Asher Salomon 
//     see http://www.openprocessing.org/visuals/?visualID=15839
//
// >>> mouse button commands:
//       left mb   draw pixels
//       right mb  draw black circles 
// >>> key commands
//      shift key + mouse move -> directional drawing    
//          b:  blur 
//          d:  delate 
//          e:  erode 
//          s:  save as picture  
//      blanc:  clear all

int rnd(float v)  
{ return int(random(v)); }

void Reset()
{ background(0);
  set(width/2,height/2,color(50+rnd(200)));
}

void setup()
{ println ("IEvolution"); 
  size(800,600);
  Reset();
  frameRate(200);
  fill(0);
}

void draw()
{ int ram = 8;
  int r2 = 2*ram+1;
  if (mousePressed) 
    if (mouseButton == RIGHT) ellipse(mouseX,mouseY,88,88);
  else set(mouseX,mouseY,color(50+rnd(200)));
  
//  if (frameCount%159 == 0) filter(DILATE);
//  if (frameCount%111 == 0) filter(ERODE);
//  if (frameCount%188 == 0) filter(BLUR);
  
  int mx = 0;
  int my = 0;
  if (keyCode == 16)     // shift key pressed ?
  { mx = (mouseX - pmouseX) / 14;
    my = (mouseY - pmouseY) / 14;
    keyCode = 0;
  }
  for(int m=0;m<50000;m++)
  { int x = rnd(width);
    int y = rnd(height);
    color clr = get(x,y);
    if(red(clr) != 0)
    { x = (x+mx+rnd(3)-1) % width;
      y = (y+my+rnd(3)-1) % height;
      if(red(get(x,y)) < 111)
        set(x,y,color(red(clr)+rnd(r2)-ram
                   ,green(clr)+rnd(r2)-ram 
                    ,blue(clr)+rnd(r2)-ram));             
    }
  }
  //if (frameCount%60 == 0) println ("fps=" + nf(frameRate,0,1));
}

void keyPressed(){
  switch (key)
  { case ' ': Reset();  break;
    case 'b': filter(BLUR);  break;
    case 'd': filter(DILATE);  break;
    case 'e': filter(ERODE);  break;
    case 's': saveFrame("IEvolution.png");  break;
  }
}

