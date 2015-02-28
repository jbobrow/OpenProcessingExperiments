
class Construct extends Incubator{
  
  float endAngle;
  
  int screenWidth = 900;
  int screenHeight = 900;

  int radius  =  screenHeight/5;  

  int radialx =  screenWidth/2; 
  int radialy =  screenHeight/2;
  
  color backgroudColor = color(239,239,225);
  color componentColor = color(86,99,113);    
  
  
  void renderRadialStats(){
   
    fill(0);
    textFont(createFont("DejaVu Sans",10));
    text("Projects in database: " + data.length +"\nDisplayed projects: " + projects.size() + "\nTotal sq. m displayed: " + projects.findtotalFloorSpace(),5,50);
    
  }
  
  
  
  
  
  
  
  
  void renderBackground(){
    background(backgroudColor);
    
    renderRadialStats();
    
    float x,y;   
    noFill();
    strokeWeight(1);
    stroke(187,187,157);
    
   arc(radialx,radialy,radius*2+400,radius*2+400,startAngle,startAngle+PI);
  
    
    pushMatrix();

    translate(radialx,radialy);
    x = cos(startAngle) * (radius+205);
    y = sin(startAngle) * (radius+205);
    translate(x,y);
    rotate(startAngle+HALF_PI);
    fill(0);  
    textAlign(LEFT,BASELINE);
    textFont(createFont("DejaVu Sans",10));
    text("300 m",0,0);
     
    popMatrix();
    
    fill(color(59,35,57));
    rect(0,925,1000,100);
    
   
     
  }
  
  void renderDateRef(){
    
    pushMatrix();
    
    translate(radialx,radialy);
    float x = cos(startAngle) * (radius-25);
    float y = sin(startAngle) * (radius-25);
 
    translate(x,y);
    rotate(startAngle+PI);
    
    fill(0);
    strokeWeight(1);
    stroke(0);
    line(0,15,-250,15);
   
    textAlign(LEFT,TOP);
    textFont(createFont("DejaVu Sans",12,true));
    text(dateMin,-250,15);
   
   
    popMatrix();
    
    strokeWeight(1);
    
    noFill();
    arc(radialx,radialy,((radius-25)*2),((radius-25)*2),startAngle-.09, endAngle+.09);
    
    pushMatrix();
    
    translate(radialx,radialy);
     x = cos(endAngle) * (radius-25);
     y = sin(endAngle) * (radius-25);
 
    translate(x,y);
    rotate(endAngle+PI);
    
    fill(0);
    strokeWeight(1);
    stroke(0);
    line(0,-15,-250,-15);
   
      

    textAlign(LEFT,BOTTOM);
    textFont(createFont("DejaVu Sans",12,true));
    text(dateMax,-250,-15);
   
   
    popMatrix();
   

  }
  
 
}

