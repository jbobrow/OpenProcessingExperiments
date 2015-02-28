
/*
 *Author: Cliff Simmons
 * Title: Medusozoa
 * Class: DMA 28 | Winter 2011
 */

//PHASE 0 _ Initialize necessary variables
    float centerx;
    float centery;
      int counter;
  boolean customtime;
    PFont datafont;
    float dexpansionsec;
    float dexpansionmin;
    float dexpansionhor;
  boolean displaydata = false;
    float easing = .25;
      int engine;
    float expansionsec;
    float expansionmin;
    float expansionhor;
      int hourdecrement;
    float letterheight = 48.071;
    float letterkerning = 7.286;
    float letterverticalcavity = 0;
    float letterweight = .5;
    float letterwidth = 4.22525;
    float millisecond;
    float milliseconddelta;
      int mode = 0;
    float modetimer;
    float mousePastX;
    float mousePastY;
     long now;
   String nowmonthyear;
   String nowtimeday;
    float then;
      int thensec;
     long thenmillisecond;
      int thenmin;
      int thenhor;
   String thenmonthyear;
   String thentimeday;
  boolean onopenprocessing = true;
      int pastmilli;
  boolean ready = false;
    float radius = 320;
    float ringsec;
    float ringmin;
    float ringhor;
      
      
//PHASE 1 - Setup Canvas
          void setup()
          {
              size(640,480);
              colorMode(HSB,360,100,100);
              datafont = createFont("HELVETICA", 14);
              textFont(datafont);
              smooth();
          }

//PHASE 2 - Run
          void draw()
          {
              
              //ZEROETH STEP - UPDATE VARIABLES
              centerx = width/2;
              centery = height/2;
              
              //FIRST STEP
              background(0);
              
              //SECOND STEP – CALLIBRATE ENGINE TO TIME (IN ORDER TO DODGE THE FLUXING OF THE PROGRAM'S FRAMERATE)
              if(now!=millis()) now = millis();
                  
              if(thensec!=second()) 
              {    
                  thenmillisecond = now;
                  thensec = second();
              }
              
              millisecond = now - thenmillisecond;
              milliseconddelta = millisecond + 1000*second();
                
              //THIRD STEP - DESIGN ANALOG CLOCK
              /*-------------SECONDS---*/
              ringsec = (millisecond/1000)*25 + 125;
              dexpansionsec = ringsec - expansionsec;
              expansionsec += dexpansionsec*easing;
              
              fill(185,25,100);
              ellipse(centerx,centery,expansionsec,expansionsec);
              
              fill(0,0,0);
              ellipse(centerx,centery,125,125);
              
              //fill(0,0,100,.5*255);
              //ellipse(centerx + (125/2.0 + 25*(1.0/3.0))*cos((milliseconddelta/1000.00)*(2 + 1.0/60.0)*PI), centery + (125/2.0 + 25*(1.0/3.0))*sin((milliseconddelta/1000.00)*(2 + 1.0/60.0)*PI), 4, 4);
              //ellipse(centerx + (125/2.0 + 25*(2.0/3.0))*cos((-milliseconddelta/1000.00)*(2 + 1.0/60.0)*PI), centery + (125/2.0 + 25*(2.0/3.0))*sin((-milliseconddelta/1000.00)*(2 + 1.0/60.0)*PI), 4, 4);
              
              /*-------------MINUTES---*/
              ringmin = (second()/59.00)*25 + 100;
              dexpansionmin = ringmin - expansionmin;
              expansionmin += dexpansionmin*easing;
              
              fill(185,25,100);
              ellipse(centerx,centery,expansionmin,expansionmin);
              
              fill(0,0,0);
              pushMatrix();
                  translate(centerx,centery);
                  rotate(.001*now);
                  ellipse(0,0,101,100);
              popMatrix();
              
              /*-------------HOURS---*/
              
              if(hour()>=12) hourdecrement = 12;
              else hourdecrement = 0;
              ringhor = ((hour()-hourdecrement)/12.00)*25 + 75;
              dexpansionhor = ringhor - expansionhor;
              expansionhor += dexpansionhor*easing;
              
              fill(185,25,100);
              ellipse(centerx,centery,expansionhor,expansionhor);
              
              fill(0,0,0);
              pushMatrix();
                  translate(centerx,centery);
                  rotate(-.0001*now);
                  ellipse(0,0,76,75);
              popMatrix();
              
              /*-------------3RD RING-*/
              
              fill(0,0,100);
              ellipse(centerx,centery,50,50);
              
              fill(0,0,0);
              pushMatrix();
                  translate(centerx,centery);
                  rotate(.0002*now);
                  ellipse(0,0,51,50);
              popMatrix();
              
              /*-------------2RD RING-*/
              
              fill(0,0,100);
              ellipse(centerx,centery,45,45);
              
              fill(0,0,0);
              pushMatrix();
                  translate(centerx,centery);
                  rotate(-.0001*now + .5*PI);
                  ellipse(0,0,46,45);
              popMatrix();
              
              /*-------------2RD RING-*/
              
              fill(0,0,100);
              ellipse(centerx,centery,40,40);
              
              fill(0,0,0);
              pushMatrix();
                  translate(centerx,centery);
                  rotate(.001*now);
                  ellipse(0,0,41,40);
              popMatrix();
              
              
              
              //FOURTH STEP - DESIGN DIGITAL DISPLAY
              
              //THIRD STEP - MODE
              if(mousePastX!=mouseX || mousePastY!=mouseY)
              {
                  mode = 1;
                  modetimer = now;
                  then = now;
                  mousePastX = mouseX;
                  mousePastY = mouseY;
              }
              if((now - modetimer)>=3000)
              {
                  mode = 0; 
                  then = now;
              }
              
              //FOURTH STEP - BEHAVIOR
              if(mode==1)
              {
                  if(now<=(then+1000)) radius = 320*(1-((now-then)/1000));
              }
              else if(mode==0)
              {
                  if(now<=(then+1000)) radius = 320*((now-then)/1000);
              }
              
              
              //DISPLAY UNITS
//             for(int i = 0;i<60;i++)
//             {
//                  fill(0,0,50,.5*255);
//                  stroke(0,0,50,.5*255);
//                  strokeWeight(1);
//                  pushMatrix();
//                      translate(centerx,centery);
//                      rotate(i*(2.0/60.0)*PI);
//                      line(37+radius,0,63 + 37 + radius,0);
//                      //if(i%5.0==0) text((i/5)+"/"+i,100,-6);
//                  popMatrix();
//             }
              
              
              //FINAL STEP
              
              //MODIFICATIONS
              if(onopenprocessing==true)
              {
                  if(now<duration(2))
                  {
                     fill(0,0,100,255);
                     rect(-5,-5,width+5,height+5);
                  }
                  else if(now>=duration(2) && now<=duration(5))
                  {
                     fill(0,0,100,((duration(5-2+2) - now)/duration(5-2))*255);
                     rect(-5,-5,width+5,height+5);
                  }
             }
             
             if(displaydata==true)
             {
                 noStroke();
                 fill(.24*255,.25*255);
                 rect(width-150,-5,150,height+5);
                 fill(255);
                 text("\nSKETCH DATA:\n\nnow: "+now+"\n\nmilliseconds: "+millisecond+"\n        seconds: "+second()+"\n         minutes: "+minute()+"\n              hours: "+hour()+"\n\n test data: "+milliseconddelta+"\n\nmode: "+mode, 
                       width-140,
                       15);   
              }
          }   
    
//PHASE 3 – Define functions
     void stylize(char letter, int block, float letterweight, float letterverticlecavity, float letterheight, float letterwidth, float letterkerning, float distance, String alignment)
          {   
          int direction;
        float leftmargin = 13.183;
        float rightmargin = leftmargin - letterkerning;
        float startingpoint;
            
              if(block%2==0)direction = -1;
              else direction = 1;
              
              if(alignment=="left") startingpoint = leftmargin + (block*(letterwidth+letterkerning));
              else startingpoint = width - rightmargin - ((7-block)*(letterwidth+letterkerning));
              
              if(letter==' ')
              {
              }
              else if(letter=='a'||letter=='A')
              {
                   line(startingpoint,centery-(letterheight/2),startingpoint,centery+(letterheight/2));    
              }
              else if(letter=='b'||letter=='B')
              {
              }
              else if(letter=='c'||letter=='C')
              {
              }
              else if(letter=='d'||letter=='D')
              {
              }
              else if(letter=='e'||letter=='E')
              {
              }
              else if(letter=='f'||letter=='F')
              {
              }
              else if(letter=='g'||letter=='G')
              {
              }
              else if(letter=='h'||letter=='H')
              {
              }
              else if(letter=='i'||letter=='I')
              {
              }
              else if(letter=='j'||letter=='J')
              {
              }
              else if(letter=='k'||letter=='K')
              {
              }
              else if(letter=='l'||letter=='L')
              {
              }
              else if(letter=='m'||letter=='M')
              {
              }
              else if(letter=='n'||letter=='N')
              {
              }
              else if(letter=='o'||letter=='O')
              {
              }
              else if(letter=='p'||letter=='P')
              {
              }
              else if(letter=='q'||letter=='Q')
              {
              }
              else if(letter=='r'||letter=='R')
              {
              }
              else if(letter=='s'||letter=='S')
              {
              }
              else if(letter=='t'||letter=='T')
              {
              }
              else if(letter=='u'||letter=='U')
              {
              }
              else if(letter=='v'||letter=='V')
              {
              }
              else if(letter=='w'||letter=='W')
              {
              }
              else if(letter=='x'||letter=='X')
              {
              }
              else if(letter=='y'||letter=='Y')
              {
              }
              else if(letter=='z'||letter=='Z')
              {
              }
              else if(letter=='0')
              {
              }
              else if(letter=='1')
              {
              }
              else if(letter=='2')
              {
              }
              else if(letter=='3')
              {
              }
              else if(letter=='4')
              {
              }
              else if(letter=='5')
              {
              }
              else if(letter=='6')
              {
              }
              else if(letter=='7')
              {
              }
              else if(letter=='8')
              {
              }
              else if(letter=='9')
              {
              }
          }
     
    float duration(float amount) // converts seconds to milliseconds
          {
              float time;    
              time = 1000*amount;
              return time;
          }
          

