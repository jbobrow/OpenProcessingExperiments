
int xi = 0;
int yi = 0;

color c1, c2;

boolean X = true;
int a = 80;

int ii = 0;
int i;

float chance = 0.5; //1000 = 100%, 0 = 0%

void setup()
{
  size(800,800);
  c1 = color(random(255),random(255),random(255));
  c2 = color(random(255),random(255),random(255));
  
  /*for(yi = 0; yi < height; yi++){
    for(xi = 0; xi < width; xi++){
      if( (xi + width*yi)%(int)a == 0) X = !X;
      if(X) stroke(c1);
      else stroke(c2);
      point(xi,yi);
      
      if(random(1000) < chance) randomize();
    }
  }*/
}

void draw()
{
  a = 80;
  for(int i = 0; i < width*height; i++){
    
      if( (xi)%a == 0) X = !X;
      if(X) stroke(c1);
      else stroke(c2);
      point(xi,yi);
      
      if(random(1000) < chance) randomize();
    
      xi++;
      ii++;
      
      if (xi % width == 0 && xi != 0) { xi = 0; yi++; }
      if (yi % height == 0 && yi != 0) yi -= height;
  }
}

void randomize()
{
  switch((int)random(3)){
    
    case 0:
      a = (int)(a - 20 + random(41));
      if(a == 0) a = 1;
      break;
      
    case 1:
      c1 = color(random(255),random(255),random(255));
      break;
      
    case 2:
      c2 = color(random(255),random(255),random(255));
      break;
  }
}

