

  float xPos;
  float yPos;
  float amplitude;
  void setup (){
    size (300, 300);
    xPos =width;
    yPos = height;
    amplitude= 100;
    
     background (#0AF7E5);
  }
  
  void draw () {
    smooth();
    noStroke();
   
    float centerX= 150;
    float amplitude =100;
    float periodX = 0.06;
    float periodY =0.03;
    xPos = centerX + amplitude*(2*sin((millis()*periodX)));
    yPos =centerX +amplitude*cos ((millis ()*periodY));
    fill (255, 35);
    rect (xPos, yPos, 30, 30);
    

  }

