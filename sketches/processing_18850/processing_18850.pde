
Arma[] armadillos = new Arma[20];

      
////Initialize values
void setup() {
  
  size(900, 450);
   
  //anti-aliasing
  smooth();
  
  for(int i=0; i<armadillos.length; i++){
   armadillos[i] = new Arma(1, round(random(100,800)), round(random(100,350)), random(.5,1.2)); 
    
  }
  
  
}
 
  void draw(){
     
    
    
    //RGB
    background(255, 255, 200);
 
    //Rectangle draws from center
    rectMode(CENTER);
     
    //Rectangle properties
    
    for(int i=0; i<armadillos.length; i++){
    armadillos[i].armadillo();
    armadillos[i].movement();
    }
  }
   /*
       
   void armadillo( int x, int y) {
    //Armadillo with variable location on grid
    //Head
    //scale(area);
    beginShape();
    vertex(x, y);
    bezierVertex( x + 5, y , x + 15, y - 15 * (spacer/25), x + 15, y - 30 * (spacer/25));
    vertex(x + 15, y - 50 * (spacer/25));
    vertex(x + 10, y - 40 * (spacer/25));
    bezierVertex( x + 10, y - 50 * (spacer/25), x - 10, y - 50 * (spacer/25), x - 10, y - 40 * (spacer/25));
    vertex(x - 15, y - 50 * (spacer/25));
    vertex(x - 15, y - 30 * (spacer/25));
    bezierVertex( x - 15, y - 15 * (spacer/25), x - 5, y, x, y);
    endShape();
     
    float b = 1;
    float c = 1;
    
     
    //Repeat body segments
    for(int a = 0; a < 4; a+=1){
      
      float x1 = x;
      float y1 = y;
      
      //Body Segment
      beginShape();
      vertex(x1, y1 - 30);
      bezierVertex(x1 + b*45, y1 - 30, x1 + b*45, y1 - 30, x1 + b*45, y1 - 70);
      bezierVertex(x1 + b*45, y1 - 80, x1 + b*45, y1 - 80, x1 + b*35, y1 - 80);
      vertex(x1 - b*35, y1 - 80);
      bezierVertex(x1 - b*45, y1 - 80, x1 - b*45, y1 - 80, x1 - b*45, y1 - 70);
      bezierVertex(x1 - b*45, y1 - 30, x1 - b*45, y1 - 30, x1, y1 - 30);
      endShape();
     
      //spacer determines space between segments
      y = y - spacer;     
      b = b*.9*c;
      c = c*1.05;    
      }
    
    
    float x2 = x;
    float y2 = y;
    
    //End Segment
    beginShape();
    vertex(x2, y2 - 30);
    bezierVertex(x2 + 45, y2 - 30, x2 + 45, y2 - 30, x2 + 45, y2 - 50);
    bezierVertex(x2 + 35, y2 - 80, x2 + 10, y2 - 80, x2     , y2 - 80);
    bezierVertex(x2 - 10, y2 - 80, x2 - 35, y2 - 80, x2 - 45, y2 - 50);
    bezierVertex(x2 - 45, y2 - 30, x2 - 45, y2 - 30, x2, y2 - 30);
    endShape();
     }
*/
/*

void armadillocentered( int x, int y) {
    //Armadillo centered on origin
    //Head
    translate(centerX, centerY);
    rotate(angle);
    beginShape();
    vertex(0, 0);
    bezierVertex( 5, 0 , 15, -15 * (spacer/25), 15, -30 * (spacer/25));
    vertex(15, -50 * (spacer/25));
    vertex(10, -40 * (spacer/25));
    bezierVertex( 10, -50 * (spacer/25), -10, -50 * (spacer/25), -10, -40 * (spacer/25));
    vertex(-15, -50 * (spacer/25));
    vertex(-15, -30 * (spacer/25));
    bezierVertex( -15, -15 * (spacer/25), -5, 0, 0, 0);
    endShape();
     
    float b = 1;
    float c = 1;
    x = 0;
    y = 0;
     
    //Repeat body segments
    for(int a = 0; a < 4; a+=1){
      
      float x1 = x;
      float y1 = y;
      
      //Body Segment
      beginShape();
      vertex(x1, y1 - 30);
      bezierVertex(x1 + b*45, y1 - 30, x1 + b*45, y1 - 30, x1 + b*45, y1 - 70);
      bezierVertex(x1 + b*45, y1 - 80, x1 + b*45, y1 - 80, x1 + b*35, y1 - 80);
      vertex(x1 - b*35, y1 - 80);
      bezierVertex(x1 - b*45, y1 - 80, x1 - b*45, y1 - 80, x1 - b*45, y1 - 70);
      bezierVertex(x1 - b*45, y1 - 30, x1 - b*45, y1 - 30, x1, y1 - 30);
      endShape();
     
      //spacer determines space between segments
      y = y - spacer;     
      b = b*.9*c;
      c = c*1.05;    
      }
    
    
    float x2 = x;
    float y2 = y;
    
    //End Segment
    beginShape();
    vertex(x2, y2 - 30);
    bezierVertex(x2 + 45, y2 - 30, x2 + 45, y2 - 30, x2 + 45, y2 - 50);
    bezierVertex(x2 + 35, y2 - 80, x2 + 10, y2 - 80, x2     , y2 - 80);
    bezierVertex(x2 - 10, y2 - 80, x2 - 35, y2 - 80, x2 - 45, y2 - 50);
    bezierVertex(x2 - 45, y2 - 30, x2 - 45, y2 - 30, x2, y2 - 30);
    endShape();
     }

*/
/*
    void movement( ) {
          
     //choose horizontal movement
     if(way1 == 1) {
     centerX = centerX + 1 * dirx * speed;
     steps = steps - 1;
     }
     
     //choose vertical movement
     if(way1 == 0) {
     centerY = centerY + 1 * diry * speed;
     steps = steps - 1;
     }
     
     //change diry horizontal
     if(centerX > (width - 100) || centerX < 100 ) {
       dirx = dirx * -1;
       }
       
       
    //change diry vertical
    if(centerY > (height - 20) || centerY < 200 ) {
      diry = diry * -1;
      }
    
    //change horizontal movement polarity  
    if(rev == 1 && way1 == 1) {
      dirx = dirx * -1;
    }
    
    //change vertical movement polarity 
    if(rev == 1 && way1 == 2) {
      diry = diry * -1;
    }
    
    
    if(steps < 1) {
      //steps determines number of translations
      steps = round(random(4,10));
      //way1 determines movement diry
      way1 = round(random(0,1));
      //rev determines whether translation changes polarity
      rev = round(random(0,1));
    }
    }
    
    
   */ 
    
////////CLASSES//////////////////////////////////////////////////////////////////////////////////////////

class Arma{
  int dirx = 1;    
  int diry = 1;
  int way1 = round(random(0,1));
  int steps = round(random(40,50));
  int spacer = 25;
  int x;
  int y;
  int speed = 1;
  int rev = 0;
  float area;
  
  
  Arma(int _speed, int _x, int _y, float _area) {
    speed = _speed;
    x = _x;
    y = _y;
    area = _area;
  }
  
  void armadillo() {
    //Armadillo with variable location on grid
    //Head
//    scale(area);
    
    noStroke();
    fill(0, 40);
    beginShape();
    vertex(x, y);
    bezierVertex( x + 5, y , x + 15, y - 15 * (spacer/25), x + 15, y - 30 * (spacer/25));
    vertex(x + 15, y - 50 * (spacer/25));
    vertex(x + 10, y - 40 * (spacer/25));
    bezierVertex( x + 10, y - 50 * (spacer/25), x - 10, y - 50 * (spacer/25), x - 10, y - 40 * (spacer/25));
    vertex(x - 15, y - 50 * (spacer/25));
    vertex(x - 15, y - 30 * (spacer/25));
    bezierVertex( x - 15, y - 15 * (spacer/25), x - 5, y, x, y);
    endShape();
     
    float b = 1;
    float c = 1;
    float x1 = x;
    float y1 = y;
     
    //Repeat body segments
    for(int a = 0; a < 4; a+=1){
      
      
      
      //Body Segment
      beginShape();
      vertex(x1, y1 - 30);
      bezierVertex(x1 + b*45, y1 - 30, x1 + b*45, y1 - 30, x1 + b*45, y1 - 70);
      bezierVertex(x1 + b*45, y1 - 80, x1 + b*45, y1 - 80, x1 + b*35, y1 - 80);
      vertex(x1 - b*35, y1 - 80);
      bezierVertex(x1 - b*45, y1 - 80, x1 - b*45, y1 - 80, x1 - b*45, y1 - 70);
      bezierVertex(x1 - b*45, y1 - 30, x1 - b*45, y1 - 30, x1, y1 - 30);
      endShape();
     
      //spacer determines space between segments
      y1 = y1 - spacer;     
      b = b*.9*c;
      c = c*1.05;    
      }
    
    
    float x2 = x;
    float y2 = y1;
    
    //End Segment
    beginShape();
    vertex(x2, y2 - 30);
    bezierVertex(x2 + 45, y2 - 30, x2 + 45, y2 - 30, x2 + 45, y2 - 50);
    bezierVertex(x2 + 35, y2 - 80, x2 + 10, y2 - 80, x2     , y2 - 80);
    bezierVertex(x2 - 10, y2 - 80, x2 - 35, y2 - 80, x2 - 45, y2 - 50);
    bezierVertex(x2 - 45, y2 - 30, x2 - 45, y2 - 30, x2, y2 - 30);
    endShape();
     }
  
  
  
  void armadillocentered() {
    //Armadillo centered on origin
    //Head
    translate(x, y);
//    rotate(angle);
    noStroke();
    fill(0, 40);
    beginShape();
    vertex(0, 0);
    bezierVertex( 5, 0 , 15, -15 * (spacer/25), 15, -30 * (spacer/25));
    vertex(15, -50 * (spacer/25));
    vertex(10, -40 * (spacer/25));
    bezierVertex( 10, -50 * (spacer/25), -10, -50 * (spacer/25), -10, -40 * (spacer/25));
    vertex(-15, -50 * (spacer/25));
    vertex(-15, -30 * (spacer/25));
    bezierVertex( -15, -15 * (spacer/25), -5, 0, 0, 0);
    endShape();
     
    float b = 1;
    float c = 1;
    x = 0;
    y = 0;
    float x1 = x;
    float y1 = y;
    
    //Repeat body segments
    for(int a = 0; a < 4; a+=1){
      
      
      
      //Body Segment
      beginShape();
      vertex(x1, y1 - 30);
      bezierVertex(x1 + b*45, y1 - 30, x1 + b*45, y1 - 30, x1 + b*45, y1 - 70);
      bezierVertex(x1 + b*45, y1 - 80, x1 + b*45, y1 - 80, x1 + b*35, y1 - 80);
      vertex(x1 - b*35, y1 - 80);
      bezierVertex(x1 - b*45, y1 - 80, x1 - b*45, y1 - 80, x1 - b*45, y1 - 70);
      bezierVertex(x1 - b*45, y1 - 30, x1 - b*45, y1 - 30, x1, y1 - 30);
      endShape();
     
      //spacer determines space between segments
      y1 = y1 - spacer;     
      b = b*.9*c;
      c = c*1.05;    
      }
    
    
    float x2 = x;
    float y2 = y1;
    
    //End Segment
    beginShape();
    vertex(x2, y2 - 30);
    bezierVertex(x2 + 45, y2 - 30, x2 + 45, y2 - 30, x2 + 45, y2 - 50);
    bezierVertex(x2 + 35, y2 - 80, x2 + 10, y2 - 80, x2     , y2 - 80);
    bezierVertex(x2 - 10, y2 - 80, x2 - 35, y2 - 80, x2 - 45, y2 - 50);
    bezierVertex(x2 - 45, y2 - 30, x2 - 45, y2 - 30, x2, y2 - 30);
    endShape();
     }
  
  
  
  void movement() {
          
     //choose horizontal movement
     if(way1 == 1) {
     x = x + 1 * dirx * speed;
     steps = steps - 1;
     }
     
     //choose vertical movement
     if(way1 == 0) {
     y = y + 1 * diry * speed;
     steps = steps - 1;
     }
     
     //change diry horizontal
     if(x > (width - 100) || x < 100 ) {
       dirx = dirx * -1;
       }
       
       
    //change diry vertical
    if(y > (height - 20) || y < 200 ) {
      diry = diry * -1;
      }
    
    //change horizontal movement polarity  
    if(rev == 1 && way1 == 1) {
      dirx = dirx * -1;
    }
    
    //change vertical movement polarity 
    if(rev == 1 && way1 == 2) {
      diry = diry * -1;
    }
    
    
    if(steps < 1) {
      //steps determines number of translations
      steps = round(random(4,10));
      //way1 determines movement diry
      way1 = round(random(0,1));
      //rev determines whether translation changes polarity
      rev = round(random(0,1));
    }
    
    
     if (mousePressed && (mouseButton == LEFT) && spacer > 10 && abs(mouseX-x) < 40 && abs(mouseY-y+100) < 100) {
    spacer = spacer - 4;
    } else if (spacer < 25) {
      spacer = spacer + 2;
    }
    
    if ((abs(mouseX - x) < 60) && abs(mouseY - (y - 100)) < 120) {
      speed = 15;
    } else if (mousePressed && (mouseButton == RIGHT)) {
      speed = 30;
    } else {
      speed = 1; 
    }
    
  }
  
  
  
  
  
}

