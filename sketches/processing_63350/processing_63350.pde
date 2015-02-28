
float[] xpos = new float[30];
float[] ypos = new float[30];
float r, g, b, a;
float X;
float Y;
float xDir;
float yDir;

void setup()
{
  size(500, 500);
  smooth();

  frameRate(20);

  X=width/2+10;
  Y=height/4;

  xDir=1;
  yDir=10;

  for (int i =0; i<xpos.length; i++)
  {
    xpos[i]=0;
    ypos[i]=0;
  }
}

void draw()
{
  background(255);

  r=random(255);
  g=random(225);
  b=random(255);

  for (int i=0; i<xpos.length-1;i++)
  {
    xpos[i]= xpos[i+1];
    ypos[i] = ypos[i+1];
  }

  xpos[xpos.length-1]=X;
  ypos[ypos.length-1]=Y;

  X+=cos(radians(xDir*10))*40;
  Y+=sin(radians(yDir))*30;

  xDir+=1;
  yDir+=14;
  if (X<=0 || X>=width) xDir*=-1;
  if (Y<=0 || Y>=height) yDir*=-1;

  for (int i=0; i<xpos.length;i++)
  {
    a=i*1.5;

    //나비
    noStroke();
    fill(r, g, b, a);

    triangle(xpos[i], ypos[i], xpos[i]+10, ypos[i]+10, xpos[i]+30, ypos[i]-30);
    triangle(xpos[i], ypos[i], xpos[i]-10, ypos[i]+10, xpos[i]-30, ypos[i]-30);
    triangle(xpos[i], ypos[i], xpos[i]+20, ypos[i]+40, xpos[i]+10, ypos[i]-10);
    triangle(xpos[i], ypos[i], xpos[i]-20, ypos[i]+40, xpos[i]-10, ypos[i]-10);
    quad(xpos[i]-3, ypos[i]-5, xpos[i]-1, ypos[i]+30, xpos[i]+1, ypos[i]+30, xpos[i]+3, ypos[i]-5);

    stroke(r, g, b, a);
    strokeWeight(1);
    line(xpos[i], ypos[i], xpos[i]-5, ypos[i]-30);
    line(xpos[i], ypos[i], xpos[i]+5, ypos[i]-30);

    //클릭시 꽃핌
    if (mousePressed)
    {
      xpos[xpos.length-1] = mouseX;
      ypos[ypos.length-1] = mouseY;

      a=i*3;
      noStroke();
      fill(random(100, 255), random(100, 255), random(100), i*2);
      ellipse(xpos[i], ypos[i], 20, 20);
      beginShape();

      fill(random(100, 255), random(100, 255), random(100, 255), i*2);
      //1번꽃잎
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i]-20, ypos[i]-50);
      curveVertex(xpos[i], ypos[i]-100);
      curveVertex(xpos[i]+20, ypos[i]-50);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      //2번꽃잎
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i]+50, ypos[i]-20);
      curveVertex(xpos[i]+100, ypos[i]);
      curveVertex(xpos[i]+50, ypos[i]+20);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      //3번꽃잎
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i]-20, ypos[i]+50);
      curveVertex(xpos[i], ypos[i]+100);
      curveVertex(xpos[i]+20, ypos[i]+50);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      //4번꽃잎
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i]-50, ypos[i]-20);
      curveVertex(xpos[i]-100, ypos[i]);
      curveVertex(xpos[i]-50, ypos[i]+20);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      endShape();

      beginShape();

      fill(random(180, 225), random(180, 225), random(180, 225), i*2);
      //5번꽃잎
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i]+20, ypos[i]-50);
      curveVertex(xpos[i]+70, ypos[i]-70);
      curveVertex(xpos[i]+50, ypos[i]-20);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      //6번꽃잎
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i]+20, ypos[i]+50);
      curveVertex(xpos[i]+70, ypos[i]+70);
      curveVertex(xpos[i]+50, ypos[i]+20);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      //7번꽃잎
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i]-20, ypos[i]+50);
      curveVertex(xpos[i]-70, ypos[i]+70);
      curveVertex(xpos[i]-50, ypos[i]+20);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      //8번꽃잎
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i]-20, ypos[i]-50);
      curveVertex(xpos[i]-70, ypos[i]-70);
      curveVertex(xpos[i]-50, ypos[i]-20);
      curveVertex(xpos[i], ypos[i]);
      curveVertex(xpos[i], ypos[i]);
      endShape();

      //줄기
      noFill();
      stroke(#9BFA7C, i*2);
      strokeWeight(5);
      beginShape();
      curveVertex(xpos[i]+20, ypos[i]+50);
      curveVertex(xpos[i]+20, ypos[i]+50);
      curveVertex(xpos[i]+50, ypos[i]+150);
      curveVertex(xpos[i]-50, ypos[i]+300);
      curveVertex(250, 500);
      curveVertex(250, 500);
      endShape();
    }
  }
}


