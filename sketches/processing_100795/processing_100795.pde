
// Sandpainter by Kostyantyn Ovechko

int MAX_X=320;
int MAX_Y=240;
int FINGER_RADIUS=18;
float POWER=2;
int BORDER_DARKNESS=10;
void sand_init(){
  background(239,160,8);
  for (int x=0; x<width; x=x+2){
    for (int y=0; y<height; y++){
       int r = int(random(200,255)); 
       int g = int(random(120,200)); 
       int b = int(random(0,60));
       stroke(r,g,b);
       point(x,y);
    };
  };
}

void setup() {
  size(MAX_X,MAX_Y);
  sand_init();
};

void mousePressed(MouseEvent e) {
  if ((e.getClickCount()==2) || (mouseButton == RIGHT)){
    sand_init();
  }
}

void keyPressed() {
  sand_init();
}

void finger(int fingerX, int fingerY){
    for (int y=fingerY-FINGER_RADIUS; y<=fingerY+FINGER_RADIUS; y++){
      float sinus=float(y-fingerY)/FINGER_RADIUS;
      float angle=asin(sinus);
      int x_start=int(cos(PI-angle)*FINGER_RADIUS+fingerX);
      int x_end=int(cos(angle)*FINGER_RADIUS+fingerX);
      for (int x=x_start; x<x_end; x=x+2){
         float distance=sqrt(sq(x-fingerX)+sq(y-fingerY));
         float alph=(x-fingerX)*(fingerX-pmouseX)+(y-fingerY)*(fingerY-pmouseY);
         float wave_height=cos(PI+distance/FINGER_RADIUS*1.5*PI)*FINGER_RADIUS;
         int r = int(220-BORDER_DARKNESS+int(random(0,35))+wave_height*POWER);
         int g = int(140-BORDER_DARKNESS+int(random(0,40))+wave_height*POWER); 
         int b = int(0+int(random(0,40))+wave_height*POWER);
         r = constrain(r, 0, 255); 
         g = constrain(g, 0, 255); 
         b = constrain(b, 0, 255);
         stroke(r,g,b, alph*5+50);
         point(x,y);     
      }
    }  
}


void draw(){
  if (mousePressed){
    if ((pmouseX!=mouseX || pmouseY!=mouseY) && (mouseX-pmouseX)<50 && (mouseY-pmouseY)<50){
//        finger(mouseX, mouseY);
      int steps_total=max(abs(pmouseX-mouseX),abs(pmouseY-mouseY));
      for (int step=1; step<=steps_total; step=step+3){
           int fingerX=int(float(pmouseX)*(steps_total-step)/steps_total+float(mouseX)*step/steps_total);
           int fingerY=int(float(pmouseY)*(steps_total-step)/steps_total+float(mouseY)*step/steps_total);
           finger(fingerX, fingerY);
      }
    }    
  };
};
