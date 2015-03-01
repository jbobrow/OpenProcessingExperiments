
    //a module exmaple for XIUMI
    
    PImage background;
    float x1,y1,x2,y2,x3,y3,x4,y4;
    int frameWidth = 15, frameHeight = 10;
    PFont mainfont;
    String Lorm = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    int textWidth = width/2+200;
    int textHeight = 100;
    int padding = 15;
    
    float enlarge = 40;
    int strokeAlpha=100;
    
    int textAlpha = 50;
    
    int adjust=-10;
    
    void setup(){
      size(320,480);
      frameRate(24);
      background = loadImage("sakura.jpg");
      image(background,0,0);
  
      stroke(0);
      strokeWeight(1);
      noFill();
      x1 = width/2-textWidth/2-padding; y1 = height/2-80-padding+adjust;
      x2 = width/2+textWidth/2+padding; y2 = height/2-80-padding+adjust;
      x3 = width/2-textWidth/2-padding; y3 = height/2-80+textHeight+padding+adjust;
      x4 = width/2+textWidth/2+padding; y4 = height/2-80+textHeight+padding+adjust;
      
      
      //text
      mainfont = loadFont("HelveticaNeue-Medium-48.vlw");
      textFont(mainfont);
      
    }
    
    void draw(){
      image(background,0,0);
      //title
      textSize(25);
      fill(102);
      text("Title",x1,y1-20);
      //draw body text
      if(frameCount>6){
        textSize(16);
        noStroke();
        fill(255,textAlpha-200);
        rect(x1,y1,textWidth+padding*2,textHeight+padding*2);
        fill(56,textAlpha);
        if(textAlpha<255) textAlpha+=20;
        text(Lorm,width/2-textWidth/2,height/2-80+adjust,textWidth,textHeight);
    }
    
    
      stroke(245,150,175,strokeAlpha);
      if(strokeAlpha<255) strokeAlpha+=15;
  
      noFill();
      strokeWeight(1);
      beginShape();
      vertex(x1+enlarge,y1+enlarge);
      vertex(x2-enlarge,y2+enlarge);
      vertex(x4-enlarge,y4-enlarge);
      vertex(x3+enlarge,y3-enlarge);
      endShape(CLOSE);
      if(enlarge>0) enlarge-=4;
    
    //draw box frame;
      strokeWeight(6);
      
      line(x1+enlarge,y1+enlarge,x1+enlarge,y1+enlarge+frameHeight);
      line(x1+enlarge,y1+enlarge,x1+enlarge+frameWidth,y1+enlarge);
      
      line(x2-enlarge,y2+enlarge,x2-enlarge,y2+enlarge+frameHeight);
      line(x2-enlarge,y2+enlarge,x2-enlarge-frameWidth,y2+enlarge);
      
      line(x3+enlarge,y3-enlarge,x3+enlarge,y3-enlarge-frameHeight);
      line(x3+enlarge,y3-enlarge,x3+enlarge+frameWidth,y3-enlarge); 
      
      line(x4-enlarge,y4-enlarge,x4-enlarge,y4-enlarge-frameHeight);
      line(x4-enlarge,y4-enlarge,x4-enlarge-frameWidth,y4-enlarge);
    
  
        
      
      println(frameCount,enlarge);
    }



