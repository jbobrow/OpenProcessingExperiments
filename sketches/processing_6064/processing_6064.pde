
class circ {
    float stx,sty,stangle,sx,sy,sdist;
    float sangle;
    int id;
    float  vred,vblue,vgreen;
    float nextx,nexty;
    int sweight; 
    float offagex,offagey;
    int age;
    float gfactor;
    float speed;
    color sColor;
    float sColorVariation;
    
    circ (int thisx, int thisy, int startDist, float startAngle, int num) {
      age=1;
      sx=thisx;
      stx=thisx;
      sy=thisy;
      sty=thisy;
      sColor=currentColor;
      id=num;
      sdist=startDist;
      sangle=startAngle;
      stangle=sangle;
      sColorVariation=random(colorVariation/2)-colorVariation;
      // print("created");
      
       //currentColor++;
       sColor=currentColor;   
       //if we are at the end, we go back to the start
        if (sColor==colorArray.length-1){
          sColor=0;
          currentColor=0;
          //print("reset colorArray:");
        } 
        
       //We add random[colorVariation] to make it interesting.
         color c = colorArray[sColor];
         //print ("changed to:"+int(red(c))+","+int(green(c))+","+int(blue(c))+"\n");
         vblue=blue(c)+random(colorVariation);
         vred=red(c)+ random(colorVariation);
         vgreen=green(c)+random(colorVariation);
         
      
      //vblue=vred/(1+random(vblueratio));
      //vgreen=vred/(1+random(vgreenratio));
      speed=random(20)-10;
      gfactor=random(10)-5;
      //gfactor=20;
      nextx=sx;
      nexty=sy;
    }
    
    void move() {
        //print ("nx:"+nextx+",ny:"+nexty+"sx:"+sx+"sy:"+sy+"\n");
        //sangle+=sin(137.5/360*TWO_PI);
        sangle+=sin(PI/360 * age * speed);
        float xadder= sin(sangle) * gfactor;
        float yadder= cos(sangle) * gfactor;
        //print ("x adder:"+xadder+" y adder:"+yadder+"\n");
        nextx += xadder;
        nexty += yadder;
        sweight=int((colorChange-age)/5)+1;
        strokeWeight(sweight);
        //print(nextx+"\n"); 
        stroke(vred,vgreen,vblue,55);
        curve(sx,sy,sx,sy,nextx,nexty,nextx,nexty);
        sx=nextx;
        sy=nexty;
        // Change Color event ColorChange Frames.
        if (age==colorChange){
          age=0;
          sColor++;
          
       //if we are at the end, we go back to the start
        if (sColor==colorArray.length-1){
          sColor=0;
          //print("reset colorArray:");
        } 
        
       //We add random[colorVariation] to make it interesting.
         color c = colorArray[sColor];
         //print ("changed to:"+int(red(c))+","+int(green(c))+","+int(blue(c))+"\n");
         vblue=blue(c)+random(colorVariation);
         vred=red(c)+ random(colorVariation);
         vgreen=green(c)+random(colorVariation);
         
          speed=random(10)-5;
          gfactor=random(10)-5;
          sx=stx;
          sy=sty;
          sangle=stangle;
          nextx=sx;
          nexty=sy;
        }
        age++;
 
      }
}

