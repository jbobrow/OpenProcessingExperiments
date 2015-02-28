
float [] rot=new float[100];
float d=dist(mouseX, mouseY, pmouseX, pmouseY);
float grow=0;
float[] boom=new float[100];
float wobble=0;
float [] speed=new float[100];
int y;
float rad;
float [] counter=new float[100];
float counterI=0;

void setup() {
  size(500, 500);
  smooth();

  int i = 0;
  while (i<100) {
    boom[i]=0;
    i++;
  }
}


void snowflake(float x, float y, float s, float d) {

  rad=dist(mouseX, mouseY, x, y);


  int nx = (int)x-25;
  int ny = (int)y-25;


  int i= 10*floor(ny/(height/10))+floor(nx/(width/10));

  i = constrain(i, 0, 99);

  println("x: "+x +" y: "+y+" i:" + i);


  translate(x+wobble, y+wobble);

  if (rad<100) {
    counter[i]=counter[i]+1;
    speed[i] = speed[i]+d/580;

    
  }
  
      rotate(rot[i]);

  
  if (rad<100&&counter[i]<300) {
    boom[i]=boom[i]+0.5;
  }

  if (rad>100) {
    counterI=counterI+1;
    boom[i]=0;
  }
   if(counterI>3000){
   wobble=random(-1,1);
   }
   if(counterI>8000){
  boom[i]=boom[i]+20; 
  }
  translate(-x+wobble, -y+wobble);

  layer(x, y, s+grow, 10+boom[i]); 
  layer(x, y, s+grow, 10+boom[i]); 
  layer(x, y, s+grow, 10+boom[i]); 
  layer(x, y, s+grow, 10+boom[i]); 
  layer(x, y, s+grow, 10+boom[i]); 
  layer(x, y, s+grow, 10+boom[i]);
}

void layer (float x, float y, float s, float gap) {

  rect(x+gap, y, s, s);
  rect(x-gap, y, s, s);
  rect(x, y+gap, s, s);
  rect(x, y-gap, s, s);
  ellipse(x-gap+(s/2), y-gap+(s/2), s, s);
  ellipse(x+gap+(s/2), y-gap+(s/2), s, s);
  ellipse(x-gap+(s/2), y+gap+(s/2), s, s);
  ellipse(x+gap+(s/2), y+gap+(s/2), s, s);
}

void draw() {



  float x=25;
  background(255);

  float d=dist(mouseX, mouseY, pmouseX, pmouseY);


  for (int across=0; across< 10; across=across+1) {
    float y=25;
    for (int downwards=0; downwards<10; downwards=downwards+1) {
      pushMatrix();

      snowflake(x, y, 2, d);
      popMatrix();
      y=y+50;
    }
    x=x+50;
  }

  int i = 0;
  while (i<100) {
    speed[i] = speed[i]*0.97;
    rot[i]=rot[i]+speed[i];
    i++;
  }
}


