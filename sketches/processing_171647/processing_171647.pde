
/**
  Press "k" to turn on or off colors.
  Press "r" to turn on or off moving reading.
  Press "e" and "q" to lower and raise detail. Past a certain point, this will crash the program.
  Press "c" and "z" to increase or decrease the pseudo-zoom.
  Press "d" and "a" to increase or decrease the maximum squares.
  
  This program produces a 2-dimensional plane that is y-mapped to the noise() function.
  The drawing method is resource-intensive. Be careful with the settings and terminate the program if it haults.
*/
float sizer = .6;
float zinc = 0;
int hitsize = 100;
float makesize = 1.25;
int noiseoct = 4;
float noiseimp = .5;
boolean ifcolor = true;
boolean run = false;
void setup(){
  size(600, 600, P3D);
  noStroke();
}

void draw(){
  noiseDetail(noiseoct, noiseimp);
  background(100);
  fill(255);
  camera(mouseX, mouseY / 2, (height / 2.0) / tan(PI * 30.0 / 180.0), width / 2.0, height / 2.0, 0, 0, 1, 0);
  //lights();
  translate(width / 2, height / 2);
  for(float x = 0; x < makesize; x += sizer){
    for(float z = 0; z < makesize; z += sizer){
      beginShape();
        colorMode(HSB, 1.0);
          if(ifcolor) {fill(noise(x, z + zinc), noise(x, z + zinc),noise(x, z + zinc));}
            vertex((x - (makesize / 2) ) * hitsize, (noise(x, z + zinc) * hitsize) - sizer / 2, (z - (makesize / 2) ) * hitsize);
          if(ifcolor) {fill(noise(x  +sizer, z + zinc), noise(x + sizer, z + zinc), noise(x + sizer, z + zinc));}
            vertex(((x - (makesize / 2) ) + sizer) * hitsize, (noise(x + sizer, z + zinc) * hitsize)  - sizer / 2, (z - (makesize/2) ) * hitsize);
          if(ifcolor) {fill(noise(x + sizer, (z + zinc) + sizer), noise(x + sizer, (z + zinc) + sizer), noise(x + sizer,(z + zinc) + sizer));}
            vertex(((x - (makesize / 2) ) + sizer) * hitsize, (noise(x + sizer,(z + zinc) + sizer) * hitsize)  - sizer / 2, ((z - (makesize / 2) ) + sizer) * hitsize);
          if(ifcolor) {fill(noise(x, (z + zinc) + sizer), noise(x, (z + zinc) + sizer), noise(x, (z + zinc) + sizer));}
            vertex(((x - (makesize / 2) )) * hitsize, (noise(x, (z + zinc) + sizer) * hitsize) - sizer / 2, ((z - (makesize / 2) ) + sizer) * hitsize);
        colorMode(RGB, 405);
      endShape();
    }
  }
  if(run){
    zinc += sizer;
  }
}

void keyPressed(){
  if(key == 'e'){
    sizer = sizer * 2;
  }
  if(key == 'q'){
    sizer = sizer / 2;
  }
  if(key == 'k'){
    ifcolor = !ifcolor;
  }
  if(key == 'r'){
    run = !run;
  }
  if(key == 'c'){
    hitsize ++;
  }
  if(key == 'z'){
    hitsize --;
  }
  if(key == 'd'){
    makesize = makesize / 2;
  }
  if(key == 'a'){
    makesize = makesize * 2;
  }
  if(key == 'h'){
    noiseoct ++;
  }
  if(key == 'f'){
    noiseoct --;
  }
  if(key == 'n'){
    noiseimp -= .025;
  }
  if(key == 'v'){
    noiseimp += .025;
  }
}



