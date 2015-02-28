
int counter;
 
int n = 0;
Onda[] onda = new Onda[10];

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(12,219, 212);  //set background white
  counter = 0;
  for (int i = 0; i<10; i++){
    onda[i] = new Onda();
  }
  
}

void draw() {  //draw function loops 
background(12,219, 212);
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
        larg+=20;
        for (int i=4; i >= 0; i--){
            if(i>0)
                x[i]= x[i-1];
            else
                x[i]=larg;  
        }
        
        
        stroke(240,240,240, 100);
        noFill();
        strokeWeight(5);
        for (int i = 4; i >=0; i--)
            ellipse(xp, yp, x[i], x[i]);
                
        if (larg > 800){
            larg = 0;
            press = false;
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
