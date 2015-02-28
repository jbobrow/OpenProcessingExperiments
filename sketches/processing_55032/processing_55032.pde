
float  wyPap;  //wysokość paproci
float  szPap;    //szerokosc paproci

int ilRek = 1;       //ilość rekurencji(max 5)

int zPap = 16;
void setup() {
  size(800, 800);
  background(0);
  smooth();
  fill(0);
  wyPap=height*1.2;
  szPap=width/4*1.2;
  stroke(color(255,100));
  ellipseMode(CORNER);
//  translate(width/3, height);
//  rotate(PI);
//  paproc(szPap, wyPap, zPap, ilRek); 

  frameRate(1);
  //noLoop();
  mouseClicked();
}

void draw()
{
}

void mouseClicked()
{
  if(ilRek<12)
  {
  background(0);
  pushMatrix();
  translate(width/3, height);
  rotate(PI);
  paproc(szPap, wyPap, zPap, ilRek); 
  ilRek++;
  popMatrix();
  }

}
void paproc(float szPap, float wyPap, int zPap, int ilRek)
{

  ilRek--;
  if (ilRek+1 > 0)
  {
    float wyL = 0, wyL2, szL, sz, teta = 0;
    
    for (int i = 0; i < zPap; i++)
    {
      teta = (i+1)*PI/90;
      rotate(PI/30);
      wyL2 = map(log(norm(i, 0, zPap)+0.1)/log(10.1), -1.10, 0.04, 0, wyPap);
      szL = map(log(norm(i, 0, zPap)+0.1)/log(10.1), -1.20, 0.04, 0, szPap);
      sz = map(wyPap-wyL, 0, wyPap, 0.1, 0.01*wyPap);
      rect(-sz/2, 0, sz/2, wyL2-wyL);
      translate(0, wyL2-wyL);
      
      
      pushMatrix();
      rotate((i%2 == 0 ? 1 : -1)*HALF_PI*0.6);
      wyL = wyL2;
      if((wyPap-wyL)*0.5 > 1)
      paproc((szPap-szL)/2, (wyPap-wyL)*0.5, zPap, ilRek);
      popMatrix();
       
    }
  }
  else
  {
    quad(0, 0, szPap, wyPap/3, 0, wyPap, -szPap, wyPap/3);
  }
}


