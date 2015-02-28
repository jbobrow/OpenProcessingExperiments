
ball ball1, ball2, ball3, ball4, ball5;

void setup() {
  colorMode(RGB);
  smooth();
  size(400, 400);
  frameRate(40);
  background(60);
  ball1 = new ball(color(235, 25,  25, 180),  1.3, 10.0, 14.0, 2.0,  5.0, 3.0); 
  ball2 = new ball(color(100, 195, 60, 180),  1.5, 20.0, 15.0, 50.0, 6.0, 4.0);
  ball3 = new ball(color(10,  115, 170, 180), 1.7, 30.0, 16.0, 40.0, 7.0, 5.0);
  ball4 = new ball(color(70,  50,  180, 180), 1.9, 40.0, 17.0, 20.0, 8.0, 6.0);
  ball5 = new ball(color(235, 25,  125, 180), 2.1, 50.0, 18.0, 10.0, 4.0, 7.0);
}                                         //  div  di    m     w     l    u

float a = 0;
float speed = 0.03;
boolean paused = false;
boolean dark = false;

void mouseClicked () {
    if(dist(mouseX, mouseY, 395, 395) < 5) {
        if(!paused) {noLoop(); paused = true;}
        else {loop(); paused = false;}
    }
    if(dist(mouseX, mouseY, 385, 395) < 5) {
        if(!dark) {dark=true;}
        else{dark = false;}
    }
};
void draw() {
    back();  
    ball1.animate();
    ball2.animate();
    ball3.animate();
    ball4.animate();
    ball5.animate();
    a+=speed;
};

class ball {
  color c; 
  float div; 
  float di; 
  float m; 
  float w; 
  float l; 
  float u;
        
  ball(color ic, float idiv, float idi, float im, float iw, float il, float iu) {
      c = ic;       
      div = idiv; 
      di = idi;   
      m = im;   
      w = iw;     
      l = il;     
      u = iu;     
  }
  
  void animate() {
      float d = 40;
      float size = abs(sin(a *2) *4 +10);
      fill(c);
      
          //top left
      ellipse(75 + cos(a) *(d +12), 
              75 + sin(a /div) *50, size, size);
      ellipse(75 + cos(a) *(d +12), 
              75 + sin(a /(div +1)) *50, size, size);
              
          //top right
      pushMatrix();
      translate(325, 75);
      rotate(a*1.7);
      ellipse( sin(a *1.2) *d *sin(a) *u /4.5,
               cos(a) *d *sin(a) *u /4, size -3, size -3);
      ellipse(-sin(a *1.2) *d *sin(a) *u /4.5,
              -cos(a) *d *sin(a) *u /4, size -3, size -3);
      popMatrix();
  
          //top center
      ellipse(200 + cos(a) *(d /2 +cos(a *6) *l + l *4),
               75 + sin(a) *(d /2 +cos(a* 6) *l + l *4), size, size);
      ellipse(200 + sin(a) *(d /2 +sin(a* 6) *l + l /4),
               75 + cos(a) *(d /2 +sin(a* 6) *l + l /4), size -2, size -2);
      
          //center left
      ellipse (75 + cos(a) *d + sin(a) *this.w,
              200 + sin(a) *d + cos(a) *2, size +1, size +1);
      ellipse (75 + sin(a) *(d -30) + sin(a) *abs(this.w -40),
              200 + cos(a) *(d -20), size +1, size +1);
      
          //center center
      ellipse(200 + cos(a) *di, 
              200 + sin(a) *di, size +4, size +4);
      ellipse(200 - cos(a) *di, 
              200 - sin(a) *di -5, size +4, size +4);
      
          //center right        
      ellipse(325 - sin(a *m /10) *d -10 *cos(a), 
              200 - cos(a *m /10) *d -10 *sin(a), size +8, size +8);
              
          //bottom left
      ellipse (75 + cos(a *div) *d *(1+sin(a) /2),
              325 + sin(a *div) *d *(1+sin(a) /2), size, size);
              
          //bottom center
      ellipse(200 + sin(a) *d -l -10 *cos(a /2 *d /l),
              325 + cos(a) *d -l -10 *sin(a /2 *d /l), size, size);
  
          //bottom right
      pushMatrix();
      translate(325, 325);
      rotate(a*1.6);
      ellipse (cos(a +m *20) *d, 
               sin(a -m *20) *d, size +2, size +2);
      ellipse(-cos(a +m *20) *d, 
              -sin(a -m *20) *d, size +2, size +2);
      popMatrix();
  };

}

void back (){
        //background, opacity, and border
    float opacity = map(cos(a /4), -1, 1, 24, 12);
    if(dark) {fill(05, 10, 15, opacity + 2);}
    else     {fill(255, 255, 255, opacity);}
    rect(-100, -100, width + 100, height + 150);
    noFill();
    stroke(200, 200, 200, 5);
    strokeWeight(6);
    rect(0, 0, width, height);
    noStroke();
    fill(255, 153, 0);
    ellipse(width-5, height -5, 5, 5);
    fill(0, 160, 255);
    ellipse(width - 15, height -5, 5, 5);
};






