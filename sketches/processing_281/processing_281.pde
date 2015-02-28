
/**
  binarymillenium
  <br><br>
  2008
  <br><br>
  GNU GPL
  <br><br>

  <br>'f' - darken screen
  <br>'j' - advance time, change granularity
  <br>'l' - make lines move 90 degrees to old flows
  <br>'t' - use a texture to store the background
  <br>'d' - toggle whether lines sprout from edges or interior
  */

float t;

 boolean use_texture = false;
 boolean tree_like = true;
boolean use_lateral =false;
boolean all_lateral = false;
final int NUM_PS = 500;

PImage a;
PImage b;

 float div = 50.0;
 
 
class particle {
  float x;
  float y;  
  
  float old_x;
  float old_y;
  
  int counter;
  
  boolean lateral;
  
  color c;
  
  float x_seed;
 
  final float mv = 60.0;
  
  static final float max_counter = 150;
  
  ///////////////////////////////////
  void draw() {
    stroke(c);
      fill(c);
      
      line(x,y,old_x,old_y);
   //rect(x,y,2,2);  
  }
  
  void update() {
    
    
    
    counter++;
    if (counter > max_counter) {
      /*if (tree_like) {
        final float ext = width/2;
        x+= random(-ext,ext);
        y+= random(-ext,ext);
        counter = 0;
      } else */{
        new_pos();
      }
        
    }
    
    old_x = x;
    old_y = y;

     float a = mv*(noise(x/div,y/div,t) - 0.5);
     float b = mv*(noise(width + x/div,y/div,t) - 0.5);   
    x += lateral ? a : -b;
    y += lateral ? b : a;
  }
  
  void new_pos() {
   
        //if (random(1) > 0.5) lateral = true;
        if (use_lateral) lateral = !lateral;
       else {
       if (all_lateral) lateral = true;
        else lateral = false;
       }
        counter = 0;
          
          
         if (tree_like) {
           /*
            x = random(width); //x_seed +random(width/20);
             y = height; 
             */
             x = random(width);
             y = random(height);
           
         } else {
           int sel = (int)(random(4)%4);    
         
       
          if (sel == 0) {
             x = random(width);
             y = 0;    
          } else if (sel == 1) {
             x = random(width);
             y = height;    
          } else if (sel == 2) {
             x = 0;
             y = random(height);
          } else if (sel == 3) {
            x = width;
            y = random(height);
          }
          
         }
          
          old_x = x;
          old_y = y;
          
               float c1 = x/width*255;
      float g = y/height*255;
      float b = random(255);
      //if (random(1) > 0.9)c1 = 0;
      
      c = color(c1,g,lateral? b : 255-b,15+random(45));
      if (use_texture)  c = color(c1,g,b,10+random(90));
         
  }
  
  particle() {
    
    x_seed = width/4 + random(width/2);
     new_pos();
     
 
  }
  
  void test_respawn() {
    final float f = 0.1;
    if ((x > width*(1.0+f))  || (x < -width*f) || 
        (y > height*(1.0+f)) || (y < -height*f) ) {
          
          new_pos();

        }  
  }
  
};

particle ps[];

void setup() {
  
  
  frameRate(30);
  size(650,520,P3D);
  
     a = new PImage();
     a.width = width;
     a.height = height;
     a.pixels = new color[a.width*a.height];
     
     b = new PImage();
     b.width = width/2;
     b.height = height/2;
     b.pixels = new color[a.width*a.height];
     
  ps = new particle[NUM_PS];  
  
  for (int i = 0; i< ps.length; i++) {
     ps[i] = new particle();  
     ps[i].counter = (int)random(particle.max_counter);
  }
  
  background(0);
}

int counter;
void draw() {
  
  
  if (use_texture) {
  float ofs[] = new float[8];
  for (int i = 0; i< ofs.length; i++) {
  ofs[i] = 0; //1.0*(noise(t*10+i*1000)-0.5);
}

  beginShape();
texture(a);
vertex(0,     0,      0+ofs[0],       0+ofs[1]);
vertex(width, 0,      a.width+ofs[2], 0+ofs[3]);
vertex(width, height, a.width+ofs[4], a.height+ofs[5]);
vertex(0,     height, 0+ofs[6],       a.height+ofs[7]);
endShape();

  
  } else {
      
  
 
  if (counter % 50 == 0) { 
    fill(0,0,0,1);
    rect(0,0, width, height);
  }
  }
  

  
  
   noStroke();
   
  
  for (int i = 0; i< NUM_PS; i++) {
     ps[i].update();
     ps[i].draw();
     ps[i].update();
      ps[i].draw();
     ps[i].update();
     ps[i].draw();
     ps[i].update();
      ps[i].draw();
      
   ps[i].test_respawn();

 
  }
  
  //div += 1.0*(noise(t)-0.5);
  
  if (use_texture) {
  loadPixels();
  arraycopy(pixels,a.pixels);
  }
  
  
   counter++;
   
   
    if ((counter > 200) || (mousePressed)) {
     counter = 0;
     fill(0,0,0,200);
     t+= 0.1;
    rect(0,0, width, height);
    div += 10.0*(noise(t)-0.5);
    if (div < 5) div += 50;
    
   // use_texture = !use_texture;
     
  }
  
  if(keyPressed) { 
    if(key == 'f') {
      fill(0,0,0,100);
      rect(0,0, width, height);
    }
    if(key == 'j') {
      div += 2.0*(noise(t)-0.5);
      t+= 0.1;
      if (div < 5) div += 50;
    }
    if(key == 'l') {
      all_lateral = !all_lateral;
    }
    if (key == 't') {
       use_texture = !use_texture; 
    }
    if (key == 'd') {
       tree_like = !tree_like;
    }
      
  }
  
  t += 0.002;
}

