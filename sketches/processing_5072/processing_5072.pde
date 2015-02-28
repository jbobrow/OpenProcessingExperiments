
class Line {
  
  //Declare variables 
  float x = 6;
  float y = 0;  
  
  //Constructor function 
  Line(){
    
  };
  
  //Crawl
  void crawl () {
    x = random(-1000,100000);
    y = random(-10000,10000);
    
    fill(100,30,90);
    stroke(30);
    ellipse(x,y,30,100);
    fill(50,30,40);
    stroke(50,20);/*in this case the 30 number is the grayscale number and 20 is the alpha number*/
    line(x,y,0,0);
  };
    
};

