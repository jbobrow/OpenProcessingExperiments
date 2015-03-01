
float[] xpos = new float[200];
float[] ypos = new float[200];

float[] xStartFlex = new float[40];
float[] yStartFlex = new float[40];


float xStart;
float yStart;


void setup() {
  size(800, 800);
  background (0);

  for (int i=0; i< xpos.length; i++) {
    xpos[i]=width/2;
    ypos[i]=height/2;
  }
  
    for (int i=0; i< xStartFlex.length; i++) {
    xStartFlex[i]=width/2+sin(i)*100;
    yStartFlex[i]=height/2+cos(i)*100;
  }

  xStart = width/2;
  yStart = height/2;
}



void draw() {

  background(0);

  fill(255);
  strokeWeight(10);




  xpos[xpos.length -1] = xStart;
  ypos[ypos.length -1] = yStart;



  //randomSeed (5);


  for (int i= 0; i < xpos.length-1; i++) {


    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }



  for (int i = 0; i < xpos.length-1; i++) {

    float r = map(i, 0, xpos.length, 255, 0);
    float g = map(i, 0, xpos.length, 122, 122);
    float b = map(i, 0, xpos.length, 0, 255);
    float sz = map(i, 0, xpos.length, 0, random(5, 30));
    float intNoise = noise(frameCount,10);
    //    fill(b);
    //      ellipse(xpos[i], ypos[i], sz, sz);


    fill(abs(g - (frameCount % 255)), abs(b - (frameCount%255)), abs(r - (frameCount%255)));
    stroke (b, r, g, 50);
    strokeWeight(sz*.5);
    ellipse(xpos[i+(int(intNoise) % xpos.length)], ypos[i], sz*sin(frameCount*.01)*3, sz*sin(frameCount*.01)*3);

    line(xpos[i], ypos[i], xpos[i+1], ypos[i+1]);

    fill(abs(r - (frameCount % 255)), abs(g - (frameCount%255)), abs(b - (frameCount%255)));
    stroke (r, g, b, 100+(intNoise%155));
    strokeWeight(sz*.5);

    ellipse(xpos[i], ypos[i], sz, sz);

    line(xpos[i], ypos[i], xpos[i+1], ypos[i+1]);




    if (xpos[xpos.length-1] > width || xpos[xpos.length-1] < 0 || ypos[ypos.length-1] <0 || ypos[ypos.length-1] > height) {
      
      xStart = xStartFlex[frameCount%xStartFlex.length];
      yStart = yStartFlex[frameCount%yStartFlex.length];
      
//      xStart = width/2;
//      yStart = height/2;
    } else
    { 

      
    xStart += random (-10, 10);
    yStart += random (-10, 10);
    }


    println(xStartFlex + ", " + yStart + ", xpos:" + xpos);

       if (keyPressed) {
    if (key == 's') {
      saveFrame("line-######.jpg");
    }
  }
    //  fill(255);

    //  ellipse(mouseX, mouseY, 10, 10);
  }
}



