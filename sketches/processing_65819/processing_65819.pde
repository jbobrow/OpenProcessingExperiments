
class Robot
          {
            int x;
            int y;
            float s;
            int er;
        
            Robot(int x_in, int y_in, float s_in, int er_in)
                                                            {
                                                              //internal variables
                                                              x = x_in;
                                                              y = y_in;
                                                              s = s_in;
                                                              er = er_in;
                                                            }
        
            void display()
                          {
                             pushMatrix();
                             translate (x, y);
                             scale (s);
                             
                             //ears            
                             fill(0, 118, 163); ellipse (240, 60, 100, 100); ellipse (360, 60, 100, 100);
                             //face              
                             rectMode(CENTER); fill(25, 149, 195); rect (300, 70, 200, 100);
                             //left eye
                             fill(255);  ellipse (225, 50, er, er);  
                             fill(25, 149, 195);   ellipse (225, 50, er*0.25, er*0.25);
                             //right eye             
                             fill(255);            ellipse (375, 50, er, er);  
                             fill(25, 149, 195);   ellipse (375, 50, er*0.25, er*0.25);
                             //lips              
                             stroke(255); line (width/2-75, 100, width/2+75, 100);
                             //body               
                             rectMode(CENTER); fill(0, 118, 163); noStroke();
                             rect (300, 175, 400, 100);
                         
                             popMatrix();      
                         }      
          }      

