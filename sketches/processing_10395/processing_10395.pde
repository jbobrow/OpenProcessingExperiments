
void setup(){
  size(600,600);
  smooth();
  frameRate(60);
}

void draw(){
  
  background(0);
  translate(mouseX,mouseY);
   

    pushMatrix();
    pushStyle();
      strokeWeight(5);
      stroke(255);
      rotate( frameCount*1.01 );    
    
      ellipse( 70,0, 10, 10 );   
      ellipse( 67,20, 10, 10 );
      ellipse( 57,40, 10, 10 );
             pushMatrix();
             pushStyle();
             strokeWeight(1);
              if (mousePressed ==true){
                rotate( frameCount*1.01 );      
                line(50,50,random(width),random(height));
                line(50,50,random(width),random(height));
                line(50,50,random(width),random(height));
                line(100,100,random(width),random(height));
                line(100,100,random(width),random(height));
                line(100,100,random(width),random(height));
              }
             popStyle();
             popMatrix();
        
    popStyle();
    popMatrix();
    
        pushMatrix();
        pushStyle();
          noStroke();
          fill(255);
          triangle(-25, -20, -25, -10, -10, -15); 
          triangle(25, -20, 25, -10, 10, -15);
         
          fill(0); 
          ellipse(-20,-15,7,9);
          ellipse(20,-15,7,9);
   

        popStyle();
        popMatrix();

   Mund(15,5);
}


void Mund (int x, int y){
  translate(x,y); 
  fill(255);
  beginShape();
            vertex( -42.0 , -1.0 );
            bezierVertex( -42.0 , -1.0 , -39.0 , 10.0 , -39.0 , 15.0 );
            bezierVertex( -39.0 , 15.0 , -38.0 , -7.0 , -32.0 , 6.0 );
            bezierVertex( -32.0 , 6.0 , -26.0 , 10.0 , -26.0 , 26.0 );
            bezierVertex( -26.0 , 26.0 , -21.0 , 1.0 , -18.0 , 16.0 );
            bezierVertex( -18.0 , 16.0 , -14.0 , 22.0 , -14.0 , 26.0 );
            bezierVertex( -14.0 , 26.0 , -9.0 , 2.0 , -4.0 , 8.0 );
            bezierVertex( -4.0 , 8.0 , 9.0 , 17.0 , 5.0 , 20.0 );
            bezierVertex( 5.0 , 20.0 , 9.0 , -3.0 , 14.0 , 0.0 );
            bezierVertex( 14.0 , 0.0 , -26.0 , 23.0 , -42.0 , -4.0 );
          endShape();
          
}

