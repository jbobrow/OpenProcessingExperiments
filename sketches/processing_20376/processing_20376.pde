
//PHASE 0 – Initial Variables
        int backgroundimage;
      float bodyx, bodyy;
      float logox, logoy;
      float dice;
     
     PImage abackgroundimage, bbackgroundimage, cbackgroundimage, dbackgroundimage, ebackgroundimage, fbackgroundimage;
     PImage abody, bbody, cbody, dbody, ebody;
     PImage alogo, blogo, clogo, dlogo, elogo,flogo,glogo,hlogo;

//PHASE 1 – Setup Canvas and Load Images
    void setup()
    {
        abackgroundimage = loadImage("background1.png");
        bbackgroundimage = loadImage("background2.png");
        cbackgroundimage = loadImage("background3.png");
        dbackgroundimage = loadImage("background4.png");
        ebackgroundimage = loadImage("background5.png");
        fbackgroundimage = loadImage("background6.png");
        abody = loadImage("character1.png");
        bbody = loadImage("character2.png");
        cbody = loadImage("character3.png");
        dbody = loadImage("character4.png");
        ebody = loadImage("character5.png");
        alogo = loadImage("logo1.png");
        blogo = loadImage("logo2.png");
        clogo = loadImage("logo3.png");
        dlogo = loadImage("logo4.png");
        elogo = loadImage("logo5.png");
        flogo = loadImage("logo6.png");
        glogo = loadImage("logo7.png");
        hlogo = loadImage("logo8.png");
        size(640,480);
    }
    
//PHASE 2 - Begin Logic and Drawing Output
    void draw()
    {
        //FIRST – set strait that no loop is allowed!!!
        noLoop();
        
        //SECOND - update variables so positions are re-arranged
        println("whattup");
        
        //THIRD - draw image
        dice = round(random(1,6));
        if(dice==1) image(abackgroundimage,0,0);
        else if(dice==2) image(bbackgroundimage,0,0);
        else if(dice==3) image(cbackgroundimage,0,0);
        else if(dice==4) image(dbackgroundimage,0,0);
        else if(dice==5) image(ebackgroundimage,0,0);
        else if(dice==6) image(fbackgroundimage,0,0);
        
        
        dice = round(random(1,10));
        for(int i=1;i<=dice;i++)
        {
            int xpos = round(random(1,width));
            stroke(255,.25*255);
            strokeWeight(.25);
            line(xpos,0,xpos,height);
        }
        
        dice = round(random(1,8));
        if(dice==1) image(alogo,random(0,width-285),random(0,height-200));
        else if(dice==2) image(blogo,random(0,width-285),random(0,height-200));
        else if(dice==3) image(clogo,random(0,width-285),random(0,height-200));
        else if(dice==4) image(dlogo,random(0,width-285),random(0,height-200));
        else if(dice==5) image(elogo,random(0,width-285),random(0,height-200));
        else if(dice==6) image(flogo,random(0,width-285),random(0,height-200));
        else if(dice==7) image(glogo,random(0,width-285),random(0,height-200));
        else if(dice==8) image(hlogo,random(0,width-285),random(0,height-200));
        
      
    }
    
//PHASE 3 - Initialize Necessary Events
    void mousePressed()
    {
        loop();
    }
    

