
int n = 0;
Onda[] onda = new Onda[10];
PImage img;
float linhas = 0;
void setup() {  
  frameRate(7);
  size(500, 300);
  background(12,219, 212);  
  img = loadImage("lake.jpg");
  ellipseMode(RADIUS);
  for (int i = 0; i<10; i++){
    onda[i] = new Onda();
  }
  
}

void draw() {  //draw function loops 
      image(img, 0,0);
      for( int i = 0; i<10; i++){
        onda[i].propaga();
      }
  fill(0);
  
}

class Onda{
    int larg;
    boolean press;
    float xp;
    float yp;
    int[] x = {0,0,0,0,0};
    Onda (){
      larg = 0;
    }
    void clica(boolean press_, float x_p, float y_p){
      press = press_;
      xp = x_p;
      yp = y_p;
    }
    void propaga(){
      if (press){
        larg+=30;
        for (int i=4; i >= 0; i--){
            if(i>0)
                x[i]= x[i-1];
            else
                x[i]=larg;  
        }
        noFill();
        
        for (int i = 4; i >=0; i--){
          stroke(240,240,240, 20);
          switch(i){
            case 0 :
              linhas = 6;
              strokeWeight(linhas);
              ellipse(xp, yp, x[i], x[i]);
              break;
            case 1 :
              linhas = 10;
              strokeWeight(linhas);
              ellipse(xp, yp, x[i], x[i]);
              break;
            case 2 :
              linhas = 16;
              strokeWeight(linhas);
              ellipse(xp, yp, x[i], x[i]);
              break;
            case 3 :
              linhas = 10;
              strokeWeight(linhas);
              ellipse(xp, yp, x[i], x[i]);
              break;
            case 4 :
              linhas = 6;
              strokeWeight(linhas);
              ellipse(xp, yp, x[i], x[i]);
              break;
          }
          strokeWeight(linhas - 2.5);
          stroke(240,240,240, 7);
          if (x[i] > yp)
              ellipse(xp, -yp, x[i], x[i]);
              
          if ((x[i] + xp)> width)
              ellipse(xp + 2*(width -xp), yp, x[i], x[i]);
              
          if ((x[i] + yp) > height)
              ellipse(xp, yp + 2*(height-yp), x[i], x[i]);
              
          if (x[i] > xp)
              ellipse(-xp, yp, x[i],x[i]);
          
        }        
        if (larg > 600){
            larg = 0;
            press = false;
            for (int i=4; i >= 0; i--){
                x[i] = 0;
            }
        }
      }
    }

}

void mousePressed(){
    onda[n].clica(true, mouseX, mouseY);
    n++;
    if (n ==10){
      n=0;
    }
}


