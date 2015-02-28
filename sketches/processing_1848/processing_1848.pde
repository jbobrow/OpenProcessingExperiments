
// Playing with objcets



float kante = 50;
Ding[] d = new Ding[1]; 
int count = 0;


void setup(){
  size(400, 400);
  smooth();
  colorMode(HSB, 100);
  d[0] = new Ding(kante, kante);
}



void draw(){
  fill(100, 0, 0, 20);            // fade out
  rect(0, 0, width, height);
  for(int i=0; i <= count; i++ ){
    d[i].neu(); 
  }
}

void mousePressed(){
  count++;
  d = (Ding[]) expand(d, count+1);
  d[count] = new Ding(random(kante*2), random(kante*2));
  
}






class Ding{
  float obj_x, obj_y, vektor_x, vektor_y, farbe;
  Ding (float x, float y){
    obj_x = x;
    obj_y = y; 
    vektor_x = random(5);
    vektor_y = random(5);
    farbe = random(100);
  }
  
  void neu(){
    fill(farbe, 100, 100, 40);            // draw objekt
    rect(obj_x, obj_y, kante, kante);

    if(obj_x > (width - kante)){      // right border
      vektor_x = vektor_x * (-1);
      farbe = (farbe+5)%100;
    }
  
    if(obj_x <= 0){                   // left border
      vektor_x = vektor_x * (-1);
      farbe = (farbe+5)%100;
      vektor_x = (vektor_x+2)%7;
    }
  
    if(obj_y > (height-kante)){       // bottom
      vektor_y = vektor_y * (-1);
      farbe = (farbe+5)%100;
    }
  
    if(obj_y <= 0){                   // top
      vektor_y = vektor_y * (-1);
      farbe = (farbe+5)%100;
      vektor_y = 2*(vektor_y+2)%7;
    }

    obj_x += vektor_x;              // movement
    obj_y += vektor_y;
  }
}

