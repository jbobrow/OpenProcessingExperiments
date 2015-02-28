
float N=5; // number of corners
float angle = 360/N; 
float rangle=0.0; // angle of rotation 
float[][] vertices = new float[10][2];
float radius = 48;

void setup(){
size(400,400);
}

void draw(){
  background(20);
  translate(width/2,height/2);
  rangle +=.1;
  rotate(rangle);
  radius +=1;
  if(radius > 80)
  radius =radius *-1;

  for (int i = 0; i < N; i++) 
  {
    vertices[i][0] = cos( radians( angle * i )) * radius;
    vertices[i][1] = sin( radians( angle * i )) * radius;
    stroke(12,255,10);
    ellipse(vertices[i][0],vertices[i][1],20,20);
    if(i==N-2)
    {
      line(vertices[i-3][0],vertices[i-3][1]  , vertices[3][0],vertices[3][1]);
      line(vertices[i-2][0],vertices[i-2][1]  , vertices[i+1][0],vertices[i+1][1]);
    }
    else if(i==N-1) {}
    else
    line(vertices[i][0],vertices[i][1]  , vertices[i+2][0],vertices[i+2][1]);
  }

}
