


int value = 0;
float d,x,y,angle;

void setup( )
{
  size(1000, 800);
  background(0);
  smooth();

  noFill();

  
  fill(#FFD22C);
  noStroke();
  star(5, 60, 200, 75, 70, -PI / 2, 0.5); // -90 degrees

}


void star(int n, float cx, float cy, float r, float proportion)
{
  star(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion);
}

void star(int n, float cx, float cy, float w, float h,
  float startAngle, float proportion)
{
  if (n > 2)
  {
    float angle = TWO_PI/ (2 *n);  // twice as many sides
    float dw; // dra width
    float dh; // draw height
    
    w = w / 2.0;
    h = h / 2.0;
    
    beginShape();
    for (int i = 0; i < 2 * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * proportion;
        dh = h * proportion;
      }
      vertex(cx + dw * cos(startAngle + angle * i),
        cy + dh * sin(startAngle + angle * i));
    }
   
    endShape(CLOSE);
 
  }
}
void draw() {
   
  float a,b;
   
  a = cos (radians (angle))*300 + width/3;
  b = sin (radians(angle)) *370 + height/3;
  fill (#FAD651);
  ellipse (a,b,400,400);
  angle += .3;
 

  
  //building at back
    noStroke();
  fill(#494B4D);//building1
  rect(0,240,184,800);
//building2
  rect(180,320,163,800);
  //building3
  rect(300,280,150,800);
 //building4
  rect(450,360,140,800);
 //building5
  rect(590,470,182,800);
  rect(700,300,170,800);
  rect(850,400,200,800);

 
 
 
  noStroke();
  fill(#B5BBC1);//building1
  rect(60,340,184,800);
 //building2
  rect(270,490,163,800);
  //building3
  rect(450,400,150,800);
  //building4
  rect(630,600,132,800);
 //building5
  rect(800,500,182,800);
 
 

   if (key=='2') {
     fill (0,d);
    rect (0,0, 1000,800);
  
    d=100;
  
  }
  else {
      
    x=-10;
    y=-10;
 fill (#CBE6FF, d);
  rect (0, 0, 1000,800);
      d=70;
  
}
  
 
 
  fill(value);
 
   //windows
  rect(80,400,20,20);//
  rect(120,400,20,20);
  rect(160,400,20,20);
  rect(200,400,20,20);
  rect(80,440,20,20);//
  rect(120,440,20,20);
  rect(160,440,20,20);
  rect(200,440,20,20);
  rect(80,480,20,20);//
  rect(120,480,20,20);
  rect(160,480,20,20);
  rect(200,480,20,20);
  rect(80,520,20,20);//7thfloor
  rect(120,520,20,20);
  rect(160,520,20,20);
  rect(200,520,20,20);
  rect(80,560,20,20);//
  rect(120,560,20,20);
  rect(160,560,20,20);
  rect(200,560,20,20);
  rect(80,600,20,20);//
  rect(120,600,20,20);
  rect(160,600,20,20);
  rect(200,600,20,20);
  rect(80,640,20,20);//
  rect(120,640,20,20);
  rect(160,640,20,20);
  rect(200,640,20,20);
  rect(80,680,20,20);//
  rect(120,680,20,20);
  rect(160,680,20,20);
  rect(200,680,20,20);
  rect(80,720,20,20);//
  rect(120,720,20,20);
  rect(160,720,20,20);
  rect(200,720,20,20);
  rect(80,760,20,20);//last floor
  rect(120,760,20,20);
  rect(160,760,20,20);
  rect(200,760,20,20);
   
  //2nd buiding
  
  rect(280,560,20,20);//
  rect(320,560,20,20);
  rect(360,560,20,20);
  rect(400,560,20,20);
  rect(280,600,20,20);//
  rect(320,600,20,20);
  rect(360,600,20,20);
  rect(400,600,20,20);
  rect(280,640,20,20);//
  rect(320,640,20,20);
  rect(360,640,20,20);
  rect(400,640,20,20);
  rect(280,680,20,20);//
  rect(320,680,20,20);
  rect(360,680,20,20);
  rect(400,680,20,20);
  rect(280,720,20,20);//
  rect(320,720,20,20);
  rect(360,720,20,20);
  rect(400,720,20,20);
  rect(280,760,20,20);//last floor
  rect(320,760,20,20);
  rect(360,760,20,20);
  rect(400,760,20,20);
   
  //3rd builgind
   rect(470,480,20,20);//
  rect(510,480,20,20);
  rect(550,480,20,20);
  rect(470,520,20,20);//7thfloor
  rect(510,520,20,20);
  rect(550,520,20,20);
  rect(470,560,20,20);//
  rect(510,560,20,20);
  rect(470,600,20,20);//
  rect(510,600,20,20);
  rect(470,640,20,20);//
  rect(120,640,20,20);
  rect(160,640,20,20);
  rect(200,640,20,20);
  rect(80,680,20,20);//
  rect(120,680,20,20);
  rect(160,680,20,20);
  rect(200,680,20,20);
  rect(80,720,20,20);//
  rect(120,720,20,20);
  rect(160,720,20,20);
  rect(200,720,20,20);
  rect(80,760,20,20);//last floor
  rect(120,760,20,20);
  rect(160,760,20,20);
  rect(200,760,20,20);
  //4th building
    rect(690,640,20,20);//
  rect(720,640,20,20);
  rect(660,680,20,20);
  rect(690,680,20,20);
  rect(660,720,20,20);//
  //5th building
  rect(940,600,20,20);//
  rect(940,640,20,20);
  rect(900,640,20,20);
  rect(940,680,20,20);//
  rect(900,680,20,20);
  rect(860,680,20,20);
  rect(940,720,20,20);//
  rect(900,720,20,20);
  rect(860,720,20,20);
  rect(820,720,20,20);
  rect(940,760,20,20);//last floor
  rect(900,760,20,20);
  rect(860,760,20,20);
  rect(820,760,20,20);
   
   
  } 
 
void mouseReleased() {
 
  if(value == #FFE200) {
 
    value = 0;
 
  } else {
 
    value = #FFE200;
     
  }
 
 
 
}


