
/*
 * Author: Cliff Simmons
 *  Title: Omni 
 * Course: DMA 28 | Winter 2011
 */

//PHASE 0 – Initialize classes and primary variables.

      int nowtime = 0;
      int thentime = 0;
      int stilltime = 0;
      int counter = 0;
      int seconds = 0;
      int pastsecond = second();
      int mousecounter = 0;
    float fadetime = 3; // in seconds
      int displaydata = 0;
    PFont myFont;
      int datawidth  = 150;
   String time = "";
   PImage particle;
   
    float activitymode = 3; // 1:particle mode, 2: transform to 3, 3: eye mode, 3.5: eyes switch qadrants, 4:transform to 1
    float referencepointx = width/4;
    float referencepointy = height/4;
    float pastreferencepointx;
    float pastreferencepointy;
    float displacementx;
    float displacementy;
    float move;
    
    float expansion;
    float acceleration;
    float flipx;
    float flipy;
    
    float referencepointz = height/4;
    float eyeradius;
    float eyedistance;
      int quadrantmode = 1;
    float quadrantx = 0;
    float quadranty = 0;
    float fearfactorx = 0;
    float fearfactory = 0;
    float lefteyeposx = 0;
    float lefteyeposy = 0;
    float lefteyeposz = 0;
    float righteyeposx = 0;
    float righteyeposy = 0;
    float righteyeposz = 0;
    float lefteyeroty = 0;
    float lefteyerotx = 0;
    float righteyeroty = 0;
    float righteyerotx = 0;
    float mousepastx;
    float mousepasty;
    
    float wavelength = 1;//in seconds
    float frequency = 7;//in seconds
    float hinderance = (.25)*wavelength;//in seconds
    float hueue = 255;
    
      int switchQuadrant(int tempquadrantmode)
          {
              int quadrantmode = 0;
              while (quadrantmode == 0 || quadrantmode==tempquadrantmode)
              {
                  quadrantmode = floor(random(1,5));
              }
              return quadrantmode;
          }
    
    //LEFT EYE
    /*--ASICKLE--*/
    EyeParticle LA01;
    EyeParticle LA02;
    EyeParticle LA03;
    EyeParticle LA04;
    EyeParticle LA05;
    EyeParticle LA06;
    EyeParticle LA07;
    EyeParticle LA08;
    
    
    /*--BSICKLE--*/
    EyeParticle LB02;
    EyeParticle LB03;
    EyeParticle LB04;
    EyeParticle LB05;
    EyeParticle LB06;
    EyeParticle LB07;
    
    /*--CSICKLE--*/
    EyeParticle LC02;
    EyeParticle LC03;
    EyeParticle LC04;
    EyeParticle LC05;
    EyeParticle LC06;
    EyeParticle LC07;
    
    /*--DSICKLE--*/
    EyeParticle LD02;
    EyeParticle LD03;
    EyeParticle LD04;
    EyeParticle LD05;
    EyeParticle LD06;
    EyeParticle LD07;
    
    /*--ESICKLE--*/
    EyeParticle LE02;
    EyeParticle LE03;
    EyeParticle LE04;
    EyeParticle LE05;
    EyeParticle LE06;
    EyeParticle LE07;
    
    /*--FSICKLE--*/
    EyeParticle LF02;
    EyeParticle LF03;
    EyeParticle LF04;
    EyeParticle LF05;
    EyeParticle LF06;
    EyeParticle LF07;
    
    /*--GSICKLE--*/
    EyeParticle LG02;
    EyeParticle LG03;
    EyeParticle LG04;
    EyeParticle LG05;
    EyeParticle LG06;
    EyeParticle LG07;
    
    /*--HSICKLE--*/
    EyeParticle LH02;
    EyeParticle LH03;
    EyeParticle LH04;
    EyeParticle LH05;
    EyeParticle LH06;
    EyeParticle LH07;
    
    /*--ISICKLE--*/
    EyeParticle LI02;
    EyeParticle LI03;
    EyeParticle LI04;
    EyeParticle LI05;
    EyeParticle LI06;
    EyeParticle LI07;
    
    /*--JSICKLE--*/
    EyeParticle LJ02;
    EyeParticle LJ03;
    EyeParticle LJ04;
    EyeParticle LJ05;
    EyeParticle LJ06;
    EyeParticle LJ07;
    
    /*--KSICKLE--*/
    EyeParticle LK02;
    EyeParticle LK03;
    EyeParticle LK04;
    EyeParticle LK05;
    EyeParticle LK06;
    EyeParticle LK07;
    
    /*--LSICKLE--*/
    EyeParticle LL02;
    EyeParticle LL03;
    EyeParticle LL04;
    EyeParticle LL05;
    EyeParticle LL06;
    EyeParticle LL07;
    
    //RIGHT EYE
    /*--ASICKLE--*/
    EyeParticle RA01;
    EyeParticle RA02;
    EyeParticle RA03;
    EyeParticle RA04;
    EyeParticle RA05;
    EyeParticle RA06;
    EyeParticle RA07;
    EyeParticle RA08;
    
    
    /*--BSICKLE--*/
    EyeParticle RB02;
    EyeParticle RB03;
    EyeParticle RB04;
    EyeParticle RB05;
    EyeParticle RB06;
    EyeParticle RB07;
    
    /*--CSICKLE--*/
    EyeParticle RC02;
    EyeParticle RC03;
    EyeParticle RC04;
    EyeParticle RC05;
    EyeParticle RC06;
    EyeParticle RC07;
    
    /*--DSICKLE--*/
    EyeParticle RD02;
    EyeParticle RD03;
    EyeParticle RD04;
    EyeParticle RD05;
    EyeParticle RD06;
    EyeParticle RD07;
    
    /*--ESICKLE--*/
    EyeParticle RE02;
    EyeParticle RE03;
    EyeParticle RE04;
    EyeParticle RE05;
    EyeParticle RE06;
    EyeParticle RE07;
    
    /*--FSICKLE--*/
    EyeParticle RF02;
    EyeParticle RF03;
    EyeParticle RF04;
    EyeParticle RF05;
    EyeParticle RF06;
    EyeParticle RF07;
    
    /*--GSICKLE--*/
    EyeParticle RG02;
    EyeParticle RG03;
    EyeParticle RG04;
    EyeParticle RG05;
    EyeParticle RG06;
    EyeParticle RG07;
    
    /*--HSICKLE--*/
    EyeParticle RH02;
    EyeParticle RH03;
    EyeParticle RH04;
    EyeParticle RH05;
    EyeParticle RH06;
    EyeParticle RH07;
    
    /*--ISICKLE--*/
    EyeParticle RI02;
    EyeParticle RI03;
    EyeParticle RI04;
    EyeParticle RI05;
    EyeParticle RI06;
    EyeParticle RI07;
    
    /*--JSICKLE--*/
    EyeParticle RJ02;
    EyeParticle RJ03;
    EyeParticle RJ04;
    EyeParticle RJ05;
    EyeParticle RJ06;
    EyeParticle RJ07;
    
    /*--KSICKLE--*/
    EyeParticle RK02;
    EyeParticle RK03;
    EyeParticle RK04;
    EyeParticle RK05;
    EyeParticle RK06;
    EyeParticle RK07;
    
    /*--LSICKLE--*/
    EyeParticle RL02;
    EyeParticle RL03;
    EyeParticle RL04;
    EyeParticle RL05;
    EyeParticle RL06;
    EyeParticle RL07;
    

    
//PHASE 1 - Setup Canvas.

    void setup()
    {
        //ZEROETH PROCESS
        size(640,480,P3D);
        colorMode(HSB);
        frameRate(60);
        myFont = createFont("HELVETICA", 14);
        textFont(myFont);
        particle = loadImage("particle.png");
        textureMode(NORMALIZED);
        
        //FIRST PROCESS
        LA01 = new EyeParticle('w');
        LA02 = new EyeParticle('w');
        LA03 = new EyeParticle('b');
        LA04 = new EyeParticle('b');
        LA05 = new EyeParticle('b');
        LA06 = new EyeParticle('b');
        LA07 = new EyeParticle('b');
        LA08 = new EyeParticle('b');
        
        LB02 = new EyeParticle('w');
        LB03 = new EyeParticle('b');
        LB04 = new EyeParticle('b');
        LB05 = new EyeParticle('b');
        LB06 = new EyeParticle('b');
        LB07 = new EyeParticle('b');
        
        LC02 = new EyeParticle('w');
        LC03 = new EyeParticle('b');
        LC04 = new EyeParticle('b');
        LC05 = new EyeParticle('b');
        LC06 = new EyeParticle('b');
        LC07 = new EyeParticle('b');
        
        LD02 = new EyeParticle('w');
        LD03 = new EyeParticle('b');
        LD04 = new EyeParticle('b');
        LD05 = new EyeParticle('b');
        LD06 = new EyeParticle('b');
        LD07 = new EyeParticle('b');
        
        LE02 = new EyeParticle('w');
        LE03 = new EyeParticle('b');
        LE04 = new EyeParticle('b');
        LE05 = new EyeParticle('b');
        LE06 = new EyeParticle('b');
        LE07 = new EyeParticle('b');
        
        LF02 = new EyeParticle('w');
        LF03 = new EyeParticle('b');
        LF04 = new EyeParticle('b');
        LF05 = new EyeParticle('b');
        LF06 = new EyeParticle('b');
        LF07 = new EyeParticle('b');
        
        LG02 = new EyeParticle('w');
        LG03 = new EyeParticle('b');
        LG04 = new EyeParticle('b');
        LG05 = new EyeParticle('b');
        LG06 = new EyeParticle('b');
        LG07 = new EyeParticle('b');
        
        LH02 = new EyeParticle('w');
        LH03 = new EyeParticle('b');
        LH04 = new EyeParticle('b');
        LH05 = new EyeParticle('b');
        LH06 = new EyeParticle('b');
        LH07 = new EyeParticle('b');
        
        LI02 = new EyeParticle('w');
        LI03 = new EyeParticle('b');
        LI04 = new EyeParticle('b');
        LI05 = new EyeParticle('b');
        LI06 = new EyeParticle('b');
        LI07 = new EyeParticle('b');
        
        LJ02 = new EyeParticle('w');
        LJ03 = new EyeParticle('b');
        LJ04 = new EyeParticle('b');
        LJ05 = new EyeParticle('b');
        LJ06 = new EyeParticle('b');
        LJ07 = new EyeParticle('b');
        
        LK02 = new EyeParticle('w');
        LK03 = new EyeParticle('b');
        LK04 = new EyeParticle('b');
        LK05 = new EyeParticle('b');
        LK06 = new EyeParticle('b');
        LK07 = new EyeParticle('b');
        
        LL02 = new EyeParticle('w');
        LL03 = new EyeParticle('b');
        LL04 = new EyeParticle('b');
        LL05 = new EyeParticle('b');
        LL06 = new EyeParticle('b');
        LL07 = new EyeParticle('b');
        
        RA01 = new EyeParticle('w');
        RA02 = new EyeParticle('w');
        RA03 = new EyeParticle('b');
        RA04 = new EyeParticle('b');
        RA05 = new EyeParticle('b');
        RA06 = new EyeParticle('b');
        RA07 = new EyeParticle('b');
        RA08 = new EyeParticle('b');
        
        RB02 = new EyeParticle('w');
        RB03 = new EyeParticle('b');
        RB04 = new EyeParticle('b');
        RB05 = new EyeParticle('b');
        RB06 = new EyeParticle('b');
        RB07 = new EyeParticle('b');
        
        RC02 = new EyeParticle('w');
        RC03 = new EyeParticle('b');
        RC04 = new EyeParticle('b');
        RC05 = new EyeParticle('b');
        RC06 = new EyeParticle('b');
        RC07 = new EyeParticle('b');
        
        RD02 = new EyeParticle('w');
        RD03 = new EyeParticle('b');
        RD04 = new EyeParticle('b');
        RD05 = new EyeParticle('b');
        RD06 = new EyeParticle('b');
        RD07 = new EyeParticle('b');
        
        RE02 = new EyeParticle('w');
        RE03 = new EyeParticle('b');
        RE04 = new EyeParticle('b');
        RE05 = new EyeParticle('b');
        RE06 = new EyeParticle('b');
        RE07 = new EyeParticle('b');
        
        RF02 = new EyeParticle('w');
        RF03 = new EyeParticle('b');
        RF04 = new EyeParticle('b');
        RF05 = new EyeParticle('b');
        RF06 = new EyeParticle('b');
        RF07 = new EyeParticle('b');
        
        RG02 = new EyeParticle('w');
        RG03 = new EyeParticle('b');
        RG04 = new EyeParticle('b');
        RG05 = new EyeParticle('b');
        RG06 = new EyeParticle('b');
        RG07 = new EyeParticle('b');
        
        RH02 = new EyeParticle('w');
        RH03 = new EyeParticle('b');
        RH04 = new EyeParticle('b');
        RH05 = new EyeParticle('b');
        RH06 = new EyeParticle('b');
        RH07 = new EyeParticle('b');
        
        RI02 = new EyeParticle('w');
        RI03 = new EyeParticle('b');
        RI04 = new EyeParticle('b');
        RI05 = new EyeParticle('b');
        RI06 = new EyeParticle('b');
        RI07 = new EyeParticle('b');
        
        RJ02 = new EyeParticle('w');
        RJ03 = new EyeParticle('b');
        RJ04 = new EyeParticle('b');
        RJ05 = new EyeParticle('b');
        RJ06 = new EyeParticle('b');
        RJ07 = new EyeParticle('b');
        
        RK02 = new EyeParticle('w');
        RK03 = new EyeParticle('b');
        RK04 = new EyeParticle('b');
        RK05 = new EyeParticle('b');
        RK06 = new EyeParticle('b');
        RK07 = new EyeParticle('b');
        
        RL02 = new EyeParticle('w');
        RL03 = new EyeParticle('b');
        RL04 = new EyeParticle('b');
        RL05 = new EyeParticle('b');
        RL06 = new EyeParticle('b');
        RL07 = new EyeParticle('b');
        
    }
    
//PHASE 2 - Run

    void draw()
    {
        //ZEROETH PROCESS – callibrate and adjust variables
            eyeradius = 75;
            eyedistance = 125;
            referencepointx = width/4 + quadrantx + fearfactorx;
            referencepointy = height/4 + quadranty + fearfactory;
            referencepointz = height/4;
            lefteyeposx = referencepointx - eyedistance;
            lefteyeposy = referencepointy;
            lefteyeposz = referencepointz;
            righteyeposx = referencepointx + eyedistance;
            righteyeposy = referencepointy;
            righteyeposz = referencepointz;
            lefteyeroty = atan((mouseX-lefteyeposx)/lefteyeposz);
            lefteyerotx = atan((mouseY-lefteyeposy)/lefteyeposz);
            righteyeroty = atan((mouseX-righteyeposx)/lefteyeposz);
            righteyerotx = atan((mouseY-righteyeposy)/lefteyeposz);;
            
        //FIRST PROCESS
            background(.90*255);
            
//            /*------Mode Initial-------*/  -------------------------RESERVED FOR PART 2 OF ASSIGNMENT-----------------------------
//            if(nowtime<=3*frameRate) 
//            {
//                mousepastx = mouseX;
//                mousepasty = mouseY;
//            }
//            if(nowtime>3*frameRate && (mouseX != mousepastx || mouseY != mousepasty) && activitymode==1)
//            {
//                activitymode = 2;
//                thentime = nowtime;
//            }
//            /*------Mode 1-------------*/
//            else if(activitymode==1)
//            {
//                if(mousepastx!=mouseX || mousepasty!=mouseY) activitymode = 2;
//            }
//            /*------Mode 2-------------*/
//            else if(activitymode==2 && nowtime<=(thentime + (1)*frameRate))
//            {
//                //hi father    
//            }
//            else if(activitymode==2 && nowtime>(thentime + (1)*frameRate))
//            {
//                activitymode = 3;
//                thentime = nowtime;
//            }
//            /*------Mode 3-------------*/
//            else if(activitymode==3)
//            {
//                if(mousepastx == mouseX && mousepasty == mouseY)
//                { 
//                    stilltime++;
//                    if(stilltime>=3*frameRate)
//                    { 
//                        activitymode = 4;
//                        thentime = nowtime;
//                    }
//                }
//                else
//                { 
//                    mousepastx = mouseX;
//                    mousepasty = mouseY;
//                    stilltime = 0;
//                }
//            }
//            /*------Mode 4-------------*/
//            else if(activitymode==4)
//            {
//                activitymode = 1;
//                thentime = nowtime;
//            }
        //SECOND PROCESS
            if(quadrantmode==1) //Quadrant 1
            {
                quadrantx = width/2;
                quadranty = 0;
                
                if(mouseX > .5*width && mouseY < .5*height)
                {
                    fearfactorx = (.25*width) - (.75*width - mouseX) + 45;
                    fearfactory = -1*(.5*height - mouseY) - 100;
                
                    if(dist(mouseX,mouseY,width,0)<dist(.75*width,.25*height,width,0) + 45)
                    {
                        pastreferencepointx = referencepointx;
                        pastreferencepointy = referencepointy;
                        quadrantmode = switchQuadrant(1);
                        activitymode = 3.5;
                        fearfactorx = 0;
                        fearfactory = 0;
                        thentime = nowtime;
                        println("how many times am i doing this");
                    }
                }
                else
                {
                    fearfactorx = 0;
                    fearfactory = 0;
                }
            }
            else if(quadrantmode==2) //Quadrant 2
            {
                quadrantx = width/2;
                quadranty = height/2;
                
                if(mouseX > .5*width && mouseY > .5*height)
                {
                    fearfactorx = (.25*width) - (.75*width - mouseX) + 45;
                    fearfactory = (mouseY - .25*height) - 100;
                
                    if(dist(mouseX,mouseY,width,height)<dist(.75*width,.75*height,width,height) + 45)
                    {
                        pastreferencepointx = referencepointx;
                        pastreferencepointy = referencepointy;
                        quadrantmode = switchQuadrant(1);
                        activitymode = 3.5;
                        fearfactorx = 0;
                        fearfactory = 0;
                        thentime = nowtime;
                    }
                }
                else
                {
                    fearfactorx = 0;
                    fearfactory = 0;
                }
            }
            else if(quadrantmode==3) // Quadrant 3
            {
                quadrantx = 0;
                quadranty = height/2;
                
                if(mouseX < .5*width && mouseY > .5*height)
                {
                    fearfactorx =  -1*(.5*width - mouseX) - 45;
                    fearfactory = (mouseY - .25*height) - 100;
                
                    if(dist(mouseX,mouseY,0,height)<dist(.25*width,.75*height,0,height) + 45)
                    {
                        pastreferencepointx = referencepointx;
                        pastreferencepointy = referencepointy;
                        quadrantmode = switchQuadrant(1);
                        activitymode = 3.5;
                        fearfactorx = 0;
                        fearfactory = 0;
                        thentime = nowtime;
                    }
                }
                else
                {
                    fearfactorx = 0;
                    fearfactory = 0;
                }
            }
            else if(quadrantmode==4) // Quadrant 4
            {
                quadrantx = 0;
                quadranty = 0;
                
                if(mouseX < .5*width && mouseY < .5*height)
                {
                    fearfactorx =  -1*(.5*width - mouseX) - 45;
                    fearfactory = -1*(.5*height - mouseY) - 100;
                
                    if(dist(mouseX,mouseY,0,0)<dist(.25*width,.25*height,0,0) + 45)
                    {
                        pastreferencepointx = referencepointx;
                        pastreferencepointy = referencepointy;
                        quadrantmode = switchQuadrant(1);
                        activitymode = 3.5;
                        fearfactorx = 0;
                        fearfactory = 0;
                        thentime = nowtime;
                    }
                }
                else
                {
                    fearfactorx = 0;
                    fearfactory = 0;
                }
            }
        //THIRD PROCESS
            if(activitymode == 3)
            {
                //LEFT EYE
                LA08.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 1.000*PI, 0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 5*hinderance, hueue, nowtime);

                LL07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI, 0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
                LK07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI, 0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                LJ07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI, 0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);                        
                LI07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI, 0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
                LH07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI, 0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);           
                LG07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius,-0.833*PI,-0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                LF07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI,-0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
                LE07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI,-0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                LD07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI,-0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
                LC07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI,-0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                LB07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI,-0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
                LA07.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.833*PI, 0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
            
                LL06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI, 0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LK06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI, 0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LJ06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI, 0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LI06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI, 0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LH06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI, 0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LG06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius,-0.667*PI,-0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LF06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI,-0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LE06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI,-0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LD06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI,-0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LC06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI,-0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LB06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI,-0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                LA06.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.667*PI, 0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
            
                LL05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI, 0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LK05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI, 0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LJ05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI, 0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LI05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI, 0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LH05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI, 0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LG05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius,-0.500*PI,-0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LF05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI,-0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LE05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI,-0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LD05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI,-0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LC05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI,-0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LB05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI,-0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                LA05.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.500*PI, 0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
            
                LL04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI, 0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LK04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI, 0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LJ04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI, 0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LI04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI, 0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LH04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI, 0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LG04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius,-0.333*PI,-0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LF04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI,-0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LE04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI,-0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LD04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI,-0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LC04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI,-0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LB04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI,-0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                LA04.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.333*PI, 0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
            
                LL03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI, 0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                LK03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI, 0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LJ03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI, 0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LI03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI, 0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LH03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI, 0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                LG03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius,-0.167*PI,-0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                LF03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI,-0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LE03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI,-0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LD03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI,-0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LC03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI,-0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LB03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI,-0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LA03.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.167*PI, 0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
            
                LL02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI, 0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                LK02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI, 0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                LJ02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI, 0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                LI02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI, 0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                LH02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI, 0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LG02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius,-0.083*PI,-0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LF02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI,-0.833*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LE02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI,-0.667*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LD02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI,-0.500*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LC02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI,-0.333*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                LB02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI,-0.167*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                LA02.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.083*PI, 0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
            
                LA01.plot(lefteyeposx,lefteyeposy,lefteyeposz,eyeradius, 0.000*PI, 0.000*PI, lefteyeroty, lefteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
            
                //RIGHT EYE
                RA08.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 1.000*PI, 0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 5*hinderance, hueue, nowtime);
         
                RL07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI, 0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RK07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI, 0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RJ07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI, 0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
                RI07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI, 0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RH07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI, 0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RG07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius,-0.833*PI,-0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RF07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI,-0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RE07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI,-0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RD07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI,-0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RC07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI,-0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RB07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI,-0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
                RA07.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.833*PI, 0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 4*hinderance, hueue, nowtime);
            
                RL06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI, 0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RK06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI, 0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RJ06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI, 0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RI06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI, 0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RH06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI, 0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RG06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius,-0.667*PI,-0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RF06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI,-0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RE06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI,-0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RD06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI,-0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RC06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI,-0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RB06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI,-0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
                RA06.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.667*PI, 0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 3*hinderance, hueue, nowtime);
            
                RL05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI, 0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RK05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI, 0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RJ05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI, 0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RI05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI, 0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RH05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI, 0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RG05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius,-0.500*PI,-0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RF05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI,-0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);            
                RE05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI,-0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RD05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI,-0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RC05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI,-0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RB05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI,-0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
                RA05.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.500*PI, 0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 2*hinderance, hueue, nowtime);
            
                RL04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI, 0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RK04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI, 0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RJ04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI, 0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RI04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI, 0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RH04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI, 0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RG04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius,-0.333*PI,-0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RF04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI,-0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RE04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI,-0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RD04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI,-0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RC04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI,-0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RB04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI,-0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
                RA04.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.333*PI, 0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 1*hinderance, hueue, nowtime);
            
                RL03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI, 0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RK03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI, 0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RJ03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI, 0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RI03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI, 0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RH03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI, 0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RG03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius,-0.167*PI,-0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RF03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI,-0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RE03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI,-0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RD03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI,-0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RC03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI,-0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RB03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI,-0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RA03.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.167*PI, 0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
            
                RL02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI, 0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RK02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI, 0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RJ02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI, 0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RI02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI, 0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RH02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI, 0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RG02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius,-0.083*PI,-0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RF02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI,-0.833*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RE02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI,-0.667*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RD02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI,-0.500*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RC02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI,-0.333*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
                RB02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI,-0.167*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
                RA02.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.083*PI, 0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
            
                RA01.plot(righteyeposx,righteyeposy,righteyeposz,eyeradius, 0.000*PI, 0.000*PI, righteyeroty, righteyerotx, wavelength, frequency, 0*hinderance, hueue, nowtime);
            }
            else if(activitymode == 3.5)
            {
                  activitymode = 3;
//                expansion = 300*.5*cos(((nowtime - thentime)/60)*2*PI + PI) + 300*.5;
//                acceleration = -.5*cos(((nowtime - thentime)/60)*2*PI + PI) + .5;
//                flipx = -2*((nowtime - thentime)/60)*PI;
//                flipy = 2*((nowtime - thentime)/60)*PI;
//                
//                move = 1 - ((nowtime-thentime)/60);
//                
//                displacementx = pastreferencepointx - referencepointx;
//                displacementy = pastreferencepointy - referencepointy;
//                
//                //LEFT EYE
//                LA08.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 1.000*PI, 0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 5*hinderance, hueue, nowtime);
//
//                LL07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI, 0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
//                LK07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI, 0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                LJ07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI, 0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);                        
//                LI07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI, 0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
//                LH07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI, 0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);           
//                LG07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion,-0.833*PI,-0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                LF07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI,-0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
//                LE07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI,-0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                LD07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI,-0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
//                LC07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI,-0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                LB07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI,-0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
//                LA07.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.833*PI, 0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//            
//                LL06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI, 0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LK06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI, 0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LJ06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI, 0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LI06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI, 0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LH06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI, 0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LG06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion,-0.667*PI,-0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LF06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI,-0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LE06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI,-0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LD06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI,-0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LC06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI,-0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LB06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI,-0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                LA06.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.667*PI, 0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//            
//                LL05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI, 0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LK05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI, 0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LJ05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI, 0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LI05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI, 0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LH05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI, 0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LG05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion,-0.500*PI,-0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LF05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI,-0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LE05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI,-0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LD05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI,-0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LC05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI,-0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LB05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI,-0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                LA05.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.500*PI, 0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//            
//                LL04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI, 0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LK04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI, 0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LJ04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI, 0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LI04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI, 0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LH04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI, 0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LG04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion,-0.333*PI,-0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LF04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI,-0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LE04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI,-0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LD04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI,-0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LC04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI,-0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LB04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI,-0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                LA04.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.333*PI, 0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//            
//                LL03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI, 0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                LK03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI, 0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LJ03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI, 0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LI03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI, 0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LH03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI, 0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                LG03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion,-0.167*PI,-0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                LF03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI,-0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LE03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI,-0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LD03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI,-0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LC03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI,-0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LB03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI,-0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LA03.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.167*PI, 0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//            
//                LL02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI, 0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                LK02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI, 0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                LJ02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI, 0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                LI02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI, 0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                LH02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI, 0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LG02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion,-0.083*PI,-0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LF02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI,-0.833*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LE02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI,-0.667*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LD02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI,-0.500*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LC02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI,-0.333*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                LB02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI,-0.167*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                LA02.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.083*PI, 0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//            
//                LA01.plot(lefteyeposx+(move*displacementx),lefteyeposy+(move*displacementy),lefteyeposz,eyeradius+expansion, 0.000*PI, 0.000*PI, lefteyerotx+flipy, lefteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//            
//                //RIGHT EYE
//                RA08.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 1.000*PI, 0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 5*hinderance, hueue, nowtime);
//         
//                RL07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI, 0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RK07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI, 0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RJ07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI, 0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);            
//                RI07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI, 0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RH07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI, 0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RG07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion,-0.833*PI,-0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RF07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI,-0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RE07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI,-0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RD07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI,-0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RC07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI,-0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RB07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI,-0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//                RA07.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.833*PI, 0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 4*hinderance, hueue, nowtime);
//            
//                RL06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI, 0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RK06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI, 0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RJ06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI, 0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RI06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI, 0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RH06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI, 0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RG06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion,-0.667*PI,-0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RF06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI,-0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RE06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI,-0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RD06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI,-0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RC06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI,-0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RB06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI,-0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//                RA06.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.667*PI, 0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 3*hinderance, hueue, nowtime);
//            
//                RL05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI, 0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RK05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI, 0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RJ05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI, 0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RI05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI, 0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RH05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI, 0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RG05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion,-0.500*PI,-0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RF05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI,-0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);            
//                RE05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI,-0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RD05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI,-0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RC05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI,-0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RB05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI,-0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//                RA05.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.500*PI, 0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 2*hinderance, hueue, nowtime);
//            
//                RL04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI, 0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RK04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI, 0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RJ04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI, 0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RI04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI, 0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RH04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI, 0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RG04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion,-0.333*PI,-0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RF04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI,-0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RE04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI,-0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RD04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI,-0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RC04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI,-0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RB04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI,-0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//                RA04.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.333*PI, 0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 1*hinderance, hueue, nowtime);
//            
//                RL03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI, 0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RK03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI, 0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RJ03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI, 0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RI03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI, 0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RH03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI, 0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RG03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion,-0.167*PI,-0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RF03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI,-0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RE03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI,-0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RD03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI,-0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RC03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI,-0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RB03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI,-0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RA03.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.167*PI, 0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//            
//                RL02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI, 0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RK02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI, 0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RJ02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI, 0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RI02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI, 0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RH02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI, 0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RG02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion,-0.083*PI,-0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RF02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI,-0.833*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RE02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI,-0.667*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RD02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI,-0.500*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RC02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI,-0.333*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                RB02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI,-0.167*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);            
//                RA02.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.083*PI, 0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//            
//                RA01.plot(righteyeposx+(move*displacementx),righteyeposy+(move*displacementy),righteyeposz,eyeradius+expansion, 0.000*PI, 0.000*PI, righteyeroty+flipy, righteyerotx+flipx, wavelength, frequency, 0*hinderance, hueue, nowtime);
//                
//                if(nowtime>thentime+60) activitymode = 3;
            }
            
        //SECOND PROCESS
            if(nowtime<=fadetime*frameRate)
            {
                noStroke();
                fill(255, (1-(nowtime/(fadetime*frameRate)))*255);
                rect(0,0,width,height);
            }
        //THIRD PROCESS
            
        //SECOND LAST PROCESS
            if(displaydata == 1)
            {   
                /*--Displace reference points--*/
                stroke(255,255,255);
                strokeWeight(1);
                pushMatrix();
                translate(0,0,-referencepointz);
                line(lefteyeposx-2.5,lefteyeposy,lefteyeposx+2.5,lefteyeposy);
                line(lefteyeposx,lefteyeposy-2.5,lefteyeposx,lefteyeposy+2.5);
                line(righteyeposx-2.5,righteyeposy,righteyeposx+2.5,righteyeposy);
                line(righteyeposx,righteyeposy-2.5,righteyeposx,righteyeposy+2.5);
                popMatrix();
                
                /*--Creat background for data--*/
                for (int i=0;i<=(datawidth+5);i++)
                {
                    if(i<=datawidth)
                    {
                        stroke(0,(.75*255));
                        strokeWeight(1);
                        line(width-i,0,width-i,height+3);
                    }
                    else
                    {
                        stroke(255,.5*255);
                        strokeWeight(1);
                        line(width-i,0,width-i,height+3);
                    }
                }
                /*--parse time for data--*/
                if( second() != pastsecond)
                {
                    seconds++;
                    pastsecond = second();    
                }
                time = floor(seconds/60) + ":" + nf( seconds - 60*floor(seconds/60),2);

                /*--print data to screen--*/
                fill(255);
                textMode(SCREEN);
                text(
                   "\nSKETCH DATA\n\n\nelapsed time: "+time+"\n\nL.E.Rot: "+int(degrees(lefteyeroty))+"˚,"+int(degrees(lefteyerotx))+"˚\nR.E.Rot: "+int(degrees(righteyeroty))+"˚,"+int(degrees(righteyerotx))+"˚\n\nactivity mode: "+activitymode+"\n\nmouse still counter: "+stilltime+"\n\nnowtime: "+nowtime+"\nthentime: "+thentime,
                    width-datawidth+10,
                    15); 
                }
            
        //LAST PROCESS
            counter++;
            nowtime++;
        //TEST PROCESSES    
    }
    
 //PHASE 3 – Classes and function declarations
    class EyeParticle
    {
        float eyePositionX;
        float eyePositionY;
        float eyePositionZ;
        float eyeRadius;
        float radialDisplacementY;
        float radialDisplacementZ;
        float eyeRotY;
        float eyeRotX;
        float x;
        float y;
        float z;
        float theta;
        float phi;
        float xzhypoteneuse;
        float yzhypoteneuse;
        float dx = 0;
        float dy = 0;
        float dzx = 0;
        float dzy = 0;
         char type;
          int nowtime = 0;
          int thentime = 0;
        float fequency = 0; //number of pulses per second
        float wavelength = 0; //duration of pulse in seconds
        float hinderance = 0; //delay time in seconds
        float hueue = 0;
        float dynasat = 0;
        
        EyeParticle(char tempType)
        {
            type = tempType;   
        }
        
        void plot (float tempEyePositionX, float tempEyePositionY, float tempEyePositionZ, float tempEyeRadius, float tempRadialDisplacementY, float tempRadialDisplacementZ, float tempEyeRotY, float tempEyeRotX, float tempWavelength, float tempFrequency, float tempHinderance, float tempHueue, int tempNowtime)
        {
            eyePositionX = tempEyePositionX;
            eyePositionY = tempEyePositionY;
            eyePositionZ = tempEyePositionZ;
            eyeRadius = tempEyeRadius;
            
            radialDisplacementY = tempRadialDisplacementY;
            radialDisplacementZ = tempRadialDisplacementZ;
            
            eyeRotY = tempEyeRotY;
            eyeRotX = tempEyeRotX;
            
            frequency = tempFrequency;
            wavelength = tempWavelength;
            hinderance = tempHinderance;
            hueue = tempHueue;
            nowtime = tempNowtime;
            
            //Rotate the Eye by translating invididual particles
                //STEP 1: Find coordinates relative to origin of eye
                x = cos(radialDisplacementZ)*(eyeRadius*sin(radialDisplacementY));
                y = sin(radialDisplacementZ)*(eyeRadius*sin(radialDisplacementY));
                z = (eyeRadius*cos(radialDisplacementY));
            
                //STEP 2: Find hypoteneuse of coordinate in its respective yz-plane.
                yzhypoteneuse = sqrt(sq(z)+sq(y));
             
                //STEP 3: Find phi (rotational displacement X [0,2PI]);
                if(y<=0 && z==0) phi = -1*(1/2)*PI;
                else if(y>0 && z==0) phi = -1*(3/2)*PI;
                else if(y<=0 && z>0) phi = atan(y/z);
                else if(y<=0 && z<=0) phi = -1*PI + atan(y/z);
                else if(y>0 && z<=0) phi = -1*PI + atan(y/z);
                else phi = -2*PI + atan(y/z);
                            
                //STEP 4: Rotate-X 
                dy = yzhypoteneuse*sin(phi+eyeRotX) - y;
                dzy = yzhypoteneuse*cos(phi+eyeRotX) - z;
            
                //STEP 5: Update coordinates z and dzy info to find xzhypotenuese
                xzhypoteneuse = sqrt(sq(z+dzy)+sq(x)); // x has no displacement yet, because only y and z coordinates have changed
                
                //STEP 6: Find theta (rotational Displacement Y [0.2PI])
                if(x<0 && (z+dzy)==0) theta = (3/2)*PI;
                else if(x>=0 && (z+dzy)==0) theta = (1/2)*PI;
                else if(x>=0 && (z+dzy)>0) theta = atan(x/(z+dzy));
                else if(x>=0 && (z+dzy)<0) theta = PI + atan(x/(z+dzy));
                else if(x<0 && (z+dzy)<0) theta = PI + atan(x/(z+dzy));
                else if(x<0 && (z+dzy)>0) theta = (2)*PI + atan(x/(z+dzy));   
                
                //STEP 7: Rotate-Y
                dx = xzhypoteneuse*sin(theta+eyeRotY) - x;
                dzx = xzhypoteneuse*cos(theta+eyeRotY) - (z+dzy);
            
                //STEP 8: Print rotated Eye to Screen
            
            //Determine Particle Colour
                if(nowtime <= (thentime+(frequency*60)+(hinderance*60)+(wavelength*60)))
                {
                    if(nowtime < (thentime + (frequency*60) + (hinderance*60))) dynasat = 0;
                    else dynasat = (.5*255)*cos( (((wavelength*60)-(thentime+(frequency*60)+(hinderance*60)+(wavelength*60) - nowtime))/(wavelength*60)) * (2 * PI) + (PI)) + (.5*255);
                }
                else
                {
                    dynasat = 0;  
                    thentime = nowtime;
                    //println("success");
                }
            
            //Print particle
                pushMatrix();
                    translate(x+dx,y+dy,z+dzx+dzy-eyePositionZ);    
                    if(type=='w') tint(0,0,255);
                    else tint(hueue,255,dynasat);
                    image(particle,eyePositionX-20,eyePositionY-20); 
                popMatrix();
            }
        }
        
 //END =)




