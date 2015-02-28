
//.......TITLE:      Structural Fluctuations, #4, Part 4, Epilog
//.......COURSE:     GENERATIVES DESIGN (course work)
//.......AUTHOR:     Dennis Boeck - MT6
//.......SEMESTER:   SS 2010
//.......STUDENT-ID: mt0315bd

color c;
int i, x1, y1, x2, y2;
int iteration;
float h;//veränderender Parameter1
float theta = 2f*PI/iteration;
float k;//verändernder Parameter2
float fp;//Farbe Satelliten Punkte;
color hs; //Hintergrundstern
int hs2; //Farbchaot1
int hs3; //Farbchaot2
int hs4; //Farbchaot3
////////////////////////////////////////////////////////////////////////////////////


void setup()
{
  size(1200, 700, P2D);
  //noStroke();
  //rectMode(CENTER);
  //colorMode(HSB);
  smooth();
  background(0);
   frameRate(40);
}


////////////////////////////////////////////////////////////////////////////////////

void draw(){
{
  
  translate(width/2, height/2);
  x1 = (int) random(width/2);
  y1 = (int) random(height/200);
  x2 = (int) random(width/2);
  y2 = (int) random(height/200);
  c = color( (int) random(25), (int) random(255), (int) random(30*k), (int) random(8));
  float entscheidung = random(1);
  hs = color(0, 0, 10,0);
  hs2 = 1;
  hs3 = 0;
  hs4 = -220;
 
              /////////////////////////////////////////////////////////////////
                if(entscheidung > 0.125)
                {
                     stroke(c);//c schönes ergebnis; h, x1 x2 y1 y2 heftig
                     noFill();
                  }
               else
                  {
                     stroke(25 * sin (h), 10, h/2, 100);//sehr heftig mit h; easy mit c
                     noFill();
                  }
                ///////////////////////////////////////////////////////////////
                for (h=0 ; h<50 ; h++);
                {
                h= log (5*h);
                }
 
                ///////////////////////////////////////////////////////////////
 
                int j = (int) random(4);
                iteration = (int) pow(3, j);
  
                
                /////////////////////////////////////////////////////////////////
                for( i=0 ; i < iteration; i++)
                {
                curve(40, 40, 80, 60, 100, 100, 60, 120);
                curve(x1, 40, y2, y1, 100, x2, 60, y2);
                  noFill();
                  rotate(2f*PI/iteration);
                  
                    
                    
                    //////////////////////////////////////////////
                    for ( k=0 ; k < 350 ; k++);
                    {
                    //rotate(2*PI/3.0);
                    beginShape();
                      vertex(k, k/2); // first point
                      bezierVertex(2*k, 25, 10*k, 50, 5*k,sin (k));
                      bezierVertex(log (k), 100, log (-k), 100, 10, 10);
                    endShape();
              
                    rotate(PI/4.0);
                    rect(0, 0, 30, 30);
                    rotate(PI/2.0);
               
              ////////////////////////////////////////////////
              if(mousePressed) {
              c = hs;
              h=random(5*h);
              hs2 = hs;
              hs3 = hs4;
              //stroke(255);
              } else {
                c=c;
                h=h;
              }
              ////////////////////////////////////////////////                   
                                 
                                 
                                 
                                 
                                  for( fp=0 ; fp > 20; i++);
                                  {
                                  ellipse(252, fp, 8, 5);
                                  fill(c, 5*h, 20, 5);
                      pushMatrix();
                                  translate(40, 40);
                                  rotate(2*PI/3.0);
                                            //ellipse(100, 50, 5, 5); 
                                            //fill(fp, fp/2, fp);
                                            //ellipse(45, 2, 8, 5);/
               
                                  ellipse(x1/2, x1, 80, 80);  // SternRot im Hintergrund
                                   //fill(255, 200, fp);
                                  //ellipse(h*125, x2, 2, 5); 
                                  translate(width/2, height/2);
                                  rotate(PI/1.0);
                         
                         
                         
                                 fill(random(240), random(20), 0);
                                  //ellipse(60, 40, 8, 5);//innere Satelliten
                                  rect(random(400), 4, 3, 2);//innere Satelliten
                                 fill(248, 252, 10); 
                                  rect(random(410), 8, 3, 2);//innere Satelliten
                                  rect(random(400), 8, 3, 2);//innere Satelliten
                                 fill(random(248), (random(255)-160), 10);
                                  rect(random(380), 8, 3, 2);//innere Satelliten
                                 fill(240, 150, 20); 
                                  //ellipse(100, 50, 15, 10); // mittlere Satelliten
                                
                                
                                 fill(240+hs3, random(200), 10-hs3, 200);//aussen Satelliten
                                  ellipse(240, 8, 10, 10);
                                   
                                   fill(240, mouseX, 10+hs3, mouseY);//aussen Satelliten
                                     ellipse(252, fp, 8, 5);

             /////////////////////////////////////////////////////////////////////////////       
              if (mousePressed && (mouseButton == LEFT)) {
                    c = hs;
                    h=random(5*h);
                    hs2 = hs;
                    hs3 = -255;
                    hs4 = 0;
              }           
              else if (mousePressed && (mouseButton == RIGHT)) {
                    setup();
              }           
              else {
                     c=c;
                      h=h;  
                    }
              
               //////////////////////////////////////////////////////////////////////////////              
              
              
              
              	             

           
                             fill(255+hs3, random(204+hs3),hs4);
                               triangle(mouseX/1.6, 3,height/30, mouseX/80, mouseY/10, 1);
                             //fill(255+hs3, random(mouseY-50),hs4);
                                //triangle(mouseX/2, 28,height/30, mouseY/80, mouseY/10, 1);
                               //triangle(height/30,mouseX/30, 3, 8, mouseY/8,mouseY/8);
              
              
                              int inverseX = width/10-mouseX;
                              int inverseY = height/10-mouseY;
                              //ellipse(inverseX*12, height/10, random(inverseX/20), random(inverseY/20));
                              //ellipse(inverseX*12,  random(inverseX/20), height/10,random(inverseY/20));
                              
                              ellipse(252, 8, 10, 10);
                           
                           
                           
                              fill(240, random(200), 10, 200);//aussen Satelliten
                              rotate(PI/4);
                              ellipse(252, 8, 7, 8);
                              noFill();
                              //stroke(0);
                              bezier(50, 75, 25, 25, random(125), 25, x1, 75);
              
                popMatrix();
                } 
              
              
              beginShape();
              vertex(30, 70); // first point
              bezierVertex(25, 25*k, 67, 50, 50, 100);
              bezierVertex(200, 100, 50, 25, x1*h, y1/8);
              endShape();
              
              
                // Zeichnet die Satelliten Punkte
              
                 for( fp=0 ; fp > 20; i++);{
                  fill(c, 5*h, 20, 5);
                  pushMatrix();
                 
                        ellipse(x1/2, x1, 80, 80);  // Rot im Hintergrund x2-Wolke x1-Stern
                         //fill(255, 200, fp);
                        //ellipse(h*125, x2, 2, 5); 
                        fill(240,random (200*hs2), 10);
                              ellipse(random(60) ,40, 8, 5);//innere Satelliten
                              ellipse(random(60) ,60, random(8), sin (h));//innere Satelliten
                              fill(random(240*hs2), 0, 0);
                             rotateX(-PI/3.0);
                             translate(7, 100);
                              ellipse(random(60) ,40, random(8), 5);//innere Satelliten
                             fill (c);//(240, 150, 20); 
                              
                          noFill();
    
                          bezier(50, 75, 25, 25, 125, 25, x1, 75);
              
                    popMatrix();
                
                
                
                 }   
              beginShape();
                 vertex(10, 20); 
                bezierVertex(50, 50, 10, 25, 2*k, 10);
                //bezierVertex(10, 20, 10, 20, 60, 60);
              endShape();
              
              rotate((0.5f*PI*(log (k))/iteration*2)*8);
                }
       }
    }
}

////////////////////////////////////////////////////////////////////////////////////////





