
int scene = 0;
//Scene1
float i = 0;
float j = 0;
float k = 0;
float kk = 0;
//Scene2
float sceneTwo1 = 0;
float sceneTwo2 = 0;
float sceneTwo3 = 0;
//scene3
float sceneThree1 = 0;
float sceneThree2 = .3;
float counter = 0;


color black = color(0,0,0);
color grey = color(120,120,120);
color cRed = color(255,0,0);
color cYellow = color (255,255,0);
color cBlue = color (0,0,255);
color cGreen = color(0,255,0);
color cGreenB = color(100,255,100);
color cGreenD = color(0,200,0);

void draw()
{
  noStroke();
  i = i+1;
  fill(black);
  rect(0,0,200,200);
  fill(cRed);
  ellipse(50,50,i*1.7,i*1.7);
  if(i>70)
  {
    j=j+1;
    fill(cYellow);
    rect(50-((j*2.5)/4),50-((j*2.5)/4),(j*2.5)/2,(j*2.5)/2);
  }
  if(i>140)
  {
    if(k>45)
    {
      kk++;
    }
    k++;
    fill(cBlue);
    translate(50,50);
    quad(0-k*1.7,0+k*2,0-kk,0-(k+2),0+kk,0-(k+2),0+k*1.7,0+k*2); 
    translate(-50,-50);
    //
    //Scene2
    //
    if(kk>55)
    {
        if(counter>165)
      {
        sceneTwo3++;
        color increasinglyGreen = color(0,(sceneTwo3*2),255-(sceneTwo3*2));
        fill(increasinglyGreen);
        rect(0,0,100,100);        
      }
      sceneTwo1++;
      counter++;
      fill(cGreen);
      translate(-50+sceneTwo1,-50+sceneTwo1);
      rect(0,0,20,20);
      rect(-50,-10,10,10);
      rect(-80,-80,20,20);
      rect(-130,-90,10,10);
      rect(-160,-160,20,20);
      rect(-210,-170,10,10);
      fill(cGreenB);
      rect(-20,-60,30,30);
      rect(-100,-140,30,30);
      rect(-180,-220,30,30);
      translate(sceneTwo1/2,sceneTwo1/2);
      fill(cGreenD);
      rect(-10,-50,15,40);
      rect(-60,-6,15,15);
      rect(-110,-150,15,40);
      rect(-160,-106,15,15);
      rect(-210,-250,15,40);
      rect(-260,-206,15,15);
      fill(cGreen);
      rect(-150,-75,40,20);
      rect(-300,-225,40,20);
      rect(-450,-375,40,20);
      fill(cGreenB);
      rect(-100,-90,15,15);
      translate(-(sceneTwo1/2),-(sceneTwo1/2));
      translate(50-sceneTwo1,50-sceneTwo1);   
       //Scene3
       if(counter>400)
        {
          color fadetoblack = color(0,255-(sceneThree1*.8),0);
          fill(fadetoblack);
          rect(0,0,100,100);
          sceneThree1++;
          translate(50,50);
          rotate(sceneThree1*.08);
          fill(cGreen);
          rect(-50+(sceneThree2/2),-50+(sceneThree2/2),100-sceneThree2,100-sceneThree2);
          rotate(-(sceneThree1*.08));
          translate(-50,-50);
          sceneThree2=sceneThree2+.3;
          if(sceneThree2>100)
          {
            fill(black);
            rect(0,0,100,100);
          }
        }       
    } 
  }
}

