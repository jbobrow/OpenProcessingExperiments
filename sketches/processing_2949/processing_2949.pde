
//                2009.5.13
//                Programing : Lee, jae-joong
//                E-mail : only104@naver.com
//                Homepage : http://smileblue.co.kr

float LC = 360; // Line drawing count
float RC = 0;   // 360 checking
int SLP = 0; // Line drawing Start point
int cc = 0;  //array check
int check = 1;
int num = 250;  //arary number
int stroke_alpha = 30;

int[] dotx= new int[num];
int[] doty= new int[num];
int[] num_check = new int[num];

void setup()
{
  size(600,600); // screen size
  smooth();        // smooth
  noFill();        // noFill; 
  background(255); // background
  ellipse(width/2, height/2,2,2);
  stroke(0,40);
  beginShape();
  ellipse(width/2, height/2, width ,height);
}

void draw()
{

  ellipse(width/2, height/2,2,2);
  if(check ==1)
  {
    translate(width / 2, height / 2);
    Line00();
  }
  else
  {
    pushMatrix();
    translate(width / 2, height / 2);        // center translate
    rotate((PI / 180) * (RC = RC + (360 / LC)));  // rotate Line
    stroke(0, stroke_alpha);

    beginShape();    

    for(int i=0; i<num; i++)
    {
      vertex(dotx[i], doty[i]);
    }
    endShape(CLOSE);
    popMatrix();

    if(RC >= 360)                              // stop check
    {
      stroke_alpha = 0;
      Redraw();
    }

  }
}

void Line00()
{

  if(check == 1)
  {
    if (mousePressed && (mouseButton == LEFT))
    {

      if(cc >= num)
      {
        check=0;
        background(255);
      }
      else{

        line(pmouseX- width/2, pmouseY- height/2, mouseX- width/2, mouseY- height/2);


        dotx[cc] = mouseX - width/2;
        doty[cc] = mouseY - height/2;
        cc++;
        stroke_alpha = 30;
      }
    }
  }
}

void Redraw()
{
  if( check == 0 )
  {
    if (mousePressed)
    {
      int d = day();    // Values from 1 - 31
      int m = month();  // Values from 1 - 12
      int y = year();
      int s = second();  // Values from 0 - 59
      int mm = minute();  // Values from 0 - 59
      int h = hour();    // Values from 0 - 23
      //    save("drawing"+ y + "_"+ m + "_" + d + "_" + h +"_" + mm + "_" + s +".jpg");
      check = 1;
      background(255);
      stroke(0,40);
      cc = 0;
      RC = 0;
      ellipse(width/2, height/2, width ,height);
    }
  }
}

void mouseReleased()
{
  endShape();
  beginShape();
}


