
void setup() {
  size(300, 300);
  background(0);
  noStroke();
  smooth();
  fill(255);
  rectMode(CENTER);
  //translate(-width/2,-height/2);
  //dywS(width/2, height/2, height/3, 7);
  frameRate(15);
}
//int licz = 0;
float i = 1;

void draw() 
{
  
  i=i*1.03;
  if(i>=3)
  i=1;
  background(0);
  //scale(map(i,0,width/4,2,8));
  
  scale(i);
  dywS(width/2, height/2, height/3, 5);
  print(i+"\n");
}

void dywS(float A, float B, float D, int ilRek)
{
  if (ilRek > 0)
  {
    ilRek--;
    for (int i = -1; i <= 1; i++)
      for (int j = -1; j <= 1; j++)
      {
        if(!(i == 0 && j == 0))
        dywS(A+D*i, B+D*j, D/3, ilRek);
    }
  }
  //fill(color(10+50*ilRek,250,250-60*ilRek));
  rect(A,B,D,D);
  //licz++;
  //print("rek" + ilRek+" ("+A+", "+A+") \n"); 
  //print("licznik: "+licz+"\n");
}


