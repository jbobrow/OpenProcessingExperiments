
float N=7; // number of corners 
// try changing the value of above N with 5,15,7 etc
float angle = 360/N; 
float rangle=0.0; // angle of rotation 
float[][] vertices = new float[30][2];
float radius = 148;

void setup(){
size(400,400);
}


void draw(){
  background(220);
  translate(width/2,height/2);
  rangle +=.01;
  rotate(rangle);
  //radius +=1;
  //if(radius > 40)
  //radius =radius *-1;
  //vertices[0][0] = cos( radians( angle * 0 )) * radius;
  //vertices[0][1] = sin( radians( angle * 0 )) * radius;
// /*
//stroke(100,100);

  for (int i = 0; i < N; i++) 
  {
    vertices[i][0] = cos( radians( angle * i )) * radius;
    vertices[i][1] = sin( radians( angle * i )) * radius;
    ellipse(vertices[i][0],vertices[i][1],20,20);
   
     if(i==N-1)
     {
      line(vertices[i][0],vertices[i][1]  , vertices[0][0],vertices[0][1]);
     }
     else
     {
     line(vertices[i][0],vertices[i][1]  , vertices[i+1][0],vertices[i+1][1]);
     stroke(12,255,10);
     }
  }
}
