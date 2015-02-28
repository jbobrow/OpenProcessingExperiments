
//Look at when its above but going into the back of the paddle

class Ball{
  float x, y, r, m;
  int id;

  // default constructor
  Ball() {
  }
//m is mass
  Ball(float x, float y, float r, int _id) {
    this.x = x;
    this.y = y;
    this.r = r;
    m = r*.1;
    id=_id;
  }
  
  
  //check if ball hits paddles
  void paddleBounce(Paddle[] p, PVector[] v) {
    
    
    
    
    
    
    
    
    
    
    
    
    //////////////////////////////////////    ID ZERO LEFT   ///////////////////////////////////////////////
    //ball id zero going left
    if (id == 0 && v[1].x < 0) {
      
      for (int i = 0; i<4; i++) {
        
        //blue will hit blue
        if (p[i].id == 0) {
          
          
          //if ball is higher than paddle and in front of paddle
          if ((p[i].y - 60) > y && x > p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((x - p[i].x) - 10)) + (sq((p[i].y - y) - 60))));
            
            if (distance > 38.5 && distance < 62.5) {
              v[1].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[1].y > 0) {
                v[1].y *= -1;
                v[1].x -= 2;
              }
              else {
                v[1].y += -5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ballY is in between the paddle's top and bottom
          else if ((p[i].y - 60) <= y && (p[i].y + 60) >= y) {
            //pythagoras
            //10 in the equation is half the paddles width
            float distance = (x - p[i].x) - 10;
            
            if (distance > 38.5 && distance < 62.5) {
              v[1].x *= -1; 
              
            }
            //println(distance);
          }
          
          
          //if ball is lower than paddle and in front of paddle
          else if ((p[i].y + 60) < y && x > p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((x - p[i].x) - 10)) + (sq((y - p[i].y) - 60))));
            
            if (distance > 38.5 && distance < 62.5) {
              v[1].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[1].y < 0) {
                v[1].y *= -1;
                v[1].x -= 2;
              }
              else {
                v[1].y += 5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ball is above paddle
          else if (p[i].x > x && (p[i].y - 60) > y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (p[i].y - y) - 60;
            
            if (distance > 35 && distance < 62.5) {
              v[1].y = (v[1].y * -1) + 0.5; 
              v[1].x -= 0.5;
            }
            //println(distance);
          }
          
          
          
          //if ball is below paddle
          else if (p[i].x > x && (p[i].y + 60) < y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (y - p[i].y) - 60;
            
            if (distance > 35 && distance < 62.5) {
              v[1].y = (v[1].y * -1) + 0.5; 
              v[1].x -= 0.5;
            }
            //println(distance);
          }
          
          
          
        }
        
        
        
      }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ////////////////////////////////////////   ID ZERO RIGHT  /////////////////////////////////////////////////////////////
    //ball id zero going right
    else if (id == 0 && v[1].x > 0) {
      
      for (int i = 0; i<4; i++) {
        
        
        
        //blue will hit blue
        if (p[i].id == 3) {
          
          
          //if ball is higher than paddle and in front of paddle
          if ((p[i].y - 60) > y && x < p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((p[i].x - x) - 10)) + (sq((p[i].y - y) - 60))));
            
            if (distance > 38.5 && distance < 62.5) {
              v[1].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[1].y > 0) {
                v[1].y *= -1;
                v[1].x += 2;
              }
              else {
                v[1].y += -5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ballY is in between the paddle's top and bottom
          else if ((p[i].y - 60) <= y && (p[i].y + 60) >= y) {
            //pythagoras
            //10 in the equation is half the paddles width
            float distance = (p[i].x - x) - 10;
            
            if (distance > 38.5 && distance < 62.5) {
              v[1].x *= -1; 
              
            }
            //println(distance);
          }
          
          
          //if ball is lower than paddle and in front of paddle
          else if ((p[i].y + 60) < y && x < p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((p[i].x - x) - 10)) + (sq((y - p[i].y) - 60))));
            
            if (distance > 38.5 && distance < 62.5) {
              v[1].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[1].y < 0) {
                v[1].y *= -1;
                v[1].x += 2;
              }
              else {
                v[1].y += 5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ball is above paddle
          else if (p[i].x < x && (p[i].y - 60) > y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (p[i].y - y) - 60;
            
            if (distance > 35 && distance < 62.5) {
              v[1].y = (v[1].y * -1) + 0.5; 
              v[1].x += 0.5;
            }
            //println(distance);
          }
          
          
          
          //if ball is below paddle
          else if (p[i].x < x && (p[i].y + 60) < y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (y - p[i].y) - 60;
            
            if (distance > 35 && distance < 62.5) {
              v[1].y = (v[1].y * -1) + 0.5; 
              v[1].x += 0.5;
            }
            //println(distance);
          }
          
          
        }
        
        
      }
    }
    
    
    
    
    
    
    
    
    
      
    ///////////////////////////////////////   ID ONE LEFT  //////////////////////////////////////////////////////
    
    
    //ball id one going left
    if (id == 1 && v[0].x < 0) {
      
      for (int i = 0; i<4; i++) {
        
        
        
        //green will hit green
        if (p[i].id == 1) {
          
          
          //if ball is higher than paddle and in front of paddle
          if ((p[i].y - 60) > y && x > p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((x - p[i].x) - 10)) + (sq((p[i].y - y) - 60))));
            
            if (distance > 28.5 && distance < 52.5) {
              v[0].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[0].y > 0) {
                v[0].y *= -1;
                v[0].x -= 2;
              }
              else {
                v[0].y += -5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ballY is in between the paddle's top and bottom
          else if ((p[i].y - 60) <= y && (p[i].y + 60) >= y) {
            //pythagoras
            //10 in the equation is half the paddles width
            float distance = (x - p[i].x) - 10;
            
            if (distance > 28.5 && distance < 52.5) {
              v[0].x *= -1; 
              
            }
            //println(distance);
          }
          
          
          //if ball is lower than paddle and in front of paddle
          else if ((p[i].y + 60) < y && x > p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((x - p[i].x) - 10)) + (sq((y - p[i].y) - 60))));
            
            if (distance > 28.5 && distance < 52.5) {
              v[0].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[0].y < 0) {
                v[0].y *= -1;
                v[0].x -= 2;
              }
              else {
                v[0].y += 5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ball is above paddle
          else if (p[i].x > x && (p[i].y - 60) > y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (p[i].y - y) - 60;
            
            if (distance > 25 && distance < 52.5) {
              v[0].y = (v[0].y * -1) + 0.5; 
              v[0].x -= 0.5;
            }
            //println(distance);
          }
          
          
          
          //if ball is below paddle
          else if (p[i].x > x && (p[i].y + 60) < y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (y - p[i].y) - 60;
            
            if (distance > 25 && distance < 52.5) {
              v[0].y = (v[0].y * -1) + 0.5; 
              v[0].x -= 0.5;
            }
            //println(distance);
          }
          
          
          
        }
        
        
        
      }
    }
    
    
    
    
    
    
    
    
    
    
    ////////////////////////////////////////////   ID ONE RIGHT  /////////////////////////////////////////////////////////
    //ball id one going right
    else if (id == 1 && v[0].x > 0) {
      
      for (int i = 0; i<4; i++) {
        
        
        
        //green will hit green
        if (p[i].id == 2) {
          
          
          //if ball is higher than paddle and in front of paddle
          if ((p[i].y - 60) > y && x < p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((p[i].x - x) - 10)) + (sq((p[i].y - y) - 60))));
            
            if (distance > 28.5 && distance < 52.5) {
              v[0].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[0].y > 0) {
                v[0].y *= -1;
                v[0].x += 2;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ballY is in between the paddle's top and bottom
          else if ((p[i].y - 60) <= y && (p[i].y + 60) >= y) {
            //pythagoras
            //10 in the equation is half the paddles width
            float distance = (p[i].x - x) - 10;
            
            if (distance > 28.5 && distance < 52.5) {
              v[0].x *= -1; 
              
            }
            //println(distance);
          }
          
          
          //if ball is lower than paddle and in front of paddle
          else if ((p[i].y + 60) < y && x < p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((p[i].x - x) - 10)) + (sq((y - p[i].y) - 60))));
            
            if (distance > 28.5 && distance < 52.5) {
              v[0].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[0].y < 0) {
                v[0].y *= -1;
                v[0].x += 2;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ball is above paddle
          else if (p[i].x < x && (p[i].y - 60) > y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (p[i].y - y) - 60;
            
            if (distance > 25 && distance < 52.5) {
              v[0].y = (v[0].y * -1) + 0.5; 
              v[0].x += 0.5;
            }
            //println(distance);
          }
          
          
          
          //if ball is below paddle
          else if (p[i].x < x && (p[i].y + 60) < y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (y - p[i].y) - 60;
            
            if (distance > 25 && distance < 52.5) {
              v[0].y = (v[0].y * -1) + 0.5; 
              v[0].x += 0.5;
            }
            //println(distance);
          }
          
          
        }
      }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    ////////////////////////////////////////////   ID TWO LEFT  /////////////////////////////////////////////////////////
    //ball id two going left
    if (id == 2 && v[2].x < 0) {
            
      for (int i = 0; i<4; i++) {
        
        //blue will hit white
        if (p[i].id == 0) {
          
          
          //if ball is higher than paddle and in front of paddle
          if ((p[i].y - 60) > y && x > p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((x - p[i].x) - 10)) + (sq((p[i].y - y) - 60))));
            
            if (distance > 13.5 && distance < 22.5) {
              v[2].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[2].y > 0) {
                v[2].y *= -1;
                v[2].x -= 2;
              }
              else {
                v[2].y += -5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ballY is in between the paddle's top and bottom
          else if ((p[i].y - 60) <= y && (p[i].y + 60) >= y) {
            //pythagoras
            //10 in the equation is half the paddles width
            float distance = (x - p[i].x) - 10;
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
            }
            //println(distance);
          }
          
          
          //if ball is lower than paddle and in front of paddle
          else if ((p[i].y + 60) < y && x > p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((x - p[i].x) - 10)) + (sq((y - p[i].y) - 60))));
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[2].y < 0) {
                v[2].y *= -1;
                v[2].x -= 2;
              }
              else {
                v[2].y += 5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ball is above paddle
          else if (p[i].x > x && (p[i].y - 60) > y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (p[i].y - y) - 60;
            
            if (distance > 1 && distance < 22.5) {
              v[2].y = (v[2].y * -1) + 0.5; 
              v[2].x -= 0.5;
            }
            //println(distance);
          }
          
          
          
          //if ball is below paddle
          else if (p[i].x > x && (p[i].y + 60) < y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (y - p[i].y) - 60;
            
            if (distance > 1 && distance < 22.5) {
              v[2].y = (v[2].y * -1) + 0.5; 
              v[2].x -= 0.5;
            }
            //println(distance);
          }
          
        }
        
        
        
        //green will hit white
        if (p[i].id == 1) {
          
          
          //if ball is higher than paddle and in front of paddle
          if ((p[i].y - 60) > y && x > p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((x - p[i].x) - 10)) + (sq((p[i].y - y) - 60))));
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[2].y > 0) {
                v[2].y *= -1;
                v[2].x -= 2;
              }
              else {
                v[2].y += -5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ballY is in between the paddle's top and bottom
          else if ((p[i].y - 60) <= y && (p[i].y + 60) >= y) {
            //pythagoras
            //10 in the equation is half the paddles width
            float distance = (x - p[i].x) - 10;
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
            }
            //println(distance);
          }
          
          
          //if ball is lower than paddle and in front of paddle
          else if ((p[i].y + 60) < y && x > p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((x - p[i].x) - 10)) + (sq((y - p[i].y) - 60))));
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[2].y < 0) {
                v[2].y *= -1;
                v[2].x -= 2;
              }
              else {
                v[2].y += 5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ball is above paddle
          else if (p[i].x > x && (p[i].y - 60) > y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (p[i].y - y) - 60;
            
            if (distance > 1 && distance < 22.5) {
              v[2].y = (v[1].y * -1) + 0.5; 
              v[2].x -= 0.5;
            }
            //println(distance);
          }
          
          
          
          //if ball is below paddle
          else if (p[i].x > x && (p[i].y + 60) < y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (y - p[i].y) - 60;
            
            if (distance > 1 && distance < 22.5) {
              v[2].y = (v[2].y * -1) + 0.5; 
              v[2].x -= 0.5;
            }
            //println(distance);
          }
           
        } 
      }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    ////////////////////////////////////////   ID TWO RIGHT  /////////////////////////////////////////////////////////////
    //ball id zero going right
    else if (id == 2 && v[2].x > 0) {
      
      for (int i = 0; i<4; i++) {
        
        
        
        //blue will hit white
        if (p[i].id == 3) {
          
          
          //if ball is higher than paddle and in front of paddle
          if ((p[i].y - 60) > y && x < p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((p[i].x - x) - 10)) + (sq((p[i].y - y) - 60))));
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[2].y > 0) {
                v[2].y *= -1;
                v[2].x += 2;
              }
              else {
                v[2].y += -5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ballY is in between the paddle's top and bottom
          else if ((p[i].y - 60) <= y && (p[i].y + 60) >= y) {
            //pythagoras
            //10 in the equation is half the paddles width
            float distance = (p[i].x - x) - 10;
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
            }
            //println(distance);
          }
          
          
          //if ball is lower than paddle and in front of paddle
          else if ((p[i].y + 60) < y && x < p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((p[i].x - x) - 10)) + (sq((y - p[i].y) - 60))));
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[2].y < 0) {
                v[2].y *= -1;
                v[2].x += 2;
              }
              else {
                v[2].y += 5;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ball is above paddle
          else if (p[i].x < x && (p[i].y - 60) > y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (p[i].y - y) - 60;
            
            if (distance > 1 && distance < 22.5) {
              v[2].y = (v[2].y * -1) + 0.5; 
              v[2].x += 0.5;
            }
            //println(distance);
          }
          
          
          
          //if ball is below paddle
          else if (p[i].x < x && (p[i].y + 60) < y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (y - p[i].y) - 60;
            
            if (distance > 1 && distance < 22.5) {
              v[2].y = (v[2].y * -1) + 0.5; 
              v[2].x += 0.5;
            }
            //println(distance);
          }
        } 
        
        
        
        //green will hit white
        if (p[i].id == 2) {
          
          
          //if ball is higher than paddle and in front of paddle
          if ((p[i].y - 60) > y && x < p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((p[i].x - x) - 10)) + (sq((p[i].y - y) - 60))));
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[2].y > 0) {
                v[2].y *= -1;
                v[2].x += 2;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ballY is in between the paddle's top and bottom
          else if ((p[i].y - 60) <= y && (p[i].y + 60) >= y) {
            //pythagoras
            //10 in the equation is half the paddles width
            float distance = (p[i].x - x) - 10;
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
            }
            //println(distance);
          }
          
          
          //if ball is lower than paddle and in front of paddle
          else if ((p[i].y + 60) < y && x < p[i].x) {
            //pythagoras
            //10 in the equation is half the paddles width
            //60 in the equation is half the paddles height
            float distance = ( sqrt( (sq((p[i].x - x) - 10)) + (sq((y - p[i].y) - 60))));
            
            if (distance > 4.5 && distance < 22.5) {
              v[2].x *= -1; 
              
              /////////////////////// REDO BOUNCING FOR Y /////////////////////////////////
              if (v[2].y < 0) {
                v[2].y *= -1;
                v[2].x += 2;
              }
              
            }
            //println(distance);
          }
          
          
          
          //if ball is above paddle
          else if (p[i].x < x && (p[i].y - 60) > y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (p[i].y - y) - 60;
            
            if (distance > 1 && distance < 22.5) {
              v[2].y = (v[2].y * -1) + 0.5; 
              v[2].x += 0.5;
            }
            //println(distance);
          }
          
          
          
          //if ball is below paddle
          else if (p[i].x < x && (p[i].y + 60) < y) {
            //pythagoras
            //60 in the equation is half the paddles height
            float distance = (y - p[i].y) - 60;
            
            if (distance > 1 && distance < 22.5) {
              v[2].y = (v[2].y * -1) + 0.5; 
              v[2].x += 0.5;
            }
            //println(distance);
          }
          
          
        }
      }
    }
    
    
  }

}



