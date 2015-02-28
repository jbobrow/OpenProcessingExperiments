
void setup() {
  size(700, 700);
  background(0);
  noStroke();
  smooth();
  fill(255);
  rectMode(CENTER);
  //translate(-width/2,-height/2);
  trojS(width/2, height/2, width/2, 8);
}
//int licz = 0;
void draw() 
{
  
}

float pol(float x1, float x2)
{
  return (x1+x2)/2;  
}


void trojS(float A, float B, float D, int ilRek)
{
  if (ilRek > 0)
  {
    ilRek--;
    
    trojS(A, B-D/2*sqrt(3)/2, D/2, ilRek);
    trojS(A-D/2, B+D/2*sqrt(3)/2, D/2, ilRek);
    trojS(A+D/2, B+D/2*sqrt(3)/2, D/2, ilRek);
  }
  //fill(color(10+50*ilRek,250,250-60*ilRek));
  triangle(A-D/2, B, A+D/2, B, A, B+D*sqrt(3)/2);
  //licz++;
  //print("rek" + ilRek+" ("+A+", "+A+") \n"); 
  //print("licznik: "+licz+"\n");
}


