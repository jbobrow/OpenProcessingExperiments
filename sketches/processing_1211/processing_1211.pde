
void setup (){
  size(400,400);
}


int a = 150;
int b = 190;
int c = 165;
int d = 170;
int e = 188;
int f = 170;


void draw ()
{
  
    a = a + 1; 
    if (a > 400){
      a = -40;
    }

    b = b + 1;
    if (b > 440){ 
      b = 0;
    }

    c = c + 1; 
    if (c > 415){ 
      c = -25;
    }

    d = d + 1;
    if (d > 420){ 
      d = -20;
    }

    e = e + 1;
    if (e > 438){
      e = -2;
    }

     f = f + 1;
    if (f > 420){
      f = -20;
    }
    
    
    int gama = 0;
  for(int mar = 0; mar < 400; mar = mar + 1){
    gama = mar % 255;
    stroke(mar,mar,0);
    line(0,mar,width,mar);

    fill (231,234,54,500);
    noStroke ();
    triangle (a,240,b,240,c,255);
    triangle (d,238,e,238,f,210);

  } 

}










